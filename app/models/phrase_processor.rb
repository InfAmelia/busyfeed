class PhraseProcessor

  # if I want to get all machine learning later
  def self.process_title(title)
    phrase = title.phrase
    EngTagger.new.get_words(phrase)
  end
end