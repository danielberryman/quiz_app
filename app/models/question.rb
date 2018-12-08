class Question < ApplicationRecord
  belongs_to :quiz
  has_many :answers
  has_many :options
end