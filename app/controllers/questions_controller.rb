class QuestionsController < ApplicationController
    before_action :set_question, only: [:show, :edit, :update, :destroy]

    def index
      @questions = Question.all.reverse
    end

    def show
      @answers = Answer.where(params[:question_id])
      @answer = Answer.new
    end

    def new
      @question = Question.new
    end

    def edit
      @answers = Answer.where(params[:question_id])
    end

    def create
      @question = Question.new(question_params)

      if @question.save
        redirect_to @question, notice: 'Question was successfully created.'
      else
        render :new
      end
    end

    def update
      if @question.update(question_params)
        redirect_to @question, notice: 'Question was successfully updated.'
      else
        render :edit
      end
    end


    def destroy
      @question.destroy
      redirect_to @question, notice: 'Question was successfully destroyed.'
    end

    private
      def set_question
        @question = Question.find(params[:id])
      end

      def question_params
        params.require(:question).permit(:title, :description)
      end

    end
