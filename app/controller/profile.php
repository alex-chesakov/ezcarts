<?php 
class ControllerProfile extends Controller {
	private $error = array();
	private $success = '';
	public function changepm(){
		$json = array();
		if($this->customer->isLogged() and !empty($this->request->post['pm'])){
			if($this->config->get('stripe_environment') == 'live') {
				$stripe_secret_key = $this->config->get('stripe_live_secret_key');
			} else {
				$stripe_secret_key = $this->config->get('stripe_test_secret_key');
			}
			include_once($_SERVER['DOCUMENT_ROOT'] . '/system/library/stripe-php/init.php');
			\Stripe\Stripe::setApiKey($stripe_secret_key); 
			$query = $this->db->query("SELECT stripe_data FROM `" . DB_PREFIX . "customer` WHERE customer_id = '" . (int)$this->customer->getId() . "'");
			if($query->num_rows and !empty($query->row['stripe_data'])){
				$stripe_data = json_decode(trim($query->row['stripe_data']),true);
				if(!empty($stripe_data['customer_id'])){
					$customerId = trim($stripe_data['customer_id']);
					$paymentMethodId = trim($this->request->post['pm']); // ID 

					$customer = \Stripe\Customer::update($customerId, [
						'invoice_settings' => [
							'default_payment_method' => $paymentMethodId,
						],
					]);
//	$json = $customer;
					if(!empty($customer) and !empty($customer->invoice_settings) and !empty($customer->invoice_settings->default_payment_method)){
						$json['default_payment_method'] = $customer->invoice_settings->default_payment_method;
					}
				}
			}
		}
		$this->response->setOutput(json_encode($json));
	}
	public function intent(){
// setup-intent.php
//	require 'vendor/autoload.php';
		if($this->config->get('stripe_environment') == 'live') {
			$stripe_secret_key = $this->config->get('stripe_live_secret_key');
			$test_mode = false;
		} else {
			$stripe_secret_key = $this->config->get('stripe_test_secret_key');
			$test_mode = true;
		}
		include_once($_SERVER['DOCUMENT_ROOT'] . '/system/library/stripe-php/init.php');
		\Stripe\Stripe::setApiKey($stripe_secret_key); // 
		$query = $this->db->query("SELECT stripe_data FROM `" . DB_PREFIX . "customer` WHERE customer_id = '" . (int)$this->customer->getId() . "'");
		if($query->num_rows and !empty($query->row['stripe_data'])){
			$stripe_data = json_decode(trim($query->row['stripe_data']),true);
			if(!empty($stripe_data['customer_id'])){
				$customerId = trim($stripe_data['customer_id']);
			}
		}
		if(empty($customerId)){
			$stripe = new \Stripe\StripeClient(trim($stripe_secret_key));
			$customer = $stripe->customers->create([]);
			$customerId = $customer->id;
			$this->db->query("UPDATE `" . DB_PREFIX . "customer` SET stripe_data = '" . $this->db->escape(json_encode(array('customer_id' => $customerId))) . "' WHERE customer_id = '" . (int)$this->customer->getId() . "'");
		}
		$setupIntent = \Stripe\SetupIntent::create([
			'customer' => $customerId,
		]);
		$this->response->setOutput(json_encode(['clientSecret' => $setupIntent->client_secret,]));
	}

