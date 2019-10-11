class Vendor < ApplicationRecord
  belongs_to :user
  has_many :products, dependent: :destroy
  validates :name, presence: true
  validates :user_id, uniqueness: { message: "Limited to have 1 vendor" }

end
