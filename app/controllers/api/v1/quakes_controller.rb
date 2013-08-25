class Api::V1::QuakesController < ApplicationController
   respond_to :json

   def index
      @quakes = Quake.order_by(:time => :desc)
      respond_with @quakes
   end

end