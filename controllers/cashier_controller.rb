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
      height: 15,
      align: :left,
      padding: 3,
      border: :thick
    ) do
      "Main Menu - Select an option.\n1 - View all items\n2 - Create new item\n3 - Destroy Item\n4 - Scan Item\n5 - View Basket\n6 - Exit\n"
    end
    puts box
    print "Enter your selection: "
    selection = gets.to_i

    case selection
    when 1
      system "clear"
      app_header
      view_all_entries
      main_menu
    when 2
      system "clear"
      app_header
      create_item
      main_menu
    when 3
      system "clear"
      app_header
      destroy_item
      main_menu
    when 4
      system "clear"
      app_header
      scan_item
      main_menu
    when 5
      system "clear"
      app_header
      view_basket
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
    puts " Start of entries"
    Item.all.each do |item|
      item.to_s
    end
    puts " End of entries"
  end
  
  def create_item
    DbHelper.set_db
    puts "New Item"

    print "Name: "
    name = gets.chomp
    print "Cost: "
    cost = gets.chomp

    Item.create(name: name, cost: cost)

    system "clear"
    app_header
    puts "New item created!"
  end
  
  def destroy_item
    DbHelper.set_db
    puts "Item to destroy"

    print "SKU: "
    sku = gets.chomp

    Item.find(sku).destroy

    system "clear"
    app_header
    puts "Item destroyed!"
  end
  
  def scan_item
    DbHelper.set_db
    puts "Please enter item SKU."
    print "SKU: "
    sku = gets.chomp
    @basket.add_item(sku)
  end
  
  def view_basket
    if @basket.items.empty?
      puts "No items yet..."
    else
      puts "Your current basket."
      @basket.view.each do |item|
        item.to_s
      end
      puts "Total: £#{@basket.total}"
    end
  end
  
  def app_header
    box = TTY::Box.frame(
      width: 100,
      height: 10,
      align: :center,
      padding: 3,
      border: :thick,
      style: {
      fg: :bright_yellow,
      bg: :blue,
      border: {
        fg: :bright_yellow,
        bg: :blue
      }
    }
    ) do
      "Welcome to Checkout!"
    end
    puts box
  end

end
