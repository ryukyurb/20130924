# coding: utf-8
require 'sinatra'
require "sinatra/reloader" if development?
require 'haml'
require "active_record"

ActiveRecord::Base.establish_connection(
    :adapter => 'sqlite3',
    :database => 'db/bbs.sqlite'
)

set :haml, {:format => :html5 }

configure :development do
  Slim::Engine.set_default_options :pretty => true
end

class Sample < ActiveRecord::Base
end

get '/' do
    name = ENV['NAME']
    @message = "Hello, " << name
    @bbs = Sample.all
    haml:HelloWorld
end