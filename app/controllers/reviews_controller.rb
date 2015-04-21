class ReviewsController < ApplicationController

  # Ensure that a user is logged in
  before_action :authenticate_user!



  # The controller for displaying the form where a user can add a review
  def new
    begin
      @current_flight = Flight.find(params[:flight_id])
    rescue ActiveRecord::RecordNotFound
      @current_flight = nil
    end
  end



  # The controller for the POST method where a user is creating a review.
  # Creates the review attached to the appropriate flight, saves the review
  # in the database, and then redirects to the list of flights.
  def create
    @new_review = Review.new(review_params)
    @new_review.save

    # TODO - Change this to redirect to the page where the user was before
    # adding a review?
    redirect_to controller: "flights", action: "show", id: params[:review][:flight_id]
  end



  # The controller for deleting a review. The user should have been prompted
  # to make sure that they really wanted to delete the review.
  def destroy
    begin
      @review_to_destroy = Review.find(params[:id])
      @review_to_destroy.destroy
      # TODO - Display a success message
    rescue ActiveRecord::RecordNotFound
      # TODO - Display an error message
    end

    redirect_to controller: "flights", action: "show", id: params[:flight_id]
  end



  # Controller for editing a review. Populates the fields with the current
  # values and updates the values based on the new data the user submits.
  def update
    begin
      @review_to_update = Review.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      @review_to_update = nil
    end
  end





  private

  # Helper function that sets the parameters allowed for creating a
  # review (strong parameters)
  def review_params
    params.require(:review).permit(:review_date, :name_of_reviewer, :flight_review,
                                   :instrument_proficiency_check, :cfi_renewal, :flight_id)
  end

end
