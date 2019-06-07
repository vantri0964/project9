class Sugest < ApplicationRecord
  belongs_to :user
  validates :mesages, presence: true, length: { maximum: 100 }
  validates :types, presence: true
end
