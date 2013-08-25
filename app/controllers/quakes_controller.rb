class QuakesController < ApplicationController

	def new
		@quake = Quake.new
	end

	def create
		@quake = Quake.new params[:quake]
	end

end