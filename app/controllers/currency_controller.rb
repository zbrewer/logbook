class CurrencyController < ApplicationController

  # Ensure that a user is logged in
  before_action :authenticate_user!



  # Controller for the page that shows general currency information including day passenger currency,
  # night passenger currency, medical currency, instrument currency, etc.
  def index
    @current_medical = current_user.current_medical
    if not @current_medical.nil?
      @medical_class = @current_medical.medical_class
    end
  end

end
