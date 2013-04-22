module Supatagu
  module ActsAsSupatagu
    extend ActiveSupport::Concern
 
    module ClassMethods
      def acts_as_supatagu
        has_many :taggings, class_name: 'Supatagu::Tagging'
        has_many :tags, :through => :taggings, class_name: 'Supatagu::Tag'
        
        include Supatagu::ActsAsSupatagu::InstanceMethods
        
        def self.tagged_with(tag)
          Taggable.joins(:tags).where("supatagu_tags.name = ?", tag)
        end
      end

    end
    
    module InstanceMethods
      def delimited_tag_list
        self.tag_list.join ', '
      end
      
      def tag_list
        self.tags.map(&:to_s)
      end
      
      def tag_with(tags)
        ActiveRecord::Base.transaction do
          tags.split(',').map(&:strip).each do |name|
            tag = Tag.find_or_create_by(name: name)
            tagging = Tagging.create(tag: tag, taggable: self)
          end
        end
      end
    end
    
  end
end
 
ActiveRecord::Base.send :include, Supatagu::ActsAsSupatagu