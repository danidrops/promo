Rails.configuration.stripe = {
  :publishable_key => 'pk_test_cjuuAiA9AEchN2sJCZioUUrX',
  :secret_key      => 'sk_test_OHkA9sxF25wTR4dOV1OcsNtW'
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]