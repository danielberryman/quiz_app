class Quiz < ApplicationRecord
  belongs_to :user
  has_many :results
  has_many :questions
  has_many :options, :through => :questions

  accepts_nested_attributes_for :questions
  accepts_nested_attributes_for :options

end