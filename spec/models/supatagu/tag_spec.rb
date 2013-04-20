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
    
    describe 'a valid Tag' do
      before do
        @tag.name = 'bacon'
        @tag.save
      end
      
      it 'should return its name' do
        @tag.to_s.should == 'bacon'
      end
      
      it 'should be unique' do
        expect {
          Tag.create!(name: 'bacon')
        }.to raise_error(
          ActiveRecord::RecordInvalid, 
          'Validation failed: Name has already been taken'
        )
      end
    end
  end
end
