require "pry"
require 'sinatra'
require 'tropo-webapi-ruby'

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
