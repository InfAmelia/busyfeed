# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

verbs   = ["run", "laugh", "do", "doing", "couchsurfing"]

nouns   = ["Cakes", "Bears", "Dogs", "Logs", "Pictures of Ryan Seacrest", "Hairballs", "Ballerinas"]
          # From Phrase Processing:
          #   hamburgers, scuba, kitten, drugs, hats, kittens, sloths, tweets, giraffes

phrases = ["18 hamburgers that are just too fucking real",
          "Can you find the hats?",
          "Pick 3 kittens to see if you'll have a boyfriend in 2017",
          "How much drugs have you tried?",
          "24 sloths that will make you question the nature of your reality",
          "Literally 18 tweets of people crushing cans",
          "10 giraffes that you totally won't believe exist"]



verbs.each do |verb_name|
  Word.verb.create!(:name => verb_name)
end

nouns.each do |noun_name|
  Word.noun.create!(:name => noun_name)
end

phrases.each do |phrase|
  Title.create!(:phrase => phrase)
end

