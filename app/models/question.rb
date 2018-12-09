class Question < ApplicationRecord
  belongs_to :quiz
  has_many :answers
  has_many :options

  accepts_nested_attributes_for :options
end