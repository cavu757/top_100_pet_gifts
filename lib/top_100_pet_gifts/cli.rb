class Top100PetGifts::CLI

  def call
    Top100PetGifts::Scraper.new.make_gifts
    welcome
    menu
    goodbye
  end

  def welcome
    puts ""
    puts "     *********************************************"
    puts "     *  Welcome to the Top 100 Pet Owner Gifts   *"
    puts "     *********************************************"
  end

  def menu
    puts ""
    puts "              ** MAIN MENU **"
    puts "              1. Random Gift + Info"
    puts "              2. Top 20 Gifts"
    puts "              3. 21st-40th ranked Gifts"
    puts "              4. 41st-60th ranked Gifts"
    puts "              5. 61st-80th ranked Gifts"
    puts "              6. 81st-100th ranked Gifts"
    puts ""
    user_input
  end

  def user_input (input=nil)
    # binding.pry
    if input != "exit"
      puts "     *********************************************"
      puts "     * Please select from the main menu options, *"
      puts "     * type 'menu' to see main menu again        *"
      puts "     * or type 'exit':                           *"
      puts "     *********************************************"
      print "     <//> "
      input = gets.strip.downcase
      case input
      when "menu"
        menu
      when "1"
        random
      when "2"
        start = 1
        range = (start..start+19)
        print_choices(start)
        find(range)
      when "3"
        start = 21
        range = (start..start+19)
        print_choices(start)
        find(range)
      when "4"
        start = 41
        range = (start..start+19)
        print_choices(start)
        find(range)
      when "5"
        start = 61
        range = (start..start+19)
        print_choices(start)
        find(range)
      when "6"
        start = 81
        range = (start..start+19)
        print_choices(start)
        find(range)
      when "exit"
        input = "exit"
      else
        user_input
      end
    end
  end

  def print_choices(start)
    puts ""
    puts "*** PET OWNER GIFTS #{start}-#{start+19} ***"
    puts ""
    count = start
    until count > start+19
      gift = Top100PetGifts::Gifts.find(count)
      puts "#{gift.position}. #{gift.name}"
      count+=1
    end
  end

  def random
    puts "                   RANDOM PICK"
    input_gift = Random.new.rand(1..100)
    gift(input_gift)
  end

  def find(range)
    input_gift = nil
    until range.include? (input_gift.to_i)
      puts ""
      puts "Which item would you like to know more about?"
      input_gift = gets.strip
    end
    gift(input_gift.to_i)
  end

  def gift(input_gift)
    puts ""
    gift = Top100PetGifts::Gifts.find(input_gift)
    puts "**********************************************************"
    puts "RANK: #{gift.position}"
    puts "NAME: #{gift.name}"
    puts ""
    puts "URL: #{gift.url}"
    puts ""
    puts "Description:"
    puts "#{gift.description}"
    puts "**********************************************************"
    # gift = Top100PetGifts::Gifts.find(input_gift)
    another?
  end

  def another?
    puts ""
    puts "Would you like to see another item? (y/n)"
    input_another = gets.strip.downcase
    case input_another
    when "y"
      menu
    when "n"
      user_input("exit")
    else
      another?
    end
  end

  def goodbye

    puts"                             .--~~,__"
    puts"                :-....,-------`~~'._.'"
    puts"                 `-,,,  ,_      ;'~U'"
    puts"                 _ ,-' ,'`-__; '--."
    puts"                (_/'~~'     ''''(;'"
    puts "     *********************************************"
    puts "     *   Thank you for visiting, come back soon  *"
    puts "     *         for more gift ideas               *"
    puts "     *********************************************"
  end

end
