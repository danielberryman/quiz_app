class Quiz < ApplicationRecord
  belongs_to :user
  has_many :results
  has_many :questions
end