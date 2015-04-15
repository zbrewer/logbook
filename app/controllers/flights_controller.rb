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
