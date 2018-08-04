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
      height: 18,
      align: :left,
      padding: 1,
      border: :thick
    ) do
      "Main Menu - Select an option.\n1 - View all items\n2 - Create new item\n3 - Destroy Item\n4 - Scan Item\n5 - View Basket\n6 - Clear Basket\n7 - View Item Promos\n8 - Add Item Promo\n9 - Remove Item Promo\n10 - View Global Promos\n11 - Add Global Promo\n12 - Remove Global Promo\n13 - Exit\n"
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
      system "clear"
      app_header
      clear_basket
      main_menu
    when 7
      system "clear"
      app_header
      view_item_promos
      main_menu
    when 8
      system "clear"
      app_header
      add_item_promo
      main_menu
    when 9
      system "clear"
      app_header
      destroy_item_promo
      main_menu
    when 10
      system "clear"
      app_header
      view_global_promos
      main_menu
    when 11
      system "clear"
      app_header
      add_global_promo
      main_menu
    when 12
      system "clear"
      app_header
      destroy_global_promo
      main_menu
    when 13
      puts "Good-bye!"
      exit(0)
    else
      system "clear"
      app_header
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
    handle_exception {
      puts "New Item"
      print "Name: "
      name = gets.chomp
      print "Cost: "
      cost = gets.chomp
      Item.create(name: name, cost: cost)

      system "clear"
      app_header
      puts "New item created!"
    }
  end
  
  def destroy_item
    handle_exception {
      puts "Item to destroy"
      print "SKU: "
      sku = gets.chomp
      Item.find(sku).destroy

      system "clear"
      app_header
      puts "Item destroyed!"
    }
  end
  
  def scan_item
    handle_exception {
      puts "Please enter item SKU."
      print "SKU: "
      sku = gets.chomp
      @basket.add_item(sku)
    }
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

  def clear_basket
    @basket.items = []
    puts "Basket cleared!"
  end
  
  def view_global_promos
    DbHelper.set_db
    puts " Start of global promos"
    GlobalPromo.all.each do |gp|
      gp.to_s
    end
    puts " End of entries"
  end
  
  def add_global_promo
      handle_exception {
        puts "Create a Global Promo."
        print "Minimum Purchase: "
        min_purchase = gets.chomp
        print "Discount: "
        discount = gets.chomp
        GlobalPromo.create(min_purchase: min_purchase, discount: discount)
      }
  end
  
  def destroy_global_promo
    handle_exception {
      puts "Global promo to destroy"
      print "ID: "
      id = gets.chomp
      GlobalPromo.find(id).destroy

      system "clear"
      app_header
      puts "Global Promo destroyed!"
    }
  end
  
  def view_item_promos
    DbHelper.set_db
    puts " Start of item promos"
    ItemPromo.all.each do |ip|
      ip.to_s
    end
    puts " End of entries"
  end
  
  def add_item_promo
    handle_exception {
      puts "Create an Item Promo."
      print "SKU: "
      sku = gets.chomp
      print "Minimum Quantity: "
      min_quantity = gets.chomp
      print "Discount: "
      discount = gets.chomp
      ItemPromo.create(item_id: sku, min_quantity: min_quantity, discount: discount)
    }
  end
  
  def destroy_item_promo
    handle_exception {
      puts "Item promo to destroy"
      print "ID: "
      id = gets.chomp
      ItemPromo.find(id).destroy

      system "clear"
      app_header
      puts "Item Promo destroyed!"
    }
  end
  
  private
  
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
  
  def handle_exception
    begin
      DbHelper.set_db
      yield
    rescue
      system "clear"
      app_header
      puts "Please try again, that was invalid"
    end
  end

end
