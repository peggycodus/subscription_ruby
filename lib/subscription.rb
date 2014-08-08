
@@subscription = []

	class Subscription

  attr :name, :type, :deductible, :subject, :price, :frequency

		def initialize (attributes)
			@name = attributes[:name]
			@type = attributes[:type]
      @price = attributes[:price]
			@frequency = attributes[:frequency]
			@deductible = attributes[:deductible]
			@renewal_date = attributes[:renewal_date]
			@subject = attributes[:subject]
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

