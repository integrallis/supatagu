module Supatagu
  class Tagging < ActiveRecord::Base
    belongs_to :tag
    belongs_to :taggable, :polymorphic => true
    
    validates_presence_of :tag
    validates_presence_of :taggable
    
    validates_uniqueness_of :tag_id, :scope => [:taggable_id ,:taggable_type]
  end
end
