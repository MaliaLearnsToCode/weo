class Interest < ApplicationRecord
  belongs_to :user
  belongs_to :interest_type
end
