1. Plan your gem, imagine your interface
2. Start with the project structure
3. Start with the entry point - the file run
4. force that to build the CLI interface
5. stub out the interface
6. start making things real
7. discover objects
8. program

- A command line interface to find out the top 100 pet owner gifts per trendhunter.com and a little information about them

#welcome
user types pet-owner-gifts

#list of options
asks whether they want to see 1-20, 21-40, 41-60, 61-80, 81-100 or a random gift or exit

#first level
list of 20 items
Which item would you like more information on?

#selection or #random choice
Rank
Name
More info
Image ??
URL

would you like to see another item?

#exit
Thank you for visiting

#website
require 'Nokogiri'
require 'open-uri'

doc = Nokogiri::HTML(open('https://www.trendhunter.com/slideshow/pet-owner-gifts'))

#numbers
doc.css('.ss__gallery').css('.ss__item').css('.ss__imgNum').collect {|n| n.text}
doc.search('.ss__imgNum').collect {|n| n.text}

#text
doc.css('.ss__gallery').css('.ss__item').css('h4').collect {|n| n.text}
doc.search('h4').collect {|n| n.text}

#more info
doc.css('.ss__gallery').css('.ss__item').css('div.ss__t2').collect {|n| n.text}
doc.search('div.ss__t2').collect {|n| n.text}

a = doc.search('.ss__imgNum').collect {|n| n.text}
b = doc.search('h4').collect {|n| n.text}
c = doc.search('div.ss__t2').collect {|n| n.text}

puts "The number #{a[0]} item is #{b[0]} and the description: #{c[0]}"

#follow on website
doc1 = Nokogiri::HTML(open("https://www.trendhunter.com/trends/luxurious-dog-kennel"))

doc1[0].css("a").attribute("href").value
--> /trends/luxurious-dog-kennel

#More info full text
a = doc1.css(".articleText").text.strip.split("\n").join("")
