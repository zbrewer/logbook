class MedicalsController < ApplicationController

  # Make sure that there is a user signed in
  before_action :authenticate_user!



  # The controller for the form where a user can add a new medical
  def new
  end



  # The controller for the POST method where the user is adding
  # a medical. Creates a medical based on the parameters in the
  # form the user filled out, assigns the medical to the current
  # user, and redirects to the list of medicals.
  def create
    @new_medical = Medical.new(medical_params)
    @new_medical.user = current_user
    @new_medical.save

    # TODO - Should this redirect to the page where the user was
    # before adding the medical?
    redirect_to action: "index"
  end



  # The controller for the page that shows the list of medicals.
  # Gets a list of medicals (sorted by exam date) that is
  # accessible in the view.
  def index
    @medical_list = current_user.medicals.order(:exam_date)
  end





  private

  # Sets up the allowed parameters when adding a new medical (strong params)
  def medical_params
    params.require(:medical).permit(:medical_class, :exam_date, :examiner_name)
  end

end
