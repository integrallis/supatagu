require 'spec_helper'

module Supatagu
  describe Tag do
    before(:each) do
      @tag = Tag.create
    end
      
    it :exists do 
      defined?(Tag).should be_true
    end
    
    it 'should be invalid without a name' do
      @tag.should_not be_valid
    end
    
    it 'should include an error message when the name is blank' do
      @tag.errors[:name].should == ["can't be blank"]
    end
  end
end
