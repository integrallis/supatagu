# This migration comes from supatagu (originally 20130420190455)
class CreateSupataguTags < ActiveRecord::Migration
  def change
    create_table :supatagu_tags do |t|
      t.string :name

      t.timestamps
    end
  end
end
