# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

verbs   = ["run", "laugh", "do", "doing", "couchsurfing"]

nouns   = ["cake", "bear", "dog", "log", "pictures of ryan seacrest", "hairballs", "ballerinas"]

phrases = ["18 nouns that are just too fucking real",
          "Can you ace this noun quiz?",
          "Pick a noun to see if you'll verb a noun",
          "How much noun have you tried?",
          "24 nouns that will make you question the nature of your reality",
          "Literally 18 nouns of people verbing stuff",
          "10 nouns that you totally won't believe exist"]



verbs.each do |verb_name|
  Word.verb.create!(:name => verb_name)
end

nouns.each do |noun_name|
  Word.noun.create!(:name => noun_name)
end

phrases.each do |phrase|
  Title.create!(:phrase => phrase)
end

