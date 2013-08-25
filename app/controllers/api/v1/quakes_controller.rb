class Api::V1::QuakesController < ApplicationController
   respond_to :json

   def index
      @quakes = Quake.day.order_by(:time => :desc)
      respond_with @quakes
   end

end