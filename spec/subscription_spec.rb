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

  describe '#save' do
    it 'adds a payment to the array of saved payments' do
      test_payment = Payment.new(:amount=> '99.00', :payment_method=> 'amex 9898', :subscription_name=>'Pluralsight', :date_paid=>'04/12/2014')
      test_payment.save
      expect(Payment.all).to eq [test_payment]
    end
  end

  describe '.all' do
    it 'is empty at first' do
      expect(Payment.all).to eq []
    end
  end

  describe '.clear' do
      it 'empties out all of the saved payments' do
      Payment.new(:amount=> '99.00', :payment_method=> 'amex 9898', :subscription_name=>'Pluralsight', :date_paid=>'04/12/2014').save
      Payment.clear
      expect(Payment.all).to eq []
      end
  end
end

describe ('Account') do

  before do
    Account.clear
  end

    it 'creates an instance of a account with a hash of attributes' do
    test_account = Account.new(:subscription_name=> 'Treehouse', :number=> '12345', :url_site=> 'www.teamtreehouse.com', :user_id=>'happyCoder', :password=>'hardtoguess')
    expect(test_account).to be_an_instance_of Account
  end

  describe '#save' do
    it 'adds a account to the array of saved accounts' do
      test_account = Account.new(:subscription_name=> 'Treehouse', :number=> '12345', :url_site=> 'www.teamtreehouse.com', :user_id=>'happyCoder', :password=>'hardtoguess')
      test_account.save
      expect(Account.all).to eq [test_account]
    end
  end

  describe '.all' do
    it 'is empty at first' do
      expect(Account.all).to eq []
    end
  end

  describe '.clear' do
      it 'empties out all of the saved accounts' do
      Account.new(:subscription_name=> 'Treehouse', :number=> '12345', :url_site=> 'www.teamtreehouse.com', :user_id=>'happyCoder', :password=>'hardtoguess').save
      Account.clear
      expect(Account.all).to eq []
      end
  end

end

