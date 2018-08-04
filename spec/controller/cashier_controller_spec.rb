require_relative '../../controllers/cashier_controller'

RSpec.describe CashierController do
  describe "#main_menu" do
    it "should respond to the method" do
      cc = CashierController.new
      expect(cc).to respond_to(:main_menu)
    end
  end
  
  describe "#view_all_entries" do
    it "should respond to the method" do
      cc = CashierController.new
      expect(cc).to respond_to(:view_all_entries)
    end
  end
  
  describe "#create_item" do
    it "should respond to the method" do
      cc = CashierController.new
      expect(cc).to respond_to(:create_item)
    end
  end
  
  describe "#destroy_item" do
    it "should respond to the method" do
      cc = CashierController.new
      expect(cc).to respond_to(:destroy_item)
    end
  end
  
  describe "#scan_item" do
    it "should respond to the method" do
      cc = CashierController.new
      expect(cc).to respond_to(:scan_item)
    end
  end
  
  describe "#view_basket" do
    it "should respond to the method" do
      cc = CashierController.new
      expect(cc).to respond_to(:view_basket)
    end
  end
  
  describe "#clear_basket" do
    it "should respond to the method" do
      cc = CashierController.new
      expect(cc).to respond_to(:clear_basket)
    end
  end
  
  describe "#view_global_promos" do
    it "should respond to the method" do
      cc = CashierController.new
      expect(cc).to respond_to(:view_global_promos)
    end
  end
  
  describe "#add_global_promo" do
    it "should respond to the method" do
      cc = CashierController.new
      expect(cc).to respond_to(:add_global_promo)
    end
  end
  
  describe "#destroy_global_promo" do
    it "should respond to the method" do
      cc = CashierController.new
      expect(cc).to respond_to(:destroy_global_promo)
    end
  end
  
  describe "#view_item_promos" do
    it "should respond to the method" do
      cc = CashierController.new
      expect(cc).to respond_to(:view_item_promos)
    end
  end
  
  describe "#view_item_promos" do
    it "should respond to the method" do
      cc = CashierController.new
      expect(cc).to respond_to(:view_item_promos)
    end
  end
  
  describe "#add_item_promo" do
    it "should respond to the method" do
      cc = CashierController.new
      expect(cc).to respond_to(:add_item_promo)
    end
  end
  
  describe "#destroy_item_promo" do
    it "should respond to the method" do
      cc = CashierController.new
      expect(cc).to respond_to(:destroy_item_promo)
    end
  end
end

