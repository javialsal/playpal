class ReviewsController < ApplicationController
  def create
    participation = Participation.find(params[:participation_id])
    review = Review.find_or_initialize_by(user_id: current_user.id, participation_id: participation.id)

    if params[:action_type] == "up"
      review.personality_rating = 1
    elsif params[:action_type] == "down"
      review.personality_rating = -1
    end

    review.save

    html = render_to_string(partial: "reviews/review", locals: {participant: participation }, layout: false, formats: :html)

    render json: { html: html }.to_json
  end

end
