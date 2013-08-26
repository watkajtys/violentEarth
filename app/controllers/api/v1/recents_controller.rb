class Api::V1::RecentsController < ApplicationController
   respond_to :json

   def index
      @recents = Quake.day.order_by(:time => :desc)
      respond_with @recents
   end

end