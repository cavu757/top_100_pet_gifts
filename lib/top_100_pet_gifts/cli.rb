class Top100PetGifts::CLI

  def call
    Top100PetGifts::Scraper.new.make_gifts
    welcome
    menu
    goodbye
  end

  def welcome
    puts ""
    puts "     *********************************************".colorize(:light_cyan)
    puts "     *  Welcome to the Top 100 Pet Owner Gifts   *".colorize(:light_cyan)
    puts "     *********************************************".colorize(:light_cyan)
  end

  def menu
    puts ""
    puts "                  ** MAIN MENU **".colorize(:light_cyan)
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
      puts "     *********************************************".colorize(:light_cyan)
      puts "     * Please select from the main menu options, *".colorize(:light_cyan)
      puts "     * type 'menu' to see main menu again        *".colorize(:light_cyan)
      puts "     * or type 'exit':                           *".colorize(:light_cyan)
      puts "     *********************************************".colorize(:light_cyan)
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
    puts "*** PET OWNER GIFTS #{start}-#{start+19} ***".colorize(:light_cyan)
    puts ""
    count = start
    until count > start+19
      gift = Top100PetGifts::Gifts.find(count)
      puts "#{gift.position}. #{gift.name}"
      count+=1
    end
  end

  def random
    puts "                   RANDOM PICK".colorize(:light_yellow)
    input_gift = Random.new.rand(1..100)
    gift(input_gift)
  end

  def find(range)
    input_gift = nil
    until range.include? (input_gift.to_i)
      puts ""
      puts "Which item would you like to know more about?".colorize(:light_cyan)
      input_gift = gets.strip
    end
    gift(input_gift.to_i)
  end

  def gift(input_gift)
    puts ""
    gift = Top100PetGifts::Gifts.find(input_gift)
    puts "**********************************************************".colorize(:blue)
    puts "RANK: ".colorize(:light_yellow)+"#{gift.position}"
    puts "NAME: ".colorize(:light_yellow)+"#{gift.name}"
    puts ""
    puts "URL: ".colorize(:light_yellow)+"#{gift.url}"
    puts ""
    puts "Description:".colorize(:light_yellow)
    puts "#{gift.description}"
    puts "**********************************************************".colorize(:blue)
    another?
  end

  def another?
    puts ""
    puts "Would you like to see another item? (y/n)".colorize(:light_cyan)
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

    puts"                             .--~~,__".colorize(:light_green)
    puts"                :-....,-------`~~'._.'".colorize(:light_green)
    puts"                 `-,,,  ,_      ;'~U'".colorize(:light_green)
    puts"                 _ ,-' ,'`-__; '--.".colorize(:light_green)
    puts"                (_/'~~'     ''''(;'".colorize(:light_green)
    puts "     *********************************************".colorize(:light_yellow)
    puts "     *   Thank you for visiting, come back soon  *".colorize(:light_yellow)
    puts "     *         for more gift ideas               *".colorize(:light_yellow)
    puts "     *********************************************".colorize(:light_yellow)
    puts ""
  end

end
