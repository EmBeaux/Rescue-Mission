class QuestionsController < ApplicationController
  def index
    @questions = Question.order(created_at: :desc)
  end

  def show
    @question = Question.find(params[:id])
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(title: params["question"]["title"], description: params["question"]["description"])
    if @question.save
      redirect_to @question, notice: "Post sucessfully created!"
    else
      render :new
    end
  end

end
