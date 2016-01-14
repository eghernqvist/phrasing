require 'spec_helper'

describe Phrack do

  let(:Base) do
    Class.new.tap do |b|
      b.class_eval do
        module SimpleImplementation
          def lookup(*args)
            "translation missing"
          end
        end
        include SimpleImplementation
      end
    end
  end

  let(:base) do
    Base().new
  end

  before do
    Base().class_eval do
      include Phrack::Implementation
    end
  end

  describe ".lookup" do
    it "returns simple lookup if phrack_phrase missing" do
      base.lookup(nil, '').should == "translation missing"
    end

    it "returns phrack_phrase if present" do
      cct = FactoryGirl.create(:phrack_phrase)
      base.lookup(cct.locale, cct.key).should == cct.value
    end

    it "creates phrack_phrase if one is missing" do
      PhrackPhrase.where(locale: 'en', key: 'foo').should be_empty
      base.lookup('en', 'foo')
      PhrackPhrase.where(locale: 'en', key: 'foo').should_not be_empty
    end

    it "creates scoped phrack_phrase if one is missing" do
      PhrackPhrase.where(locale: 'en', key: 'the_scope.foo').should be_empty
      base.lookup('en', 'foo', :"the_scope")
      PhrackPhrase.where(locale: 'en', key: 'the_scope.foo').should_not be_empty
    end
  end
end
