class ResultsController < ApplicationController

  def new 
  	@result = Result.new(quiz_id: params[:quiz_id])
    3.times {@result.answers.build}
    @quiz = Quiz.find(@result.quiz_id)
    @question1 = @quiz.questions[0].name
    @question2 = @quiz.questions[1].name
    @question3 = @quiz.questions[2].name
  end

  def show
    @result = current_user.results.find(params[:id])
    @quiz = Quiz.find(@result.quiz_id)
  end

  def create
    @result = current_user.results.create(result_params)
    @quiz = Quiz.find(@result.quiz_id)
  	if @result.save
  	  redirect_to result_path(@result)
  	else
  	  render 'new'
      Rails.logger.info(@result.errors.inspect) 
  	end
  end

  private

  def result_params
    params.require(:result).permit(:quiz_id, answers_attributes: [:id, :question_id, :correct])
  end

end