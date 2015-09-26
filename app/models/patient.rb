class Patient < ActiveRecord::Base
	belongs_to :doctor
	belongs_to :user
	has_many :posts
	has_many :results
	has_many :messages
end
