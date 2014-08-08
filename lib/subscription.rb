
@@subscription = []

	class Subscription

  attr

		def initialize (name, type = "online course", price)
			@name = name
			@type = type

			@price = price
			@frequency = ""
			@deductible = ""
			@account_id = ""
			@password = ""
			@last_renewal_date = ""
			@subject = ""

			puts 'A new instance has been initialized.'
		end

		def Subscription.all
    		@@all_subscriptions
  		end

  		def Subscription.clear
    		@@all_subscriptions = []
  		end

  		def save
    		@@all_subscriptions << self
  		end
	end

