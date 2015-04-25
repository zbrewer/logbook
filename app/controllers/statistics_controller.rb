class StatisticsController < ApplicationController

  # Ensure that a user is logged in
  before_action :authenticate_user!



  # The controller for displaying all of the statistics
  def index
  end

end
