class CheckridesController < ApplicationController

  # Ensure that a user is logged in
  before_action :authenticate_user!



  # The controller for displaying the form where a user can add a checkride
  def new
    begin
      @current_flight = Flight.find(params[:flight_id])
    rescue ActiveRecord::RecordNotFound
      @current_flight = nil
    end
  end



  # The controller for the POST method where a user is adding a checkride.
  # Creates the checkride with the appropriate flight, saves the checkride
  # in the database, and then redirects to the list of flights.
  def create
    @new_checkride = Checkride.new(checkride_params)
    @new_checkride.save

    # TODO - Change this to redirect to the page where the user was before
    # adding a checkride?
    redirect_to controller: "flights", action: "index"
  end





  private

  # Helper function that sets the parameters allowed for creating a
  # checkride (strong parameters)
  def checkride_params
    params.require(:checkride).permit(:checkride_date, :examiner_name, :cfi, :cfii, :instrument,
                                      :certificate, :certificate_type, :single_engine_land,
                                      :single_engine_sea, :multi_engine_land, :multi_engine_sea,
                                      :rotorcraft, :glider, :powered_lift, :lighter_than_air,
                                      :flight_id)
  end
end
