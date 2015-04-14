class MedicalsController < ApplicationController
  before_action :authenticate_user!
  def new
  end

  def create
    @new_medical = Medical.new(medical_params)
    @new_medical.user = current_user
    @new_medical.save
    redirect_to "/"
  end

  private
    def medical_params
      params.require(:medical).permit(:medical_class, :exam_date, :examiner_name)
    end
end
