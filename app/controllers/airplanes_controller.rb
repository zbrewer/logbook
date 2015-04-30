class AirplanesController < ApplicationController

  # Ensure that a user is logged in
  before_action :authenticate_user!



  # The controller for displaying the form where a user can add an airplane
  def new
  end



  # The controller for POST method where a user is creating an airplane.
  # Creates the airplane based on the parameters given in the form,
  # assigns it to the current user, saves it in the database, and then
  # redirects to the list of airplanes.
  def create
    @new_airplane = Airplane.new(airplane_params)
    @new_airplane.user = current_user
    @new_airplane.save

    # TODO - Change this to redirect to the page where the user was
    # before adding an airplane?
    flash[:notice] = "Airplane Successfully Added"
    redirect_to action: "index"
  end



  # The controller for viewing a list of all airplanes. Gets a list of
  # airplanes that can be accessed in the view.
  def index
    @airplane_list = current_user.airplanes
  end



  # The controller for showing information about a specific airplane based
  # on the airplane's id. Gracefully handles airplanes that are not found by
  # displaying a "Not found" message.
  def show
    begin
      @current_airplane = Airplane.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      @current_airplane = nil
    end

    # TODO - Move this somewhere central
    # All of the attribute of an airplane to display
    @airplane_display_attributes = { "complex" => "Complex", "high_performance" => "High Performance",
                                     "tailwheel" => "Tailwheel", "high_altitude" => "High Altitude",
                                     "turbine" => "Turbine", "glider" => "Glider", "rotorcraft" =>
                                     "Rotorcraft", "powered_lift" => "Powered Lift", "lighter_than_air" =>
                                     "Lighter Than Air", "single_engine_land" => "Single Engine Land",
                                     "single_engine_sea" => "Single Engine Sea", "multi_engine_land" =>
                                     "Multi-Engine Land", "multi_engine_sea" => "Multi-Engine Sea",
                                     "simulator" => "Simulator" }
  end



  # The controller for deleting an airplane. The user should have been prompted
  # to make sure that they really wanted to delete the airplane.
  def destroy
    begin
      @airplane_to_destroy = Airplane.find(params[:id])
      @airplane_to_destroy.destroy
      # TODO - Display a success message
    rescue ActiveRecord::RecordNotFound
      # TODO - Display an error message
    end

    flash[:notice] = "Airplane Successfully Removed"
    redirect_to controller: "airplanes", action: "index"
  end



  # Controller for editing an airplane. This controller shows the edit form and populates
  # the fields with the current values.
  def edit
    begin
      @airplane_to_edit = Airplane.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      @airplane_to_edit = nil
    end
  end



  # Controller that actually updates an airplane. Takes the new values from the form and
  # updates them in the database.
  def update
    begin
      @airplane_to_update = Airplane.find(params[:id])
      @airplane_to_update.update(airplane_params)
      # TODO - Display success message
    rescue ActiveRecord::RecordNotFound
      # TODO - Display an error message
    end

    flash[:notice] = "Airplane Successfully Updated"
    redirect_to controller: "airplanes", action: "show", id: @airplane_to_update.id
  end





  private

  # Helper function that sets the parameters allowed for creating an
  # airplane (strong parameters)
  def airplane_params
    params.require(:airplane).permit(:identification, :complex, :high_performance, :tailwheel, :high_altitude,
                                     :turbine, :glider, :rotorcraft, :powered_lift, :lighter_than_air,
                                     :single_engine_land, :single_engine_sea, :multi_engine_land,
                                     :multi_engine_sea, :simulator, :display_name, :airplane_type)
  end

end
