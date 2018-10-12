class AnswersController < ApplicationController

  def new
    @question = Question.find(params[:question_id])
    @answer = Answer.new
  end

  def create
    @question = Question.find(params[:question_id])
    @answer = Answer.new(answer_params)
    @answer.question = @question
    if @answer.save
      redirect_to @answer.question, notice: "Post sucessfully created!"
    else
      render @answer.question
    end
  end

  def edit
    @answer = Answer.find(params[:question_id])
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:question_id])

    @answer = Answer.find(params[:id])

    if @answer.update(answer_params)
      redirect_to @question, notice: 'Horse was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @answer.destroy
    redirect_to @question, notice: 'Answer was sucessfully deleted'
  end
  private

  def answer_params
    params.require(:answer).permit(:description)
  end
end
