class Buzz
  require 'open-uri'

  def self.feed_me
    batch = Nokogiri::XML(open("https://www.buzzfeed.com/quizzes.xml"))

    batch.xpath("//title").map {|node| node.to_s }
  end
end