class CreateTaggables < ActiveRecord::Migration
  def change
    create_table :taggables do |t|
      t.string :name

      t.timestamps
    end
  end
end
