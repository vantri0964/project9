class User < ApplicationRecord
	validates :name, presence: true
	validates :email, presence: true
	validates :pass_word, presence: true
	validates :pass_word_confirm, presence: true
end
