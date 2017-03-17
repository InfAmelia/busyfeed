class Word < ActiveRecord::Base
  include ModelHelper
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

  def self.create_if_unique(name, type)
    create!(:name => name, :word_type => type) unless Word.where(:name => name).exists?
  end
end
