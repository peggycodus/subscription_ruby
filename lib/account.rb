@@all_accounts = []

class Account

  attr :name, :number, :URL, :user_id, :password

  def initialize (attributes)
    @subscription_name = attributes[:subscription_name]
    @number = attributes[:number]
    @URL = attributes[:URL]
    @user_id = attributes[:user_id]
    @password = attributes[:password]
  end
end
