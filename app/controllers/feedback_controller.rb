class FeedbackController < ApplicationController
  def index
    @feedbacks = Feedback.all
  end

  def new
    @feedback = Feedback.new
  end

  def create
    @feedback = Feedback.new(feedback_params)
    if @feedback.save
      redirect_to(feedback_path)
    else
      render :new
    end
  end

  def delete
    @feedbacks = Feedback.all
    find_feedback

    if @feedback
        @feedback.destroy
    end
    back
  end

  private

  def feedback_params
    puts params
    params.permit(:name, :email, :body)
  end

  def find_feedback
    @feedback = Feedback.find(params[:id])
  end

  def back
    redirect_back(fallback_location: feedback_path)
  end
end
