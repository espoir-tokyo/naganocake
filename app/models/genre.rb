class Genre < ApplicationRecord
	has_many :items, dependent: :destroy
	validates :name, presence: true
	validates :flag, inclusion: { in: [true, false]}
end
