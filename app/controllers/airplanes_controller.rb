class AirplanesController < ApplicationController
  before_action :authenticate_user!

   def new
   end

   def create
     @new_airplane = Airplane.new(airplane_params)
     @new_airplane.user = current_user
     @new_airplane.save
     redirect_to action: "index"
   end

   def index
     @airplane_list = current_user.airplanes
   end

   private
    def airplane_params
      params.require(:airplane).permit(:identification, :complex, :high_performance, :tailwheel, :high_altitude,
                                       :turbine, :glider, :rotorcraft, :powered_lift, :lighter_than_air,
                                       :single_engine_land, :single_engine_sea, :multi_engine_land,
                                       :multi_engine_sea, :simulator, :display_name, :airplane_type)
    end
end
