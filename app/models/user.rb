class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable

  # TODO - Make sure medicals are deleted if the corresponding
  # user is deleted
  has_many :medicals, inverse_of: :user

  # TODO - Make sure airplanes are deleted when the corresponding
  # user is deleted
  has_many :airplanes, inverse_of: :user

  # TODO - Make sure endorsements are deleted when the corresponding
  # user is deleted
  has_many :endorsements, inverse_of: :user

  # TODO - Test this association more (do flights under different
  # airplanes all show up?)
  has_many :flights, through: :airplanes

  # TODO - Test this association more (do reviews under different
  # flights under different airplanes all show up?)
  has_many :reviews, through: :flights

  # TODO - Test this association more (do checkrides under different
  # flights under different airplanes all show up?)
  has_many :checkrides, through: :flights



  # Include the date helpers (lib/date_helpers.rb)
  include DateHelpers



  # Function that gets the user's most recent medical
  def current_medical
    self.medicals.order(:exam_date).reverse[0]
  end



  # Function that finds the date of the oldest flight needed to get
  # 3 landings (day or night). Day currency is determined from
  # this date. Returns nil if the user hasn't had three landings
  def oldest_day_currency_flight
    flight_list = self.flights.order(:flight_date).reverse
    total_landings = 0

    for flight in flight_list do
      total_landings += flight.day_landings
      total_landings += flight.night_landings

      if total_landings >= 3
        return flight.flight_date
      end
    end

    return nil
  end



  # Function that finds the date of the oldest flight needed to get
  # 3 landings at night. Night currency is determined from
  # this date. Returns nil if the user hasn't had three landings
  def oldest_night_currency_flight
    flight_list = self.flights.order(:flight_date).reverse
    total_landings = 0

    for flight in flight_list do
      total_landings += flight.night_landings

      if total_landings >= 3
        return flight.flight_date
      end
    end

    return nil
  end



  # Given the date of the oldest flight used for landing currency
  # this function returns the last date on which passengers may be
  # carried
  def self.last_landing_current_date(oldest_flight_for_currency)
    if oldest_flight_for_currency == nil
      return nil
    end

    oldest_flight_for_currency + 90
  end



  # Returns true if the pilot is day current and false otherwise
  # TODO - change this to check for student pilots?
  def day_current?
    last_day = User.last_landing_current_date(self.oldest_day_currency_flight)
    last_day != nil && last_day >= Date.today
  end



  # Returns true if the pilot is night current and false otherwise
  # TODO - change this to check for student and other pilot types?
  def night_current?
    last_day = User.last_landing_current_date(self.oldest_night_currency_flight)
    last_day != nil && last_day >= Date.today
  end



  # Returns the last date during which the user is day current
  def last_day_current_date
    User.last_landing_current_date(oldest_day_currency_flight)
  end



  # Returns the last date during which the user is night current
  def last_night_current_date
    User.last_landing_current_date(oldest_night_currency_flight)
  end



  # Returns the date of the oldest flight for instrument currency
  def oldest_instrument_currency_flight
    flight_list = self.flights.order(:flight_date).reverse
    total_approaches = 0
    total_holds = 0

    for flight in flight_list do
      total_approaches += flight.number_approaches
      total_holds += flight.number_holds

      if (total_approaches >= 6 and total_holds >= 1) or (flight.review != nil and flight.review.instrument_proficiency_check) or (flight.checkride != nil and flight.checkride.instrument)
        return flight.flight_date
      end
    end

    return nil
  end



  # Returns the last date that the user is instrument current
  # TODO - Get this to always be nil if the user isn't instrument rated
  def last_instrument_current_date
    oldest_currency_flight = self.oldest_instrument_currency_flight

    if oldest_currency_flight == nil
      return nil
    else
      return DateHelpers.calendar_months_from(oldest_currency_flight, 6)
    end
  end



  # Returns whether or not the user is instrument current
  # TODO - Make this always false if the user isn't instrument rated?
  def instrument_current?
    last_current_date = self.last_instrument_current_date

    if last_current_date == nil
      return false
    else
      return last_current_date >= Date.today
    end
  end

end
