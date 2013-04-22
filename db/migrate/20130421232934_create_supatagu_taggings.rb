class CreateSupataguTaggings < ActiveRecord::Migration
  def change
    create_table :supatagu_taggings do |t|
      t.references :tag
      t.references :taggable, :polymorphic => true

      t.timestamps
    end
    
    add_index :supatagu_taggings, :tag_id
    add_index :supatagu_taggings, [:taggable_id, :taggable_type]
  end
end
