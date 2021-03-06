require 'helper'

FactoryGirl.factories.map(&:name).each do |factory_name|
  describe "The #{factory_name} factory" do
    specify { create(factory_name).should be_valid }
  end
end
