class Word < ActiveRecord::Base
  # attr_accessor :name
  # scope :verb,  :noun
  enum word_type: [:verb, :noun]
  validates_presence_of :name

  def self.method_missing(name, *args)
    word_type = name.to_s.split("random_").last
    if Word.respond_to?(word_type)
      send(word_type).random
    else
      raise "Undefined Attribute: #{word_type}"
    end
  end

  def self.random
    find(Word.pluck(:id).shuffle.first)
  end
end
