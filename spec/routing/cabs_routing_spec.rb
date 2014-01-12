require 'spec_helper'

describe "routes for cabs" do
	it 'should route index requests' do
		expect(:get => "/cabs").to route_to(:controller => "cabs", :action => "index")
	end
	it 'should route delete all requests' do
		expect(:delete => "/cabs").to route_to(:controller => "cabs", :action => "destroy_all")
	end
	it 'should route singular delete requests' do
		expect(:delete => "/cabs/1").to route_to(:controller => "cabs", :action => "destroy", :id => "1")
	end
	it 'should route update requests' do
		expect(:put => "/cabs/1").to route_to(:controller => "cabs", :action => "update", :id => "1")
	end
	it 'should route create requests' do
		expect(:post => "/cabs").to route_to(:controller => "cabs", :action=> "create")
	end
end
