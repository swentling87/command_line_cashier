require 'tty-box'
require_relative '../models/basket'
require_relative '../models/item'
require_relative '../helpers/db_helper'

class CashierController
  attr_accessor :basket

  def initialize
    @basket = Basket.new
  end

  def main_menu
    box = TTY::Box.frame(
      width: 100,
      height: 10,
      align: :left,
      padding: 3,
      border: :thick
    ) do
      "Main Menu - Select an option.\n1 - View all items\n6 - Exit\n"
    end
    puts box
    print "Enter your selection: "
    selection = gets.to_i

    case selection
    when 1
      system "clear"
      view_all_entries
      main_menu
    when 6
      puts "Good-bye!"
    
      exit(0)
    else
      system "clear"
      puts "Sorry, that is not a valid input"
      main_menu
    end
  end
  
  def view_all_entries
    DbHelper.set_db
    Item.all.each do |item|
      item.to_s
    end
    puts "End of entries"
  end

end
