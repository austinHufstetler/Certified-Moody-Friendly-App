class MilitaryPolicy
	attr_reader :current_account, :model

	def initialize(current_account, model)
		@current_account = current_account
		@military = model
	end

	def edit?
		@current_account == @military.account
	end

	def update?
		@current_account == @military.account
	end
end