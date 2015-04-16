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
