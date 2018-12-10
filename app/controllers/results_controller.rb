class ResultsController < ApplicationController

  def new
  	@result = Result.new
  	@quiz = Quiz.find()
  end

end