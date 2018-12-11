class Result < ApplicationRecord
  belongs_to :user
  belongs_to :quiz
  has_many :answers

  accepts_nested_attributes_for :answers

  def true?
  	self.answers.each do |a|
  	  if a.correct != true
  	    return false
  	  end
  	end
  	return true
  end

  def number_correct
  	correct_count = 0 
  	self.answers.each do |a|
  	  if a.correct != true
  	  	correct_count = correct_count
  	  else
  	  	correct_count += 1
  	  end
  	end
  	return correct_count
  end

end