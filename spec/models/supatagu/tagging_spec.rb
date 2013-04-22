require 'spec_helper'

module Supatagu
  describe Tagging do
    before(:each) do
      @tag = Tag.create(name: 'ruby')
      @taggable = Taggable.create(name: 'Lambdas, Procs and Blocks')
      @tagging = Tagging.create 
    end
    
    it { should belong_to(:tag) }
    it { should belong_to(:taggable) }
    
    it :exists do 
      defined?(Tagging).should be_true
    end
    
    it 'should be invalid without tag' do
      @tagging.should_not be_valid
      @tagging.errors[:tag].should == ["can't be blank"]
    end
    
    it 'should be invalid without taggable' do
      @tagging.should_not be_valid
      @tagging.errors[:taggable].should == ["can't be blank"]
    end
    
    describe 'a valid tagging', Tagging do
      before(:each) do
        @tagging = Tagging.create(tag: @tag, taggable: @taggable)
      end
      
      it 'should be unique' do
        tagging = Tagging.create(tag: @tag, taggable: @taggable)
        tagging.should_not be_valid 
        tagging.errors[:tag_id].should == ["has already been taken"]
      end
      
    end
  end
end
