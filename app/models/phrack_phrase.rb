class PhrackPhrase < ActiveRecord::Base

  validates_presence_of :key, :locale

  validate :uniqueness_of_key_on_locale_scope, on: :create

  has_many :versions, dependent: :destroy, class_name: "PhrackPhraseVersion"

  after_update :version_it

  def self.search_i18n_and_create_phrase key
    begin
      value = I18n.t key, raise: true
      PhrackPhrase.where(key: key, locale: I18n.locale).first
    rescue I18n::MissingTranslationData
      create_phrase(key)
    end
  end

  def self.create_phrase key, value = nil
    phrack_phrase = PhrackPhrase.new
    phrack_phrase.locale = I18n.locale.to_s
    phrack_phrase.key = key.to_s
    phrack_phrase.value = value || key.to_s
    phrack_phrase.save
    phrack_phrase
  end

  private

    def uniqueness_of_key_on_locale_scope
      errors.add(:key, "Duplicate entry #{key} for locale #{locale}") unless PhrackPhrase.where(key: key, locale: locale).empty?
    end

    def version_it
      PhrackPhraseVersion.create_version(id, value) if value_was != value
    end
    
end
