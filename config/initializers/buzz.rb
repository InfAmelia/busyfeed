class Buzz
  require 'open-uri'

  attr_accessor :titles

  # Parses a popular site for article titles, cleans them up,
  # swaps them with random entries from the Words table and creates Title objects.
  def self.feed_me!
    @titles = request_titles

    remove_junk_titles
    remove_xml_tags
    replace_quotation_marks

    create_titles!
  end

  def self.request_titles
    batch = Nokogiri::XML(open("https://www.buzzfeed.com/quizzes.xml"))

    batch.xpath("//title").map {|node| node.to_s }
  end

  def self.remove_xml_tags
    replace(/<\/?[A-Za-z ]+>/, '')
  end

  def self.remove_junk_titles
    @titles[0..1] = nil
    @titles.compact!
  end

  def self.replace_quotation_marks
    replace(/\\?"/, '')
  end

  def self.replace(selector, replacement)
    @titles.each do |title|
      title.gsub!(selector, replacement)
    end
  end

  def self.create_titles!
    @titles.each { |title| Title.create!(:phrase => title) }
  end
end