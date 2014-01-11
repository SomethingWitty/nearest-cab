class CabsController < ApplicationController
	before_filter :check_lat_long, :only => [:create, :update]
  def index
		params.require(:latitude)
		params.require(:longitude)
		params.permit(:limit, :radius)
		@latitude = params[:latitude].to_f
		@longitude = params[:longitude].to_f
		@cabs = Cab.all
  end
	def create
		Cab.create(:latitude => params[:latitude], :longitude => params[:longitude])
		head :status => 200
	end
	def update	
		params.require(:id)
		cab = Cab.find(params[:id])
		cab.update_attributes(:latitude => params[:latitude], :longitude => params[:longitude])
		head :status => 200
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
