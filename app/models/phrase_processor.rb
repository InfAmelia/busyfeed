class PhraseProcessor

  def initialize(title)
    @tagger = EngTagger.new
    @title = title
  end

  # if I want to get all machine learning later
  def self.process_title(title)
    processor = new(title)
    { :nouns => processor.get_nouns, :verbs => processor.get_verbs }
  end

  ["noun", "verb"].each do |object|
    define_method("get_#{object}s") do
      phrase = @tagger.add_tags(@title.phrase)
      @tagger.send("get_#{object}s", phrase)
    end
  end
end