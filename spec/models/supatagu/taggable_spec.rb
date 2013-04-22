require 'spec_helper'

module Supatagu
  describe Taggable do
    before(:each) do
      @taggable = ::Taggable.create(name: 'A taggable model')
    end
    
    it { should have_many(:taggings) }
    it { should have_many(:tags) }
    
    it 'can be tagged with a CSV string' do
      @taggable.tag_with 'chunky, bacon, ruby, rails'
      @taggable.tag_list.should == ['chunky', 'bacon', 'ruby', 'rails']
    end
    
    describe 'a tagged Taggable' do
      before do
        @taggable.tag_with 'ruby, bacon'
        @ruby = ::Supatagu::Tag.where(name: 'ruby').first
        @bacon = ::Supatagu::Tag.where(name: 'bacon').first
      end
      
      it 'should return its tags' do
        @taggable.tags.should include(@ruby, @bacon)
      end
      
      it 'should return its tags as a csv string' do
        @taggable.delimited_tag_list.should == 'ruby, bacon'
      end
      
      it 'should return its tags as a array of strings' do
        @taggable.tag_list.should == ['ruby', 'bacon']
      end
    end
    
    describe 'Taggable class' do
      before do
        @taggable_1 = ::Taggable.create(name: 'Taggable 1')
        @taggable_2 = ::Taggable.create(name: 'Taggable 2')
        @taggable_3 = ::Taggable.create(name: 'Taggable 3')
        @taggable_1.tag_with 'foo, bar, baz'
        @taggable_2.tag_with 'foo, bar'
        @taggable_3.tag_with 'foo'
      end
      
      it 'should be able to find instances by tag' do
        tag_with_foo = ::Taggable.tagged_with 'foo'
        tag_with_bar = ::Taggable.tagged_with 'bar'
        tag_with_baz = ::Taggable.tagged_with 'baz'
        
        expect(tag_with_foo).to include @taggable_1, @taggable_2, @taggable_3
        expect(tag_with_bar).to include @taggable_1, @taggable_2
        expect(tag_with_baz).to include @taggable_1
      end
    end
  end
end
