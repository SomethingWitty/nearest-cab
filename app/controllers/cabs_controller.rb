class CabsController < ApplicationController
	before_filter :check_lat_long, :only => [:create, :update]
	EARTH_RADIUS_MI = 3959
  def index
		params.require(:latitude)
		params.require(:longitude)
		params.permit(:limit, :radius)
		@latitude = params[:latitude].to_f
		@longitude = params[:longitude].to_f

		radius = params[:radius]? params[:radius] : EARTH_RADIUS_MI #either use the passed in radius or else use the earth's radius to grab everything
		limit = params[:limit]? params[:limit] : Cab.all.length #either use the passed in limit or else return all of the taxis in the db
		@cabs = Cab.where("(? * acos( cos( radians(?) ) * cos( radians(latitude)) * cos(radians(longitude) - radians(?) ) + sin( radians(?) ) * sin( radians( latitude ) ) ) ) < ", EARTH_RADIUS_MI, @latitude, @longitude, @latitude, radius)
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
