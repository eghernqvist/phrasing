# This migration comes from phrack_rails_engine (originally 20131010101010)
class CreatePhrackPhraseVersions < ActiveRecord::Migration
  def change
    create_table :phrack_phrase_versions do |t|    
      t.integer :phrack_phrase_id
      t.text :value
      t.timestamps
    end
  end
end
