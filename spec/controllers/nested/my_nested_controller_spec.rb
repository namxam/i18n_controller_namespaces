require 'spec_helper'

# Create a controller which we use for testing
module Nested
  class MyNestedController < ActionController::Base
    def index
      render :text => translate('.success')
    end
    
    def shortcut_version
      render :text => t('.success')
    end
  end
end

# Create the I18n test strings
I18n.backend.store_translations(:en, 
  :nested => {
    :my_nested => { 
      :index => { 
        :success => 'It works!'
      },
      :shortcut_version => {
        :success => 'It works too!'
      }
    }
  }
)

describe Nested::MyNestedController do
  
  it "is available as described_class" do
    described_class.should eq(Nested::MyNestedController)
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