@@all_accounts = []

class Account

  attr :name, :number, :url_site, :user_id, :password

  def initialize (attributes)
    @subscription_name = attributes[:subscription_name]
    @number = attributes[:number]
    @url_site = attributes[:url_site]
    @user_id = attributes[:user_id]
    @password = attributes[:password]
  end

  def save
      @@all_accounts << self
    end

    def Account.all
        @@all_accounts
    end

    def Account.clear
        @@all_accounts = []
      end
end
