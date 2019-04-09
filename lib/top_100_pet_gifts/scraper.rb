class Top100PetGifts::Scraper

  def get_data
    Nokogiri::HTML(open('https://www.trendhunter.com/slideshow/pet-owner-gifts'))
  end

  def scrape_gifts_index
    self.get_data.css(".ss__item")
  end

  def make_gifts
    scrape_gifts_index.each do |g|
      Top100PetGifts::Gifts.new_from_index(g)
    end
  end
end
