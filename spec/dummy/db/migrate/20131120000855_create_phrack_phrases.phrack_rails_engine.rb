# This migration comes from phrack_rails_engine (originally 20120313191745)
class CreatePhrackPhrases < ActiveRecord::Migration
  def change
    create_table :phrack_phrases do |t|    
      t.string :locale
      t.string :key
      t.text :value
      t.timestamps
    end
  end
end
