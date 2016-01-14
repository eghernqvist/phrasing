class PhrackPhraseVersion < ActiveRecord::Base
  belongs_to :phrack_phrase

  def self.create_version(phrack_phrase_id, value)
    phrack_phrase_version = PhrackPhraseVersion.new
    phrack_phrase_version.phrack_phrase_id = phrack_phrase_id
    phrack_phrase_version.value = value
    phrack_phrase_version.save
  end
  
end