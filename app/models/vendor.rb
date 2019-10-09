class Vendor < ApplicationRecord
  belongs_to :user
  validates :name, presence: true
  validates :user_id, uniqueness: { message: "Limited to have 1 vendor" }

end
