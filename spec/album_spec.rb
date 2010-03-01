require "#{File.dirname(__FILE__)}/spec_helper"

describe 'album' do
  before(:each) do
    @album = Album.new(:title => 'test title')
  end

  specify 'should be valid' do
    @album.should be_valid
  end

  specify 'should require a name' do
    @album = Album.new
    @album.should_not be_valid
    @album.errors[:name].should include("Name must not be blank")
  end
end
