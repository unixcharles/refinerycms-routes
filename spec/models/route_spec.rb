require 'spec_helper'

describe Route do

  def reset_route(options = {})
    @valid_attributes = {
      :id => 1,
      :url => "RSpec is great for testing too"
    }

    @route.destroy! if @route
    @route = Route.create!(@valid_attributes.update(options))
  end

  before(:each) do
    reset_route
  end

  context "validations" do
    
    it "rejects empty url" do
      Route.new(@valid_attributes.merge(:url => "")).should_not be_valid
    end

    it "rejects non unique url" do
      # as one gets created before each spec by reset_route
      Route.new(@valid_attributes).should_not be_valid
    end
    
  end

end