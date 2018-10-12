class QuestionsController < ApplicationController
  def index
    @questions = Question.order(created_at: :desc)
  end

  def show
    @question = Question.find(params[:id])
    answers_unsort = Answer.where(question: @question)
    @answers = answers_unsort.order(created_at: :desc)
    @answer = Answer.new
    @answer.question = @question
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

    def destroy
      @question = Question.find(params[:id])
      @question.destroy
      redirect_to questions_path, notice: 'Answer was sucessfully deleted'
    end
    def edit
      @question = Question.find(params[:id])
    end

    def update
      @question = Question.find(params[:id])

      if @question.update(title: params["question"]["title"], description: params["question"]["description"])
        redirect_to @question, notice: 'Question was successfully updated.'
      else
        render :edit
      end
    end
end
