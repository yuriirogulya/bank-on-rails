class TransactionService
  def initialize(operation, account, amount)
    @operation = operation
    @account = account
    @amount = amount
  end

  def perform
    if @operation == 'Withdraw'
      new_amount = current_account.balance - @amount
      current_account.update(balance: new_amount)
    elsif @operation == 'Deposit'
      new_amount = current_account.balance + @amount
      current_account.update(balance: new_amount)
    end
  end

  def write_logs
    AccountHistory.create(operation: @operation, amount: @amount, account_id: @account)
  end

  private

  def current_account
    Account.find(@account)
  end
end
