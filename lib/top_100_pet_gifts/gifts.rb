class Top100PetGifts::Gifts

  attr_accessor :name, :position, :url, :description, :image_url

  @@all=[]

  def self.new_from_index(g)
    self.new(g.search('h4').text, g.search('.ss__imgNum').text,"https://www.trendhunter.com#{g.css('a').attribute('href').value}")
  end

  def initialize(name=nil, position=nil, url=nil)
    @name = name
    @position = position
    @url = url
    @@all << self
  end

  def self.all
    @@all
  end

  def self.find(id)
    self.all[100-id]
  end

  def name
    @name
  end

  def position
    @position
  end

  def url
    @url
  end


  def description
    @description ||= info_doc.css(".articleText").text.strip.split("\n").join("").gsub(/(.{1,60})( +|$\n?)|(.{1,60})/,"\\1\\3\n")
  end

  def info_doc
    @info_doc ||= Nokogiri::HTML(open(self.url))
  end

end
