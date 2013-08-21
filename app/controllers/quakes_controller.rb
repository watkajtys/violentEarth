class QuakesController < ApplicationController

	def new
		@quake = Quake.new
	end

	def create
		@quake = Quake.new params[:quake]
		if @quake.save
			redirect_to [:root], notice: "saved"
		else
			redirect_to [:root], alert: @quake.errors.full_messages
		end
	end

end