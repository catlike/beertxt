require 'yaml'
require 'rest_client'


class SMS
  
  def initialize
    @config = YAML.load_file 'config/twilio_config.yml'
    @twilio_api = RestClient::Resource.new("https://api.twilio.com", :user => "#{@config['account_sid']}", :password => "#{@config['auth_token']}")
  end
  
  def send to, from, message
    @twilio_api["/2010-04-01/Accounts/#{@config['account_sid']}/Messages.json"].post  :to => "+1" + to, 
                                                                                	:from => from,
                                                                                	:body => message
  end                                                                                                                                                                                      
end
