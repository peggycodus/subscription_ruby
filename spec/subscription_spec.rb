require ('rspec')
require ('subscription')
require ('payment')
require ('account')

describe ('Subscription') do

	before do
    Subscription.clear
  end

  it 'creates an instance of a subscription with a hash of attributes ' do
    test_subscription = Subscription.new({:name => 'Treehouse', :type =>'online course', :price => '25.00'})
    expect(test_subscription).to be_an_instance_of Subscription
  end

	describe '.clear' do
	  	it 'empties out all of the saved subscriptions' do
		  Subscription.new(:name =>'Spectrum', :type =>'digital magazine', :price =>'45.00').save
		  Subscription.clear
		  expect(Subscription.all).to eq []
	    end
	end

	describe '#save' do
    it 'adds a subscription to the array of saved subscriptions' do
      test_subscription = Subscription.new(:name =>'Spectrum', :type =>'digital magazine', :price =>'45.00')
      test_subscription.save
      expect(Subscription.all).to eq [test_subscription]
    end
  end

  describe '.all' do
    it 'is empty at first' do
      expect(Subscription.all).to eq []
    end
  end
end

describe ('Payment') do

before do
    Payment.clear
  end
  it 'creates an instance of a payment with a hash of attributes' do
    test_payment = Payment.new(:amount=> '99.00', :payment_method=> 'amex 9898', :subscription_name=>'Pluralsight', :date_paid=>'04/12/2014')
    expect(test_payment).to be_an_instance_of Payment
  end

  describe '.clear' do
      it 'empties out all of the saved payments' do
      Payment.new(:amount=> '99.00', :payment_method=> 'amex 9898', :subscription_name=>'Pluralsight', :date_paid=>'04/12/2014').save
      Payment.clear
      expect(Payment.all).to eq []
      end
  end
end

