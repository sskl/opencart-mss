<div style="margin: 10px;">
    <h3 style="font-size:15px; background-color:#EEEEEE; padding:9px 0px 9px 40px; border:soold 1px #B6B8D3;"><?php echo $text_obf_baslik; ?></h3>
    <ol>
        <li style="padding: 5px 0;">
		    <table style="border-collapse: collapse; border-left: 1px solid #DDDDDD; border-right: 1px solid #DDDDDD; border-top: 1px solid #DDDDDD; margin-bottom: 20px; width: 100%;">
		        <tr>
		            <th colspan="2" style="background-color: #F7F7F7; border-bottom: 1px solid #DDDDDD; color: #4D4D4D; font-weight: bold; padding: 7px; width: 20%;"><?php echo $text_satici; ?></th>
		        </tr>
		        <tr>
		            <th style="background-color: #F7F7F7; border-bottom: 1px solid #DDDDDD; color: #4D4D4D; font-weight: bold; padding: 7px; width: 20%;"><?php echo $text_satici_unvani; ?></th>
		            <td style="border-bottom: 1px solid #DDDDDD; vertical-align: top; padding: 7px;"><?php echo $satici_unvani; ?></td>
		        </tr>
		        <tr>
		            <th style="background-color: #F7F7F7; border-bottom: 1px solid #DDDDDD; color: #4D4D4D; font-weight: bold; padding: 7px; width: 20%;"><?php echo $text_satici_yetkili; ?></th>
		            <td style="border-bottom: 1px solid #DDDDDD; vertical-align: top; padding: 7px;"><?php echo $satici_yetkili; ?></td>
		        </tr>
		        <tr>
		            <th style="background-color: #F7F7F7; border-bottom: 1px solid #DDDDDD; color: #4D4D4D; font-weight: bold; padding: 7px; width: 20%;"><?php echo $text_adres; ?></th>
		            <td style="border-bottom: 1px solid #DDDDDD; vertical-align: top; padding: 7px;"><?php echo $satici_adres; ?></td>
		        </tr>
		        <tr>
		            <th style="background-color: #F7F7F7; border-bottom: 1px solid #DDDDDD; color: #4D4D4D; font-weight: bold; padding: 7px; width: 20%;"><?php echo $text_eposta; ?></th>
		            <td style="border-bottom: 1px solid #DDDDDD; vertical-align: top; padding: 7px;"><?php echo $satici_eposta; ?></td>
		        </tr>
		        <tr>
		            <th style="background-color: #F7F7F7; border-bottom: 1px solid #DDDDDD; color: #4D4D4D; font-weight: bold; padding: 7px; width: 20%;"><?php echo $text_tel; ?></th>
		            <td style="border-bottom: 1px solid #DDDDDD; vertical-align: top; padding: 7px;"><?php echo $satici_tel; ?></td>
		        </tr>
		        <tr>
		            <th style="background-color: #F7F7F7; border-bottom: 1px solid #DDDDDD; color: #4D4D4D; font-weight: bold; padding: 7px; width: 20%;"><?php echo $text_fax; ?></th>
		            <td style="border-bottom: 1px solid #DDDDDD; vertical-align: top; padding: 7px;"><?php echo $satici_fax; ?></td>
		        </tr>
		    </table>
		</li>
		<li style="padding: 5px 0;">
			<?php echo $text_obf_madde_5_1_b; ?>
			<div>
		        <table style="border-collapse: collapse; width: 100%; border-top: 1px solid #DDDDDD; border-left: 1px solid #DDDDDD; margin-bottom: 20px;">
			        <thead>
			            <tr>
		                    <td style="font-size: 12px; border-right: 1px solid #DDDDDD; border-bottom: 1px solid #DDDDDD; background-color: #EFEFEF; font-weight: bold; text-align: left; padding: 7px; color: #222222;"><?php echo $text_sutun_ad; ?></td>
		                    <td style="font-size: 12px; border-right: 1px solid #DDDDDD; border-bottom: 1px solid #DDDDDD; background-color: #EFEFEF; font-weight: bold; text-align: left; padding: 7px; color: #222222;"><?php echo $text_sutun_model; ?></td>
		                    <td style="font-size: 12px; border-right: 1px solid #DDDDDD; border-bottom: 1px solid #DDDDDD; background-color: #EFEFEF; font-weight: bold; text-align: left; padding: 7px; color: #222222;"><?php echo $text_sutun_miktar; ?></td>
		                    <td style="font-size: 12px; border-right: 1px solid #DDDDDD; border-bottom: 1px solid #DDDDDD; background-color: #EFEFEF; font-weight: bold; text-align: left; padding: 7px; color: #222222;"><?php echo $text_sutun_fiyat; ?></td>
		                    <td style="font-size: 12px; border-right: 1px solid #DDDDDD; border-bottom: 1px solid #DDDDDD; background-color: #EFEFEF; font-weight: bold; text-align: left; padding: 7px; color: #222222;"><?php echo $text_sutun_toplam; ?></td>
		                </tr>
		            </thead>
		            <tbody>
		            <?php foreach ($products as $product) { ?>
		                <tr>
		                    <td style="font-size: 12px; border-right: 1px solid #DDDDDD; border-bottom: 1px solid #DDDDDD; text-align: left; padding: 7px;"><a href="<?php echo $product['href']; ?>">
		                        <?php echo $product['name']; ?></a>
		                        <?php foreach ($product['option'] as $option) { ?>
		                        <br />
		                        &nbsp;<small> - <?php echo $option['name']; ?>: <?php echo $option['value']; ?></small>
		                        <?php } ?>
		                    </td>
		                    <td style="font-size: 12px; border-right: 1px solid #DDDDDD; border-bottom: 1px solid #DDDDDD; text-align: left; padding: 7px;"><?php echo $product['model']; ?></td>
		                    <td style="font-size: 12px; border-right: 1px solid #DDDDDD; border-bottom: 1px solid #DDDDDD; text-align: left; padding: 7px;"><?php echo $product['quantity']; ?></td>
		                    <td style="font-size: 12px; border-right: 1px solid #DDDDDD; border-bottom: 1px solid #DDDDDD; text-align: left; padding: 7px;"><?php echo $product['price']; ?></td>
		                    <td style="font-size: 12px; border-right: 1px solid #DDDDDD; border-bottom: 1px solid #DDDDDD; text-align: left; padding: 7px;"><?php echo $product['total']; ?></td>
		                </tr>
		                <?php } ?>
		                <?php foreach ($vouchers as $voucher) { ?>
		                <tr>
		                    <td style="font-size: 12px; border-right: 1px solid #DDDDDD; border-bottom: 1px solid #DDDDDD; text-align: left; padding: 7px;"><?php echo $voucher['description']; ?></td>
		                    <td style="font-size: 12px; border-right: 1px solid #DDDDDD; border-bottom: 1px solid #DDDDDD; text-align: left; padding: 7px;"></td>
		                    <td style="font-size: 12px; border-right: 1px solid #DDDDDD; border-bottom: 1px solid #DDDDDD; text-align: left; padding: 7px;">1</td>
		                    <td style="font-size: 12px; border-right: 1px solid #DDDDDD; border-bottom: 1px solid #DDDDDD; text-align: left; padding: 7px;"><?php echo $voucher['amount']; ?></td>
		                    <td style="font-size: 12px; border-right: 1px solid #DDDDDD; border-bottom: 1px solid #DDDDDD; text-align: left; padding: 7px;"><?php echo $voucher['amount']; ?></td>
		                </tr>
		                <?php } ?>
		            </tbody>
		            <tfoot>
		                <?php foreach ($totals as $total) { ?>
		                <tr>
		                    <td colspan="4" style="font-size: 12px; border-right: 1px solid #DDDDDD; border-bottom: 1px solid #DDDDDD; text-align: right; padding: 7px;"><b><?php echo $total['title']; ?>:</b></td>
		                    <td style="font-size: 12px; border-right: 1px solid #DDDDDD; border-bottom: 1px solid #DDDDDD; text-align: right; padding: 7px;"><?php echo $total['text']; ?></td>
		                </tr>
		            <?php } ?>
		            </tfoot>
		        </table>
	        </div>
	    </li>
	    <li style="padding: 5px 0;"><?php echo $text_obf_madde_5_1_c; ?></li>
        <li style="padding: 5px 0;"><?php echo $text_obf_madde_5_1_c2; ?></li>
        <li style="padding: 5px 0;"><?php echo $text_obf_madde_5_1_d; ?></li>
        <li style="padding: 5px 0;"><?php echo $text_obf_madde_5_1_e; ?></li>
        <li style="padding: 5px 0;"><?php echo $text_obf_madde_5_1_f; ?></li>
		<li style="padding: 5px 0;"><?php echo $text_obf_madde_5_1_g; ?></li>
		<li style="padding: 5px 0;"><?php echo $text_obf_madde_5_1_g2; ?></li>
		<li style="padding: 5px 0;"><?php echo $text_obf_madde_5_1_h; ?></li>
		<li style="padding: 5px 0;"><?php echo $text_obf_madde_5_1_i; ?></li>
    </ol>
    <h3 style="font-size:15px; background-color:#EEEEEE; padding:9px 0px 9px 40px; border:soold 1px #B6B8D3;"><?php echo $text_mss_baslik; ?></h3>
	<table style="border-collapse: collapse; border-left: 1px solid #DDDDDD; border-right: 1px solid #DDDDDD; border-top: 1px solid #DDDDDD; margin-bottom: 20px; width: 100%;">
        <tr>
            <th colspan="2" style="background-color: #F7F7F7; border-bottom: 1px solid #DDDDDD; color: #4D4D4D; font-weight: bold; padding: 7px; width: 20%;"><?php echo $text_satici; ?></th>
        </tr>
        <tr>
            <th style="background-color: #F7F7F7; border-bottom: 1px solid #DDDDDD; color: #4D4D4D; font-weight: bold; padding: 7px; width: 20%;"><?php echo $text_satici_unvani; ?></th>
            <td style="border-bottom: 1px solid #DDDDDD; vertical-align: top; padding: 7px;"><?php echo $satici_unvani; ?></td>
        </tr>
        <tr>
            <th style="background-color: #F7F7F7; border-bottom: 1px solid #DDDDDD; color: #4D4D4D; font-weight: bold; padding: 7px; width: 20%;"><?php echo $text_satici_yetkili; ?></th>
            <td style="border-bottom: 1px solid #DDDDDD; vertical-align: top; padding: 7px;"><?php echo $satici_yetkili; ?></td>
        </tr>
        <tr>
            <th style="background-color: #F7F7F7; border-bottom: 1px solid #DDDDDD; color: #4D4D4D; font-weight: bold; padding: 7px; width: 20%;"><?php echo $text_adres; ?></th>
            <td style="border-bottom: 1px solid #DDDDDD; vertical-align: top; padding: 7px;"><?php echo $satici_adres; ?></td>
        </tr>
        <tr>
            <th style="background-color: #F7F7F7; border-bottom: 1px solid #DDDDDD; color: #4D4D4D; font-weight: bold; padding: 7px; width: 20%;"><?php echo $text_eposta; ?></th>
            <td style="border-bottom: 1px solid #DDDDDD; vertical-align: top; padding: 7px;"><?php echo $satici_eposta; ?></td>
        </tr>
        <tr>
            <th style="background-color: #F7F7F7; border-bottom: 1px solid #DDDDDD; color: #4D4D4D; font-weight: bold; padding: 7px; width: 20%;"><?php echo $text_tel; ?></th>
            <td style="border-bottom: 1px solid #DDDDDD; vertical-align: top; padding: 7px;"><?php echo $satici_tel; ?></td>
        </tr>
        <tr>
            <th style="background-color: #F7F7F7; border-bottom: 1px solid #DDDDDD; color: #4D4D4D; font-weight: bold; padding: 7px; width: 20%;"><?php echo $text_fax; ?></th>
            <td style="border-bottom: 1px solid #DDDDDD; vertical-align: top; padding: 7px;"><?php echo $satici_fax; ?></td>
        </tr>
    </table>
    <table style="border-collapse: collapse; border-left: 1px solid #DDDDDD; border-right: 1px solid #DDDDDD; border-top: 1px solid #DDDDDD; margin-bottom: 20px; width: 100%;">
        <tr>
            <th colspan="2" style="background-color: #F7F7F7; border-bottom: 1px solid #DDDDDD; color: #4D4D4D; font-weight: bold; padding: 7px; width: 20%;"><?php echo $text_alici; ?></th>
        </tr>
        <tr>
            <th style="background-color: #F7F7F7; border-bottom: 1px solid #DDDDDD; color: #4D4D4D; font-weight: bold; padding: 7px; width: 20%;"><?php echo $text_alici_ad . ' / ' . $text_alici_soyad; ?></th>
            <td style="border-bottom: 1px solid #DDDDDD; vertical-align: top; padding: 7px;"><?php echo $alici_ad . ' ' . $alici_soyad; ?></td>
        </tr>
        <tr>
            <th style="background-color: #F7F7F7; border-bottom: 1px solid #DDDDDD; color: #4D4D4D; font-weight: bold; padding: 7px; width: 20%;"><?php echo $text_adres; ?></th>
            <td style="border-bottom: 1px solid #DDDDDD; vertical-align: top; padding: 7px;"><?php echo $alici_adres_1 . ' ' . $alici_adres_2 . ' ' . $alici_sehir . ' ' . $alici_bolge . ' / ' . $alici_ulke; ?></td>
        </tr>
        <tr>
            <th style="background-color: #F7F7F7; border-bottom: 1px solid #DDDDDD; color: #4D4D4D; font-weight: bold; padding: 7px; width: 20%;"><?php echo $text_eposta; ?></th>
            <td style="border-bottom: 1px solid #DDDDDD; vertical-align: top; padding: 7px;"><?php echo $alici_eposta; ?></td>
        </tr>
        <tr>
            <th style="background-color: #F7F7F7; border-bottom: 1px solid #DDDDDD; color: #4D4D4D; font-weight: bold; padding: 7px; width: 20%;"><?php echo $text_tel; ?></th>
            <td style="border-bottom: 1px solid #DDDDDD; vertical-align: top; padding: 7px;"><?php echo $alici_tel; ?></td>
        </tr>
    </table>
    <table style="border-collapse: collapse; border-left: 1px solid #DDDDDD; border-right: 1px solid #DDDDDD; border-top: 1px solid #DDDDDD; margin-bottom: 20px; width: 100%;">
        <tr>
        	<th style="background-color: #F7F7F7; border-bottom: 1px solid #DDDDDD; color: #4D4D4D; font-weight: bold; padding: 7px; width: 20%;"><?php echo $text_tarih; ?></th>
        	<td style="border-bottom: 1px solid #DDDDDD; vertical-align: top; padding: 7px;"><?php echo date("d.m.Y"); ?></td>
        </tr>
    </table>
</div>