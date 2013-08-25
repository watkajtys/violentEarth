class Api::V1::MagnitudesController < ApplicationController
   respond_to :json

   def index
      @magnitudes = Quake.order_by(:time => :desc)
      respond_with @magnitudes
   end
end