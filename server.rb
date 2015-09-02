require 'sinatra'
require 'pg'
require 'dotenv'
require 'twilio-ruby'

Dotenv.load

Twilio.configure do |config|
  config.account_sid = ENV['TWILIO_ACCOUNT_SID']
  config.auth_token = ENV['TWILIO_AUTH_TOKEN']
end

configure :development do
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

client = Twilio::REST::Client.new

def db_connection
  begin
    connection = PG.connect(settings.db_config)
    yield(connection)
  ensure
    connection.close
  end
end

get "/" do
 redirect "/batsignal"
end

get "/batsignal" do
  erb :index
end

get "/batsignal/batform" do
  erb :form
end

post '/batsignal' do
  client.messages.create(
    from: '5183175026',
    to: 'phone number here',
    body: 'To the BatMobile.'
  )
  redirect "/batsignal"
end
