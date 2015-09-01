require "pry"
require 'sinatra'
require 'tropo-webapi-ruby'
require "pg"

configure :development do
  set :db_config, { dbname: "bat_signal" }
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
 redirect "/batsignal"
end



get "/batsignal" do
  erb :index
end


post '/index.json' do
  t = Tropo::Generator.new
  t.call(:to => "PHONE_NUMBER", :network => "SMS")
  t.say(:value => "Tag, you're it!")
  t.response
end
