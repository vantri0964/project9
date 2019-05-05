class Typemicropost < ApplicationRecord
  has_many :microposts, dependent: :destroy
end
