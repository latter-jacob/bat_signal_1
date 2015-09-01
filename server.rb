require "puma"
require 'sinatra'
require "pg"
require 'rubygems' # not necessary with ruby 1.9 but included for completeness
require 'twilio-ruby'

configure :development do
  require 'dotenv'
  set :db_config, { dbname: "bat_signal" }
end

configure :production do
  uri = URI.parse(ENV["DATABASE_URL"])
  set :db_config, {
    host: uri.host,
    port: uri.port,
    dbname: uri.path.delete('/'),
    user: uri.user,
    password: uri.password
  }
end

def db_connection
  begin
    connection = PG.connect(settings.db_config)
    yield(connection)
  ensure
    connection.close
  end
end


get "/" do
  redirect '/batsignal'
end

get "/batsignal" do
  erb :index
end

Twilio.configure do |config|
  config.account_sid = 'TWILIO_ACCOUNT_SID'
  config.auth_token = 'TWILIO_AUTH_TOKEN'
end
# set up a client to talk to the Twilio REST API
@client = Twilio::REST::Client.new account_sid, auth_token

@client.account.messages.create({
    :from => '+15183175026',
    :to => '+15183399563',
    :body => 'To The Batmobile!',
})
