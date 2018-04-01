class CouponPolicy
	attr_reader :current_account, :model
	def initialize(current_account, model)
		@current_account = current_account
		@coupon = model
	end

	def index?
		if (@current_account)
			current_account.accountable_type == "Business"
		else
			false
		end
	end

	def show?
		if (@current_account)
			current_account.accountable_type == "Business"
		else
			false
		end
	end

	def new?
		if (@current_account)
			current_account.accountable_type == "Business"
		else
			false
		end
	end

	def create?
		if (@current_account)
			current_account.accountable_type == "Business"
		else
			false
		end
	end

	def edit?
		if (@current_account)
			current_account == @coupon.business.account
		else
			false
		end
	end

	def update?
		if (@current_account)
			current_account == @coupon.business.account
		else
			false
		end
	end

	def destroy?
		if (@current_account)
			current_account == @coupon.business.account
		else
			false
		end
	end

	class Scope < Struct.new(:current_account, :model)
		def resolve
			model.where(business: current_account.accountable)
		end
	end
end