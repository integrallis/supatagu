class CreateSupataguTags < ActiveRecord::Migration
  def change
    create_table :supatagu_tags do |t|
      t.string :name

      t.timestamps
    end
  end
end
