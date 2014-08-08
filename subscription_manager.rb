require './lib/subscription'
require './lib/payment'
require './lib/account'
require 'table_print'
require 'Chronic'

@subscription = []

def main_menu
  loop do
    puts "\n\nWelcome to Subscription Manager"
    puts "____________________________________\n\n"

    puts "Press 'a' to add a subscription"
    puts "Press 'e' to edit a subscription"
    puts "Enter 'all' to list all subscriptions sorted by name"
    puts "Enter 'date' to list all subscriptions sorted by renewal date"
    puts "Enter 'subj' to list all subscriptions sorted by subject"
    puts "Enter 'tax' to list all subscriptions and the total deduction for this and last tax year"
    puts "Press 'x' to exit."
    main_choice = gets.chomp
    if main_choice == 'a'
      add_subscription
    elsif main_choice == 'es'
      edit_subscription

    elsif main_choice == 'all'
      list_all_subscriptions
    elsif main_choice == 'all-pay'
    list_all_payments
    elsif main_choice == 'all-act'
    list_all_accounts

    elsif main_choice == 'date'
      list_all_subscriptions_by_renewal_date
    elsif main_choice == 'subj'
      list_all_subscriptions_by_subj
    elsif main_choice == 'tax'
      list_subscription_deductions
      # lists all payments and total for deductible for current and past tax year,
      #then all others by name with non-deductible total cost

    elsif main_choice == 'x'
      puts "Good-bye! Take a sunshine break :) and go for a walk"
      exit
    else
      puts "Sorry, try again...that wasn't a valid option."
    end
  end
end

def add_subscription
  puts "Enter a subcription name:"
  name = gets.chomp
  puts "Enter a subcription type (online course, digital publication, paper publication, audio subscription):"
  type = gets.chomp
  puts "Enter a subcription price:"
  price = gets.chomp
  puts "Enter a subcription frequency:  (monthly, annual)"
  frequency = gets.chomp
  puts "Enter a subcription subject:"
  subject = gets.chomp
  puts "Is this subscription deductible? Y/N:"
  deductible = gets.chomp
  puts "Enter a renewal date: (MM/DD/YY)"
  renewal_date = gets.chomp

  @subscription << Subscription.new(:name=> name, :type=> type , :price => price , :frequency => frequency ,:subject => subject , :deductible => deductible, :renewal_date => renewal_date).save
  puts "Subscription added.\n\n"

  puts "Would you like to record a payment now? (Y/N)"
  payment_response = ""
  payment_response = gets.chomp

  if payment_response == ('Y' || 'y' || 'yes')

    puts "Please enter a payment amount:"
    amount = gets.chomp
    puts "Please enter a payment date the subscription was due:"
    due_date= gets.chomp
    due_date = Chronic.parse(due_date)
    puts "Please enter a payment date the subscription was paid:"
    paid_date = gets.chomp
    paid_date = Chronic.parse(paid_date)
    puts "Please enter a payment method:"
    payment_method = gets.chomp

    add_payment

    puts "Would you like to add your online account information now? (Y/N)"
    account_response = ""
    account_response = gets.chomp

    if account_response == ('Y' || 'y' || 'yes')

      puts "Please enter a URL for this account:"
      url_site = gets.chomp
      puts "Please enter your account number for this account:"
      number = gets.chomp
      puts "Please enter a URL for this account:"
      user_id = gets.chomp
      puts "Please enter a URL for this account:"
      password = gets.chomp

      add_account

      main_menu
    else
      main_menu
    end

  else
      main_menu
  end
end

def list_all_subscriptions
  puts "\nHere are all of your subscriptions:\n\n"
    tp Subscription.all, :name, :type, :frequency, :price

  puts "\n"
  puts "\n"
end

def list_all_payments
  puts "\nHere are all of your payments:\n\n"
    @paid_sorted_payments = Payment.all.sort_by { |payment| payment[:date]}
    tp @paid_sorted_payments, :name, :date_paid, :due_date, :amount, :payment_method

  puts "\n"
  puts "\n"


def add_payment
  @payment << Payment.new(:subscription_name=>'name', :amount=>'amount', :paid_date=>'paid_date', :due_date=>'due_date',:payment_method=>'payment_method').save
  puts "Payment added.\n\n"
end

def add_account
  @account << Account.new(:subscription_name=>'name', :url_site=>'url_site', :user_id=>'user_id', :password=>'password').save
  puts "Account added.\n\n"
end


main_menu
