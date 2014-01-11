require 'spec_helper'

describe CabsController do
	context 'create' do
		it 'create should increase the number of cabs with valid args' do
			params = {:latitude => 50, :longitude => 50}
			init_cabs_size = Cab.all.length
			post :create, params
			expect(Cab.all.length).to eq(init_cabs_size + 1)
		end
		it 'should not create number of cabs when an invalid latitude is passed in' do
			params = {:latitude => 5000, :longitude => 50}
			init_cabs_size = Cab.all.length
			post :create, params
			expect(Cab.all.length).to eq(init_cabs_size)
	end
end
