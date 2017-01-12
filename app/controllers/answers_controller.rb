class AnswersController < ApplicationController
  def index
  end

  def new
    @question = Question.find(params[:question_id])
    @answer = Answer.new
  end

  def create
    @question = Question.find(params[:question_id])
    @answer = Answer.new(answer_params)
    @answer.question = @question

    if @answer.save
      redirect_to @question, notice: 'Answer was successfully created.'
    else
      redirect_to @question, notice: 'Answer is not long enough!'
    end
  end

  def show
    @question = Question.find(params[:question_id])
    @answer = Answer.new
  end

  private

  def answer_params
    params.require(:answer).permit(:response)
  end

end
