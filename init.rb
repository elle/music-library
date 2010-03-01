require 'rubygems'
require 'dm-core'
require 'dm-timestamps'
require 'dm-validations'
require 'dm-aggregates'
require 'haml'
require 'ostruct'

require 'sinatra' unless defined?(Sinatra)

configure do
  SiteConfig = OpenStruct.new(
                 :title => 'Music Library Search',
                 :author => 'Elle Meredith',
                 :url_base => 'http://localhost:9393/'
               )

  DataMapper.setup(:default, "sqlite3:///#{File.expand_path(File.dirname(__FILE__))}/#{Sinatra::Base.environment}.db")

  # Load all the lib files (models, helpers)
  Dir["lib/*.rb"].each { |x| load x }
  
  set :views, "#{File.dirname(__FILE__)}/views"
end
