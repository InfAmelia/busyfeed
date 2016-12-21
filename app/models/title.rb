class Title < ActiveRecord::Base
  # attr_accessor :phrase
  validates_presence_of :phrase
  before_create :parse_phrase

  WORD_TYPES = ["noun", "verb"]

  def parse_phrase
    WORD_TYPES.each do |word|
      phrase.gsub!(word, Word.send("random_#{word}").name)
    end
  end

  # def get_subject
  #   PhraseProcessor.process_title(self)
  # end
end