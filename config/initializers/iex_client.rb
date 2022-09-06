IEX::Api.configure do |config|
  config.publishable_token = 'pk_b51bcad458d549c68be92ebc5cb43be4' # defaults to ENV['IEX_API_PUBLISHABLE_TOKEN']
  config.secret_token = 'sk_ec3e99fa21634d04aa7b8b7f70ad2a8c' # defaults to ENV['IEX_API_SECRET_TOKEN']
  config.endpoint = 'https://cloud.iexapis.com/v1' # use 'https://sandbox.iexapis.com/v1' for Sandbox
end