class Title < ActiveRecord::Base
  include ModelHelper
  # attr_accessor :phrase
  # attr_accessor :noun

  validates_presence_of :phrase
  before_create :map_nouns
  before_create :get_random_noun

  def get_random_noun
    self.noun = Word.random_noun.name
  end

  # should only be called automatically
  def map_nouns
    result = PhraseProcessor.process_title(self)

    noun = result[:nouns].keys.first

    Word.create_if_unique(noun, :noun)

    phrase.gsub!(noun, "[noun]")
  end

  def swapped_phrase
    phrase.gsub("[noun]", noun)
  end
end
