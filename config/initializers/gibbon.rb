if ENV['MAILCHIMP_API_KEY']
  $gibbon = Gibbon::Request.new(api_key: ENV['MAILCHIMP_API_KEY'], symbolize_keys: true)
end
