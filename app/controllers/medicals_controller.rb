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
    flash[:notice] = "Medical Successfully Added"
    redirect_to action: "index"
  end



  # The controller for the page that shows the list of medicals.
  # Gets a list of medicals (sorted by exam date) that is
  # accessible in the view.
  def index
    @medical_list = current_user.medicals.order(:exam_date).reverse
  end



  # The controller for deleting a medical. The user should have been prompted
  # to make sure that they really wanted to delete the medical.
  def destroy
    begin
      @medical_to_destroy = Medical.find(params[:id])
      @medical_to_destroy.destroy
      flash[:notice] = "Medical Successfully Deleted"
    rescue ActiveRecord::RecordNotFound
      flash[:error] = "Medical Not Found"
    end

    redirect_to controller: "medicals", action: "index"
  end



  # Controller for editing a medical. This controller shows the edit form and populates
  # the fields with the current values.
  def edit
    begin
      @medical_to_edit = Medical.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      @medical_to_edit = nil
    end
  end



  # Controller that actually updates a medical. Takes the new values from the form and
  # updates them in the database.
  def update
    begin
      @medical_to_update = Medical.find(params[:id])
      @medical_to_update.update(medical_params)
      flash[:notice] = "Medical Successfully Updated"
    rescue ActiveRecord::RecordNotFound
      flash[:error] = "Medical Not Found"
    end

    redirect_to controller: "medicals", action: "index"
  end





  private

  # Sets up the allowed parameters when adding a new medical (strong params)
  def medical_params
    params.require(:medical).permit(:medical_class, :exam_date, :examiner_name)
  end

end
