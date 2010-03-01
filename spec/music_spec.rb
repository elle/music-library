require "#{File.dirname(__FILE__)}/spec_helper"

describe 'music application' do
  include Rack::Test::Methods

  def app
    Sinatra::Application.new
  end

  specify 'should show the default index page' do
    get '/'
    last_response.should be_ok
    #includes a search form
    #includes albums listings
  end

  specify 'should search for albums'
end
