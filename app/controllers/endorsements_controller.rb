class EndorsementsController < ApplicationController

  # Ensure that a user is logged in
  before_action :authenticate_user!



  # Controller for displaying the form where a user can add an endorsement
  def new
  end



  # The controller for the POST method where a user is adding an endorsement.
  # Creates the endorsement, sets the user to the current user, saves the endorsement
  # in the database, and redirects to the list of endorsements.
  def create
    @new_endorsement = Endorsement.new(endorsement_params)
    @new_endorsement.user = current_user
    @new_endorsement.save

    # TODO - Change this to redirect to the page where the user was before
    # adding an endorsement?
    redirect_to action: "index"
  end



  # The controller for showing a list of all endorsements. Gets a list of
  # the current user's endorsements that is accessible in the view
  def index
    @endorsement_list = current_user.endorsements

    # TODO - Put this in a more central location
    @endorsement_types = { "complex" => "Complex", "high_performance" => "High Performance",
                           "tailwheel" => "Tailwheel", "high_altitude" => "High Altitude" }
  end





  private

  # Helper function that sets the parameters allowed for creating an
  # endorsement (strong parameters)
  def endorsement_params
    params.require(:endorsement).permit(:endorsement_date, :cfi_name, :cfi_certificate_number,
                                 :cfi_expiration_date, :complex, :high_performance,
                                 :tailwheel, :high_altitude)
  end

end
