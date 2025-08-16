<?php
class ModelPaymentStripe extends Model {
	public function getMethod($address, $total) {
		$this->load->language('payment/stripe');

		$status = true;

		// stripe does not allow payment for 0 amount
		if($total <= 0) {
			$status = false; 
		}

		$method_data = array();

		if ($status) {
//	verify stripe data
$query = $this->db->query("SELECT stripe_data FROM `" . DB_PREFIX . "customer` WHERE customer_id = '" . (int)$this->customer->getId() . "'");
if($query->num_rows){
	if(!empty(trim($query->row['stripe_data']))){
		$stripe_data = json_decode($query->row['stripe_data'],true);
		if(!empty($stripe_data['customer_id'])){
			if($this->config->get('stripe_environment') == 'live') {
				$stripe_secret_key = $this->config->get('stripe_live_secret_key');
				$test_mode = false;
			} else {
				$stripe_secret_key = $this->config->get('stripe_test_secret_key');
				$test_mode = true;
			}
			include_once($_SERVER['DOCUMENT_ROOT'] . '/system/library/stripe-php/init.php');

			try {
				\Stripe\Stripe::setApiKey($stripe_secret_key); 
				
//	get default payment method - Stripe
				$customer = \Stripe\Customer::retrieve($stripe_data['customer_id']);
				$defaultPaymentMethodId = $customer->invoice_settings->default_payment_method;
//var_dump( $defaultPaymentMethodId );
				if ($defaultPaymentMethodId) {
					$paymentMethod = \Stripe\PaymentMethod::retrieve($defaultPaymentMethodId);

					$method_data = array(
						'code'       => 'stripe',
						'title'      => "Card default: " . $paymentMethod->card->brand . " ****" . $paymentMethod->card->last4,
						'sort_order' => $this->config->get('stripe_sort_order')
					);
				}else{
					$method_data = array(
						'code'       => '',
						'title'      => "+ add new Card",
						'sort_order' => 999
					);
				}
			} catch (\Stripe\Exception\PermissionException $e) {
				$method_data = array(
					'code'       => '',
					'title'      => "Stripe error: " . $e->getMessage(),
					'sort_order' => $this->config->get('stripe_sort_order')
				);
				$this->log->write('Stripe Permission error: ' . $e->getMessage() . ', for customer_id=' . (int)$this->customer->getId() );
			} catch (\Stripe\Exception\ApiConnectionException $e) {
				$method_data = array(
					'code'       => '',
					'title'      => "Stripe error: " . $e->getMessage(),
					'sort_order' => $this->config->get('stripe_sort_order')
				);
				$this->log->write('Stripe Connection error: ' . $e->getMessage() . ', for customer_id=' . (int)$this->customer->getId());
			} catch (\Stripe\Exception\ApiErrorException $e) {
				$method_data = array(
					'code'       => '',
					'title'      => "Stripe error: " . $e->getMessage(),
					'sort_order' => $this->config->get('stripe_sort_order')
				);
				$this->log->write('Stripe error: ' . $e->getMessage() . ', for customer_id=' . (int)$this->customer->getId());
			}

		}
	}


}
		}
	
		return $method_data;
	}

	public function log($file, $line, $caption, $message){

		if(!$this->config->get('payment_stripe_debug')){
			return;
		}

		$iso_time = date('c');
		$filename = 'stripe-'.strstr($iso_time, 'T', true).'.log';
	
		$log = new Log($filename);
		$msg = "[" . $iso_time . "] ";
		$msg .= "<" . $file . "> ";
		$msg .= "#" . $line . "# ";
		$msg .= "~" . $caption . "~ ";

		if(is_array($message)){
			$msg .= print_r($message, true);
		} else {
			$msg .= PHP_EOL . $message;
		}

		$msg .= PHP_EOL . PHP_EOL;		
		$log->write($msg);
	}
}
