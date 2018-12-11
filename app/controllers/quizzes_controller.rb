class QuizzesController < ApplicationController

  def index
    @quizzes = Quiz.all
  end

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

  def edit
    @quiz = Quiz.find(params[:id])
  end

  def update
    @quiz = Quiz.find(params[:id])
    if @quiz.update(quiz_params)
      @quiz.save
      redirect_to quiz_path(@quiz)
    else
     render 'edit'
    end
  end

  def take
    @quiz = Quiz.find(params[:id])
    @result = Result.new
    3.times {@result.answers.build}
  end

  private

  def quiz_params
  	params.require(:quiz).permit(:title, questions_attributes: [:id, :name, options_attributes: [:id, :content, :correct]])
  end

end