require 'spec_helper'

describe Route do

  def reset_route(options = {})
    @valid_attributes = {
      :id => 1,
      :url => "valid-url"
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

    it "rejects with space characters url" do
      # as one gets created before each spec by reset_route
      Route.new(@valid_attributes.merge(:url => "url with space")).should_not be_valid
    end
  end

end