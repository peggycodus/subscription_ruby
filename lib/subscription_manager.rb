require '../lib/subscription'

@subscription = []

def main_menu
  loop do
    puts "Press 'a' to add a subscription"
    puts "Press 'e' to edit a subscription"
    puts "Enter 'name' to list all subscriptions sorted by name"
    puts "Enter 'date' to list all subscriptions sorted by renewal date"
    puts "Enter 'subj' to list all subscriptions sorted by subject"
    puts "Enter 'tax' to list all subscriptions and the total deduction for this and last tax year"
    puts "Press 'x' to exit."
    main_choice = gets.chomp
    if main_choice == 'a'
      add_subscription
    elsif main_choice == 'e'
      edit_subscription

    elsif main_choice == 'name'
      list_all_subscriptions_by_name #sorted by name

    elsif main_choice == 'date'
      list_all_subscriptions_by_date #sorted by renewal date
    elsif main_choice == 'subj'
      list_all_subscriptions_by_subj #sorted by subject
    elsif main_choice == 'tax'
      list_subscription_deductions # lists deductible first, then all others by name for review and edit

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
  @subscription << Subscription.new(name, type, price)
  puts "Subscription added.\n\n"
end


def list_all_subscriptions
  puts "Here are all of your subscriptions:"
  @subscription.each do |name|
    puts "Name: #{name}  Type: #{name}  Price: #{name}  "
  end
  puts "\n"
  puts "\n"
end

main_menu