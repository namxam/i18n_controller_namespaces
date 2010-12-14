require "spec_helper"
require 'lib/i18n_controller_namespaces'

# Create a controller which we use for testing
class MyTestController < ActionController::Base
  
  def index
    render :text => translate('.success')
  end
  
  def shortcut_version
    render :text => t('.success')
  end
  
end

# Create the I18n test strings

I18n.backend.store_translations(:en, 
  :my_test_controller => { 
    :index => { 
      :success => 'It works!'
    },
    :shortcut_version => {
      :success => 'It works too!'
    }
  }
)

describe MyTestController do
  
  it "is available as described_class" do
    described_class.should eq(MyTestController)
  end
  
  before(:each) do
    # Make sure that nothing interferes and 
    # we are working with locale set to 'en'
    I18n.locale = :en
  end
  
  
  it "should work with .translate" do
    get :index
    response.body.should eq('It works!')
  end
  
  it "should work with .t" do
    get :shortcut_version
    response.body.should eq('It works too!')
  end
  
end