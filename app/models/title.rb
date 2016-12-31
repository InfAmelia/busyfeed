class Title < ActiveRecord::Base
  # attr_accessor :phrase
  validates_presence_of :phrase
  before_create :generate_phrase

  WORD_TYPES = ["noun", "verb"]

  def generate_phrase
    WORD_TYPES.each do |word|
      phrase.gsub!(word, Word.send("random_#{word}").name)
    end
  end

  def self.random
    find(Title.pluck(:id).shuffle.first)
  end
end