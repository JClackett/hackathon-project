class Doctor < ActiveRecord::Base
	belongs_to :user
	has_many :patients
	has_many :messages
	has_many :results
	has_many :posts
end
