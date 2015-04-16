class FlightsController < ApplicationController

  # Makes sure that a user is signed in
  before_action :authenticate_user!



  # The controller for the form where a user can add a new flight. Gets a list
  # of airplanes that the user can choose from/are accessible in the view.
  def new
    @airplane_list = current_user.airplanes
  end



  # The controller for the POST method when a user is creating a new flight.
  # Creates the flight based on the parameters supplied in the form, saves it
  # to the database, and redirects the user to the list of flights.
  def create
    @new_flight = Flight.new(flight_params)
    @new_flight.save

    # TODO - Should this redirect to the page where the user was before adding
    # a flight?
    redirect_to action: "index"
  end



  # The controller for showing a list of flights. Gets a list of flights that
  # is accessible in the view. The list is sorted by date with the most recent
  # flights being displayed first.
  def index
    @flight_list = current_user.flights.order(:flight_date).reverse
  end



  # The controller for showing information about a specific flight. Gets the
  # current flight based on the id in the params or nil if the flight is not
  # found.
  def show
    begin
      @current_flight = Flight.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      @current_flight = nil
    end

    # TODO - Move this somewhere central
    # All of the times stored in the flight to display (if they are non-zero)
    @times_to_display = { "total_time" => "Total Time", "pic_time" => "PIC", "sic_time" => "SIC",
                          "dual_received" => "Dual Received", "dual_given" => "Dual Given",
                          "actual_instrument" => "Actual Instrument", "simulated_instrument" =>
                          "Simulated Instrument", "night_time" => "Night", "cross_country_time" =>
                          "Cross Country", "solo_time" => "Solo" }

    # TODO - Move this somewhere central
    # All of the attributes of airplanes to display flight time based on
    @airplane_display_times = { "complex" => "Complex", "high_performance" => "High Performance",
                                "tailwheel" => "Tailwheel", "high_altitude" => "High Altitude",
                                "turbine" => "Turbine", "glider" => "Glider", "rotorcraft" =>
                                "Rotorcraft", "powered_lift" => "Powered Lift", "lighter_than_air" =>
                                "Lighter Than Air", "single_engine_land" => "Single Engine Land",
                                "single_engine_sea" => "Single Engine Sea", "multi_engine_land" =>
                                "Multi-Engine Land", "multi_engine_sea" => "Multi-Engine Sea",
                                "simulator" => "Simulator" }

    # TODO - Move this somewhere central
    # All of the different types of reviews to show
    @review_types = { "flight_review" => "BFR", "instrument_proficiency_check" => "IPC",
                      "cfi_renewal" => "CFI Renewal" }

    # TODO - Move this to somewhere central
    # All of the different types of checkride that might be displayed
    @checkride_types = { "cfi" => "CFI", "cfii" => "CFII", "instrument" => "Instrument",
                         "single_engine_land" => "Single Engine Land", "single_engine_sea" =>
                         "Single Engine Sea", "multi_engine_land" => "Multi-Engine Land",
                         "multi_engine_sea" => "Multi-Engine Sea", "rotorcraft" => "Rotorcraft",
                         "glider" => "Glider", "powered_lift" => "Powered Lift", "lighter_than_air" =>
                         "Lighter Than Air" }
  end





  private

  # Specifies which parameters are allowed when creating a new flight (strong parameters)
  def flight_params
    params.require(:flight).permit(:flight_date, :total_time, :pic_time, :sic_time, :dual_received,
                                   :dual_given, :day_landings, :night_landings, :actual_instrument,
                                   :simulated_instrument, :number_approaches, :number_holds, :remarks,
                                   :departure_airport, :destination_airports, :night_time,
                                   :cross_country_time, :solo_time, :airplane_id)
  end

end
