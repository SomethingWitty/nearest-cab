class CabsController < ApplicationController
	before_filter :check_lat_long, :only => [:create, :update]
  def index
		@cabs = Cab.all
  end
	def create
		Cab.new(:latitude => params[:latitude], :longitude => params[:longitude]).save
		head :status => 200
	end
	def update	
		params.require(:id)
		cab = Cab.find(params[:id])
		cab.update_attributes(:latitude => params[:latitude], :longitude => params[:longitude])
		render :status => 200
	end
	def destroy
		params.require(:id)
		Cab.find(params[:id]).destroy
		head :status => 200
	end
	def destroy_all
		Cab.destroy_all
		head :status => 200
	end
	def check_lat_long
		params.require(:latitude)
		params.require(:longitude)
	end
end
