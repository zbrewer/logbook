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
  def day_current?
    last_day = User.last_landing_current_date(self.oldest_day_currency_flight)
    last_day != nil && last_day >= Date.today && self.certificate_type != "STU"
  end



  # Returns true if the pilot is night current and false otherwise
  def night_current?
    last_day = User.last_landing_current_date(self.oldest_night_currency_flight)
    last_day != nil && last_day >= Date.today && self.certificate_type != "STU" && self.certificate_type != "SPT" && self.certificate_type != "RPL"
  end



  # Returns the last date during which the user is day current
  def last_day_current_date
    User.last_landing_current_date(oldest_day_currency_flight)
  end



  # Returns the last date during which the user is night current
  def last_night_current_date
    User.last_landing_current_date(oldest_night_currency_flight)
  end



  # Returns true if the user is instrument rated and false otherwise
  def instrument_rated?
    flight_list = self.flights.order(:flight_date).reverse

    for flight in flight_list do
      if flight.checkride != nil and flight.checkride.instrument
        return true
      end
    end

    return false
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



  # Returns the date of the last flight review or equivelent
  def date_of_last_flight_review
    flight_list = self.flights.order(:flight_date).reverse

    for flight in flight_list do
      if (flight.review != nil and flight.review.flight_review) or flight.checkride != nil
        return flight.flight_date
      end
    end

    return nil
  end



  # Returns the date of the last day on which a user can act as PIC (fly without a new flight review)
  def last_pic_date
    last_flight_review = self.date_of_last_flight_review

    if last_flight_review == nil or self.certificate_type == "STU"
      return nil
    else
      return DateHelpers.calendar_months_from(last_flight_review, 24)
    end
  end



  # Returns whether or not the user is current to act as PIC (flight review)
  def pic_current?
    last_current_date = self.last_pic_date

    if last_current_date == nil
      return nil
    else
      return last_current_date >= Date.today
    end
  end



  # Returns the longest flight (total time) or nil if there are no flights
  def longest_flight
    flight_list = self.flights.order(:total_time).reverse
    flight_list[0]
  end



  # Gets the total number of day landings
  def total_day_landings
    flight_list = self.flights
    total_landings = 0

    for flight in flight_list do
      total_landings += flight.day_landings
    end

    return total_landings
  end



  # Gets the total number of night landings
  def total_night_landings
    flight_list = self.flights
    total_landings = 0

    for flight in flight_list do
      total_landings += flight.night_landings
    end

    return total_landings
  end

end
