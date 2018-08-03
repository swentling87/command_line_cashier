require 'active_record'
require 'tty-box'
require_relative 'controllers/cashier_controller'

menu = CashierController.new

system "clear"
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
menu.main_menu
