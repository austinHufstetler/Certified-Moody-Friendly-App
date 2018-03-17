class Military < ApplicationRecord
	has_one :account, as: :accountable
end
