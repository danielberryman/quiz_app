class QuizzesController < ApplicationController

  def new
  	@quiz = Quiz.new
  	3.times {@quiz.questions.build}
  	3.times {@quiz.questions[0].options.build}
  	3.times {@quiz.questions[1].options.build}
  	3.times {@quiz.questions[2].options.build}
  end

  def show
  	@quiz = Quiz.find(params[:id])
  end

  def create
  	@quiz = current_user.quizzes.create(quiz_params)
  	if @quiz.save
  	 redirect_to quiz_path(@quiz)
  	else
  	 render 'new'
  	end
  end

  private

  def quiz_params
  	params.require(:quiz).permit(:title, questions_attributes: [:name, options_attributes: [:content, :correct]])
  end

end