<?php
class ControllerCheckoutMss extends Controller {
	public function index() {
		// Validate cart has products and has stock.
		if ((!$this->cart->hasProducts() && empty($this->session->data['vouchers'])) || (!$this->cart->hasStock() && !$this->config->get('config_stock_checkout'))) {
			$this->redirect($this->url->link('checkout/cart'));
		}

		// Validate minimum quantity requirments.
		$products = $this->cart->getProducts();

		foreach ($products as $product) {
			$product_total = 0;

			foreach ($products as $product_2) {
				if ($product_2['product_id'] == $product['product_id']) {
					$product_total += $product_2['quantity'];
				}
			}
				
			if ($product['minimum'] > $product_total) {
				$this->redirect($this->url->link('checkout/cart'));
			}
		}

		$this->language->load('checkout/mss');
			
		$this->data['text_obf_baslik']     = $this->language->get('text_obf_baslik');
		$this->data['text_satici']         = $this->language->get('text_satici');
		$this->data['text_satici_unvani']  = $this->language->get('text_satici_unvani');
		$this->data['text_satici_yetkili'] = $this->language->get('text_satici_yetkili');
		$this->data['text_adres']          = $this->language->get('text_adres');
		$this->data['text_eposta']         = $this->language->get('text_eposta');
		$this->data['text_tel']            = $this->language->get('text_tel');
		$this->data['text_fax']            = $this->language->get('text_fax');
		$this->data['text_tarih']          = $this->language->get('text_tarih');
		$this->data['satici_unvani']       = $this->config->get('config_name');
		$this->data['satici_yetkili']      = $this->config->get('config_owner');
		$this->data['satici_adres']        = $this->config->get('config_address');
		$this->data['satici_eposta']       = $this->config->get('config_email');
		$this->data['satici_tel']          = $this->config->get('config_telephone');
		$this->data['satici_fax']          = $this->config->get('config_fax');

		$this->load->model('account/customer');
		$customer_info = $this->model_account_customer->getCustomer($this->customer->getId());
		$address_id = $this->customer->getAddressId();
		$this->load->model('account/address');
		$address = $this->model_account_address->getAddress($address_id);

		$this->data['text_alici']       = $this->language->get('text_alici');
		$this->data['text_alici_ad']    = $this->language->get('text_alici_ad');
		$this->data['text_alici_soyad'] = $this->language->get('text_alici_soyad');
		$this->data['alici_ad']         = $customer_info['firstname'];
		$this->data['alici_soyad']      = $customer_info['lastname'];
		$this->data['alici_eposta']     = $customer_info['email'];
		$this->data['alici_tel']        = $customer_info['telephone'];
		$this->data['alici_adres_1']    = $address['address_1'];
		$this->data['alici_adres_2']    = $address['address_2'];
		$this->data['alici_postakodu'] 	= $address['postcode'];
		$this->data['alici_sehir'] 	    = $address['city'];
		$this->data['alici_bolge'] 	    = $address['zone'];
		$this->data['alici_ulke'] 	    = $address['country'];

		$this->data['text_sutun_ad']     = $this->language->get('text_sutun_ad');
		$this->data['text_sutun_model']  = $this->language->get('text_sutun_model');
		$this->data['text_sutun_miktar'] = $this->language->get('text_sutun_miktar');
		$this->data['text_sutun_fiyat']  = $this->language->get('text_sutun_fiyat');
		$this->data['text_sutun_toplam'] = $this->language->get('text_sutun_toplam');

		$this->data['products'] = array();

		foreach ($this->cart->getProducts() as $product) {
			$option_data = array();

			foreach ($product['option'] as $option) {
				if ($option['type'] != 'file') {
					$value = $option['option_value'];	
				} else {
					$filename = $this->encryption->decrypt($option['option_value']);
					
					$value = utf8_substr($filename, 0, utf8_strrpos($filename, '.'));
				}
									
				$option_data[] = array(
					'name'  => $option['name'],
					'value' => (utf8_strlen($value) > 20 ? utf8_substr($value, 0, 20) . '..' : $value)
				);
			}  
 
			$this->data['products'][] = array(
				'product_id' => $product['product_id'],
				'name'       => $product['name'],
				'model'      => $product['model'],
				'option'     => $option_data,
				'quantity'   => $product['quantity'],
				'subtract'   => $product['subtract'],
				'price'      => $this->currency->format($this->tax->calculate($product['price'], $product['tax_class_id'], $this->config->get('config_tax'))),
				'total'      => $this->currency->format($this->tax->calculate($product['price'], $product['tax_class_id'], $this->config->get('config_tax')) * $product['quantity']),
				'href'       => $this->url->link('product/product', 'product_id=' . $product['product_id'])
			); 
		} 
		
		// Gift Voucher
		$this->data['vouchers'] = array();
		
		if (!empty($this->session->data['vouchers'])) {
			foreach ($this->session->data['vouchers'] as $voucher) {
				$this->data['vouchers'][] = array(
					'description' => $voucher['description'],
					'amount'      => $this->currency->format($voucher['amount'])
				);
			}
		}  

		$total_data = array();
		$total = 0;
		$taxes = $this->cart->getTaxes();
		
		$this->load->model('setting/extension');
			
		$sort_order = array();
			
		$results = $this->model_setting_extension->getExtensions('total');
			
		foreach ($results as $key => $value) {
			$sort_order[$key] = $this->config->get($value['code'] . '_sort_order');
		}
			
		array_multisort($sort_order, SORT_ASC, $results);
			
		foreach ($results as $result) {
			if ($this->config->get($result['code'] . '_status')) {
				$this->load->model('total/' . $result['code']);
		
				$this->{'model_total_' . $result['code']}->getTotal($total_data, $total, $taxes);
			}
		}
			
		$sort_order = array();
		
		foreach ($total_data as $key => $value) {
			$sort_order[$key] = $value['sort_order'];
		}
		
		array_multisort($sort_order, SORT_ASC, $total_data);
		$this->data['totals'] = $total_data;

		$this->data['text_obf_madde_5_1_b']  = $this->language->get('text_obf_madde_5_1_b');
		$this->data['text_obf_madde_5_1_c']  = sprintf($this->language->get('text_obf_madde_5_1_c'), $total);
		$this->data['text_obf_madde_5_1_c2'] = sprintf($this->language->get('text_obf_madde_5_1_c2'), $this->session->data['shipping_method']['text']);
		$this->data['text_obf_madde_5_1_d']  = sprintf($this->language->get('text_obf_madde_5_1_d'), $this->session->data['payment_method']['title']);
		$this->data['text_obf_madde_5_1_e']  = $this->language->get('text_obf_madde_5_1_e');
		$this->data['text_obf_madde_5_1_f']  = $this->language->get('text_obf_madde_5_1_f');
		$this->data['text_obf_madde_5_1_g']  = $this->language->get('text_obf_madde_5_1_g');
		$this->data['text_obf_madde_5_1_g2'] = $this->language->get('text_obf_madde_5_1_g2');
		$this->data['text_obf_madde_5_1_h']  = $this->language->get('text_obf_madde_5_1_h');
		$this->data['text_obf_madde_5_1_i']  = $this->language->get('text_obf_madde_5_1_i');


		$this->data['text_mss_baslik']     = $this->language->get('text_mss_baslik');
		
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/checkout/mss.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/checkout/mss.tpl';
		} else {
			$this->template = 'default/template/checkout/mss.tpl';
		}

		$this->response->setOutput($this->render());
	}
}
?>