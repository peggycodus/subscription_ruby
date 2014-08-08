require ('rspec')
require ('subscription')
require ('payment')
require ('account')

describe ('Subscription') do

	before do
    Subscription.clear
  	end

  it ' creates an instance of a subscription ' do
    test_subscription = Subscription.new('Treehouse', "online course", "25.00")
    test_subscription.should be_an_instance_of Subscription
  end

	describe '.clear' do
	  	it 'empties out all of the saved subscriptions' do
		  Subscription.new('Spectrum', "digital magazine", "45.00").save
		  Subscription.clear
		  Subscription.all.should eq []
	    end
	end

	describe '#save' do
    it 'adds a subscription to the array of saved subscriptions' do
      test_subscription = Subscription.new('Code School', "online course", "25.00")
      test_subscription.save
      Subscription.all.should eq [test_subscription]
    end

    describe 'list_all_subscriptions_by_name' do
    it 'puts a list of all subscriptions sorted by name to the terminal' do
    	test_subscription1 = Subscription.new('Code School', "online course", "25.00")
    	test_subscription2 = Subscription.new('Thoughbot Learn', "online course", "49.00")
    	test_subscription3 = Subscription.new('Pluralsight', "online course", "49.00")
    	test_subscription4 = Subscription.new('Safari Online', "digital publications", "42.99")
    	test_subscription.save
      expect Subscription.list_all_subscriptions_by_name.to be eq ['Code School', 'Pluralsight', 'Safari Online', 'Thoughtbot Learn']

  end
end

describe ('Payment') do

  it 'is creates an instance of a payment' do
    test_payment = Subscription.new('amount', "payment_method", "subscription_name, date_paid")
    expect(test_payment).to be_an_instance_of Payment
  end
end

