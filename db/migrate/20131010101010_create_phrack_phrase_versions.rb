class CreatePhrackPhraseVersions < ActiveRecord::Migration
  def change
    create_table :phrack_phrase_versions do |t|    
      t.integer :phrack_phrase_id
      t.text :value
      t.timestamps
    end
    add_index :phrack_phrase_versions, :phrack_phrase_id
  end
end
