class Title < ActiveRecord::Base
  # attr_accessor :phrase
  validates_presence_of :phrase
  before_create :swap_nouns!

  def swap_nouns!
    result = PhraseProcessor.process_title(self)

    result[:nouns].keys.each do |noun|
      phrase.gsub!(noun, Word.send("random_noun").name)
    end
  end
end