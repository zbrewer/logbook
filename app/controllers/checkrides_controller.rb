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
    redirect_to controller: "flights", action: "show", id: params[:checkride][:flight_id]
  end



  # Controller for deleting a checkride. The user should be prompted
  # to make sure that they really want to delete the checkride.
  def destroy
    begin
      @checkride_to_destroy = Checkride.find(params[:id])
      @flight_id_for_redirect = @checkride_to_destroy.flight.id
      @checkride_to_destroy.destroy
      # TODO - display a success message
    rescue ActiveRecord::RecordNotFound
      @flight_id_for_redirect = -1
      # TODO - Display an error message
    end

    if @flight_id_for_redirect == -1
      redirect_to controller: "flights", action: "index"
    else
      redirect_to controller: "flights", action: "show", id: @flight_id_for_redirect
    end
  end



  # Controller that display the form to edit checkrides. All of the fields
  # should be populated with the current values.
  def edit
    begin
      @checkride_to_edit = Checkride.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      @checkride_to_edit = nil
    end
  end



  # Controller that actually updates a checkride. Takes the new values from the
  # edit form and saves them in the database.
  def update
    begin
      @checkride_to_update = Checkride.find(params[:id])
      @checkride_to_update.update(checkride_update_params)
      # TODO - Display success message
    rescue ActiveRecord::RecordNotFound
      # TODO - Display an error message
    end

    redirect_to controller: "flights", action: "show", id: @checkride_to_update.flight.id
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



  # Helper function that sets the parameters allowed for updating a
  # checkride (strong parameters)
  def checkride_update_params
    params.require(:checkride).permit(:examiner_name, :cfi, :cfii, :instrument,
                                      :certificate, :certificate_type, :single_engine_land,
                                      :single_engine_sea, :multi_engine_land, :multi_engine_sea,
                                      :rotorcraft, :glider, :powered_lift, :lighter_than_air)
  end
end
