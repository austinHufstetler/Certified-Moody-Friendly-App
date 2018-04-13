class BusinessPolicy
	attr_reader :current_account, :model
	

	def initialize(current_account, model)
		@current_account = current_account
		@business = model
	end

	def show?

	end

	def edit?
		@current_account == @business.account or @current_account.accountable_type == "Chamber"
	end

	def update?
		@current_account == @business.account or @current_account.accountable_type == "Chamber"
	end

	def approve?
		@current_account.accountable_type == "Chamber"
	end
end