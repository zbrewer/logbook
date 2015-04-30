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
    flash[:notice] = "Review Successfully Added"
    redirect_to controller: "flights", action: "show", id: params[:review][:flight_id]
  end



  # The controller for deleting a review. The user should have been prompted
  # to make sure that they really wanted to delete the review.
  def destroy
    begin
      @review_to_destroy = Review.find(params[:id])
      @flight_id_for_redirect = @review_to_destroy.flight.id
      @review_to_destroy.destroy
      flash[:notice] = "Review Successfully Removed"
    rescue ActiveRecord::RecordNotFound
      flash[:error] = "Review Not Found"
      @flight_id_for_redirect = -1
    end

    if @flight_id_for_redirect == -1
      redirect_to controller: "flights", action: "index"
    else
      redirect_to controller: "flights", action: "show", id: @flight_id_for_redirect
    end
  end



  # Controller for editing a review. This controller shows the edit form and populates
  # the fields with the current values.
  def edit
    begin
      @review_to_edit = Review.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      @review_to_edit = nil
    end
  end



  # Controller that actually updates a review. Takes the new values for the type of review
  # and the name of the reviewer from the form and updates them in the database.
  def update
    begin
      @review_to_update = Review.find(params[:id])
      @review_to_update.update(review_update_params)
      flash[:notice] = "Review Successfully Updated"
    rescue ActiveRecord::RecordNotFound
      flash[:error] = "Review Not Found"
    end

    redirect_to controller: "flights", action: "show", id: @review_to_update.flight.id
  end





  private

  # Helper function that sets the parameters allowed for creating a
  # review (strong parameters)
  def review_params
    params.require(:review).permit(:review_date, :name_of_reviewer, :flight_review,
                                   :instrument_proficiency_check, :cfi_renewal, :flight_id)
  end



  # Helper function that sets the parameters allowed for editing a
  # review (strong parameters)
  def review_update_params
    params.require(:review).permit(:name_of_reviewer, :flight_review, :instrument_proficiency_check,
                                   :cfi_renewal)
  end

end
