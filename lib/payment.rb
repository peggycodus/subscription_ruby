@@subscription = []

  class Payment

  attr :amount, :paid_date, :due_date, :subscription_name, :payment_method

    def initialize (attributes)
      @amount = attributes[:amount]
      @paid_date = attributes[:paid_date]
      @due_date = attributes[:due_date]
      @subscription_name = attributes[:subscription_name]
      @payment_method = attributes[:payment_method]
    end
  end

