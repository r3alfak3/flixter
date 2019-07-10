class Section < ApplicationRecord
	belongs_to :course
	has_many :sections

	validates :title, presence: true
	validates :description, presence: true
	validates :cost, presence: true, numericality: {greater_than_or_equal_to: 0}
end
