class Chamber < ApplicationRecord
	has_one :account, as: :accountable
end
