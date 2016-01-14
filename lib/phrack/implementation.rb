module Phrack
  module Implementation
    # this method overrides part of the i18n gem, lib/i18n/backend/simple.rb
    def lookup(locale, key, scope = [], options = {})
      return super unless ActiveRecord::Base.connected? && PhrackPhrase.table_exists?

      scoped_key = I18n.normalize_keys(nil, key, scope, options[:separator]).join(".")

      phrase = PhrackPhrase.where(locale: locale.to_s, key: scoped_key).first
      return phrase.value if phrase

      value = super(locale, key, scope, options)

      if value and (value.is_a? String or value.is_a? Symbol)
        # creation in background no matter if developer user the I18n#t or phrase helper
        PhrackPhrase.create_phrase(scoped_key, value)
      end
      value
    end
  end
end