	public function returnstripe() {
/*
return in GET requests:
setup_intent=seti_1RqGDvCaRTlqH0B97BaN4o3a
setup_intent_client_secret=seti_1RqGDvCaRTlqH0B97BaN4o3a_secret_Slnp35uGk8mvsxE2E7nKPhQ9Wf7LG1Y
redirect_status=succeeded
*/
//	require 'vendor/autoload.php';
		if($this->config->get('stripe_environment') == 'live') {
			$stripe_secret_key = $this->config->get('stripe_live_secret_key');
		} else {
			$stripe_secret_key = $this->config->get('stripe_test_secret_key');
		}
		include_once($_SERVER['DOCUMENT_ROOT'] . '/system/library/stripe-php/init.php');
		
		\Stripe\Stripe::setApiKey($stripe_secret_key);


		$setupIntentId = $this->request->get['setup_intent'] ?? null;

		if ($setupIntentId) {
			$setupIntent = \Stripe\SetupIntent::retrieve($setupIntentId);

			if ($setupIntent->status === 'succeeded') {
				$paymentMethodId = $setupIntent->payment_method;

	
				$query = $this->db->query("SELECT stripe_data FROM `" . DB_PREFIX . "customer` WHERE stripe_data LIKE '%" . $this->db->escape('"' . $setupIntent->customer . '"') . "%'");

				if($query->num_rows and !empty($query->row['stripe_data'])){
					$stripe_data = json_decode(trim($query->row['stripe_data']),true);
					if(!empty($this->request->get['setup_intent'])){
						$stripe_data['setup_intent'] = $this->request->get['setup_intent'];
					}
					if(!empty($this->request->get['setup_intent_client_secret'])){
						$stripe_data['setup_intent_client_secret'] = $this->request->get['setup_intent_client_secret'];
					}
					$stripe_data['paymentMethodId'] = $paymentMethodId;
					$this->db->query("UPDATE `" . DB_PREFIX . "customer` SET stripe_data = '" . $this->db->escape(json_encode($stripe_data)) . "' WHERE customer_id = '" . (int)$this->customer->getId() . "'");
					$this->session->data['success'] = "The card has been linked successfully!";
					$this->redirect($this->url->link('shop', '', 'SSL'));
				}
			} else {
				$this->session->data['error'] = "Card binding error. Status: " . $setupIntent->status;
				$this->redirect($this->url->link('profile', '', 'SSL'));
			}
		} else {
			$this->session->data['error'] = "No SetupIntent data.";
			$this->redirect($this->url->link('profile', '', 'SSL'));
		}
//		$this->redirect($this->url->link('shop', '', 'SSL'));
	}
	public function index() {

		if (!$this->customer->isLogged()) {$this->session->data['redirect'] = $this->url->link('login', '', 'SSL');$this->redirect($this->url->link('login', '', 'SSL'));}

		$this->language->load('account/account');
		
		$this->data['action'] = $this->url->link("profile/update");

		$this->document->setTitle($this->language->get('heading_title'));
//	error
		if (isset($this->session->data['error'])) {
			$this->data['error_warning'] = $this->session->data['error'];
			unset($this->session->data['error']);
		}elseif (isset($this->error['warning'])) {
			$this->data['error_warning'] = $this->error['warning'];
		} else {
			$this->data['error_warning'] = '';
		}
//	success
		if (!empty($this->success)) {
			$this->session->data['success'] = $this->success;;
			$this->redirect($this->url->link('profile', '', 'SSL'));
		} elseif (isset($this->session->data['success'])) {
			$this->data['success'] = $this->session->data['success'];
			unset($this->session->data['success']);
		} else {$this->data['success'] = '';}
		
//	echo $this->customer->getFirstName();
//	get Stripe data
$this->data['default_pm'] = '';
$this->data['info_stripe'] = '';
$this->data['client_secret'] = '';
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
				
				$this->data['paymentMethods'] = \Stripe\PaymentMethod::all([
					'customer' => $stripe_data['customer_id'],
					'type' => 'card',
				]);
				/*	Output data: $this->data['paymentMethods'] = 
				object(Stripe\Collection)#29 (4) {
					["object"]=> string(4) "list"
					["data"]=>array(5) {
						[0]=>object(Stripe\PaymentMethod)#40 (10) {
							["id"]=> string(27) "pm_1RqGE8CaRTlqH0B97AP1PW2M"
							["object"]=>string(14) "payment_method"
							["allow_redisplay"]=>string(11) "unspecified"
							["billing_details"]=>object(Stripe\StripeObject)#45 (5) {
								["address"]=>object(Stripe\StripeObject)#50 (6) {
									["city"]=>NULL
									["country"]=>string(2) "FR"
									["line1"]=>NULL
									["line2"]=>NULL
									["postal_code"]=>NULL
									["state"]=>NULL
								}
								["email"]=>NULL
								["name"]=>NULL
								["phone"]=>NULL
								["tax_id"]=>NULL
							}
							["card"]=>object(Stripe\StripeObject)#46 (14) {
								["brand"]=>string(4) "visa"
								["checks"]=>object(Stripe\StripeObject)#58 (3) {
									["address_line1_check"]=>NULL
									["address_postal_code_check"]=>NULL
									["cvc_check"]=>string(4) "pass"
								}
								["country"]=>string(2) "US"
								["display_brand"]=>string(4) "visa"
								["exp_month"]=>int(12)
								["exp_year"]=>int(2036)
								["fingerprint"]=>string(16) "tif3fVdkCXQ8n7TE"
								["funding"]=>string(6) "credit"
								["generated_from"]=>NULL
								["last4"]=>string(4) "4242"
								["networks"]=>object(Stripe\StripeObject)#59 (2) {
									["available"]=>array(1) {
										[0]=>string(4) "visa"
									}
									["preferred"]=>NULL
								}
								["regulated_status"]=>string(11) "unregulated"
								["three_d_secure_usage"]=>object(Stripe\StripeObject)#63 (1) {
									["supported"]=>bool(true)
								}
								["wallet"]=>NULL
							}
							["created"]=>int(1753805888)
							["customer"]=>string(18) "cus_SlnOU8XfzbYHQy"
							["livemode"]=>bool(false)
							["metadata"]=>object(Stripe\StripeObject)#51 (0) {}
							["type"]=>string(4) "card"
						}
					}
					["has_more"]=>bool(false)
					["url"]=>string(19) "/v1/payment_methods"
				}
				*/

//	get default payment method - Stripe
				$customer = \Stripe\Customer::retrieve($stripe_data['customer_id']);
				$defaultPaymentMethodId = $customer->invoice_settings->default_payment_method;

				if ($defaultPaymentMethodId) {
					$paymentMethod = \Stripe\PaymentMethod::retrieve($defaultPaymentMethodId);
					$this->data['info_stripe'] = "Card default: " . $paymentMethod->card->brand . " ****" . $paymentMethod->card->last4;
					$this->data['default_pm'] = $paymentMethod->id;
/*	paymentMethod = 
					object(Stripe\PaymentMethod)#203 (10) { 
						["id"]=> string(27) "pm_1RqGE8CaRTlqH0B97AP1PW2M" 
						["object"]=> string(14) "payment_method" 
						["allow_redisplay"]=> string(11) "unspecified" 
						["billing_details"]=> object(Stripe\StripeObject)#222 (5) { 
							["address"]=> object(Stripe\StripeObject)#227 (6) { 
								["city"]=> NULL 
								["country"]=> string(2) "FR" 
								["line1"]=> NULL 
								["line2"]=> NULL 
								["postal_code"]=> NULL 
								["state"]=> NULL 
							} 
							["email"]=> NULL 
							["name"]=> NULL 
							["phone"]=> NULL 
							["tax_id"]=> NULL 
						} 
						["card"]=> object(Stripe\StripeObject)#223 (14) { 
							["brand"]=> string(4) "visa" 
							["checks"]=> object(Stripe\StripeObject)#235 (3) { 
								["address_line1_check"]=> NULL 
								["address_postal_code_check"]=> NULL 
								["cvc_check"]=> string(4) "pass" 
							} 
							["country"]=> string(2) "US" 
							["display_brand"]=> string(4) "visa" 
							["exp_month"]=> int(12) 
							["exp_year"]=> int(2036) 
							["fingerprint"]=> string(16) "tif3fVdkCXQ8n7TE" 
							["funding"]=> string(6) "credit" 
							["generated_from"]=> NULL 
							["last4"]=> string(4) "4242" 
							["networks"]=> object(Stripe\StripeObject)#236 (2) { 
								["available"]=> array(1) { 
									[0]=> string(4) "visa" 
								} 
								["preferred"]=> NULL 
							} 
							["regulated_status"]=> string(11) "unregulated" 
							["three_d_secure_usage"]=> object(Stripe\StripeObject)#240 (1) { 
								["supported"]=> bool(true) 
							} 
							["wallet"]=> NULL 
						} 
						["created"]=> int(1753805888) 
						["customer"]=> string(18) "cus_SlnOU8XfzbYHQy" 
						["livemode"]=> bool(false) 
						["metadata"]=> object(Stripe\StripeObject)#228 (0) { } 
						["type"]=> string(4) "card" 
					}*/
				} else {
					$this->data['info_stripe'] = "You don't have a default card installed.";
				}
			} catch (\Stripe\Exception\PermissionException $e) {
				$this->data['info_stripe'] = "Stripe error: " . $e->getMessage();
				$this->log->write('Stripe Permission error: ' . $e->getMessage() . ', for customer_id=' . (int)$this->customer->getId() );
			} catch (\Stripe\Exception\ApiConnectionException $e) {
				$this->data['info_stripe'] = "Stripe error: " . $e->getMessage();
				$this->log->write('Stripe Connection error: ' . $e->getMessage() . ', for customer_id=' . (int)$this->customer->getId());
			} catch (\Stripe\Exception\ApiErrorException $e) {
				$this->data['info_stripe'] = "Stripe error: " . $e->getMessage();
				$this->log->write('Stripe error: ' . $e->getMessage() . ', for customer_id=' . (int)$this->customer->getId());
			}
//	endstripe
		}
	}
}

		if($this->config->get('stripe_environment') == 'live') {
			$this->data['stripe_public_key'] = $this->config->get('stripe_live_public_key');
		} else {
			$this->data['stripe_public_key'] = $this->config->get('stripe_test_public_key');
		}
		
		$this->data['heading_title'] = $this->language->get('heading_title');

		$this->data['text_my_account'] = $this->language->get('text_my_account');
		$this->data['text_my_orders'] = $this->language->get('text_my_orders');
		$this->data['text_my_newsletter'] = $this->language->get('text_my_newsletter');
		$this->data['text_edit'] = $this->language->get('text_edit');
		$this->data['text_password'] = $this->language->get('text_password');

		$this->data['text_wishlist'] = $this->language->get('text_wishlist');
		$this->data['text_order'] = $this->language->get('text_order');

		$this->data['text_newsletter'] = $this->language->get('text_newsletter');
		$this->data['text_recurring'] = $this->language->get('text_recurring');

		$this->data['edit'] = $this->url->link('account/edit', '', 'SSL');
		$this->data['password'] = $this->url->link('account/password', '', 'SSL');
		$this->data['address'] = $this->url->link('account/address', '', 'SSL');
		$this->data['wishlist'] = $this->url->link('account/wishlist');
		$this->data['order'] = $this->url->link('account/order', '', 'SSL');

		$this->data['newsletter'] = $this->url->link('account/newsletter', '', 'SSL');

		$this->data['go_back'] = $this->url->link('shop', '', 'SSL');

		$this->template = 'default/template/profile.tpl';
		$this->children = array('common/column_left','common/column_right','common/content_top','common/content_bottom','footer');
		$settings = array();
		$settings['type_header'] = 3;
		$settings['class_body'] = 'container max-w-2xl mx-auto py-20 px-4';
		$this->data['header'] = $this->getChild('header',$settings);
		$this->response->setOutput($this->render());
	}
	public function update(){
		$json = array();
		if (!$this->customer->isLogged()) {$this->session->data['redirect'] = $this->url->link('login', '', 'SSL');$this->redirect($this->url->link('login', '', 'SSL'));}
		
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			
			$sql = "UPDATE " . DB_PREFIX . "customer SET telephone = '" . $this->db->escape($this->request->post['telephone']) . "', ";
			if(!empty($this->request->post['new_password']) and !empty(trim($this->request->post['new_password']))){
				$salt = substr(md5(uniqid(rand(), true)), 0, 9);
				$sql.= "salt = '" . $this->db->escape($salt) . "', password = '" . $this->db->escape(sha1($salt . sha1($salt . sha1($this->request->post['new_password'])))) . "', ";
			}
			$sql.= "firstname = '" . $this->db->escape($this->request->post['firstname']) . "' ";
			$sql.= "WHERE customer_id = '" . (int)$this->customer->getId() . "'";
			$this->db->query($sql);
			$json['success'] = 'Change Success';
			$this->success = $json['success'];
			
		}
		
		if(empty($this->request->get['ajax'])){
			$this->index();
		}else{
			$this->response->setOutput(json_encode($json));
		}
	}
	protected function validate() {
		if(empty($this->request->post['firstname'])){
			$this->error['warning'] = $this->language->get('error_firstname');
		}
		if(empty($this->request->post['telephone'])){
			$this->error['warning'] = $this->language->get('error_telephone');
		}
		if(!empty($this->request->post['change_password']) and empty($this->request->post['new_password'])){
			$this->error['warning'] = $this->language->get('error_password');
		}
		if (!$this->error) {
			return true;
		} else {
			return false;
		}
	}
}
?>