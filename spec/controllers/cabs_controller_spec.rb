require 'spec_helper'

describe CabsController do
	context 'create' do
		it 'create should increase the number of cabs with valid args' do
			params = {:latitude => 50, :longitude => 50}
			init_cabs_size = Cab.all.length
			post :create, params
			expect(Cab.all.length).to eq(init_cabs_size + 1)
		end
		it 'should not create a cab when an invalid latitude is passed in' do
			params = {:latitude => 5000, :longitude => 50}
			init_cabs_size = Cab.all.length
			post :create, params
			expect(Cab.all.length).to eq(init_cabs_size)
		end
		it 'should not create a cab when an invalid longitude is passed in' do
			params = {:latitude => 50, :longitude => 5000}
			init_cabs_size = Cab.all.length
			post :create, params
			expect(Cab.all.length).to eq(init_cabs_size)
		end
	end
	context 'update' do
		let(:cab1) {Cab.create(:latitude => 50, :longitude => 50)}
		it 'should update an existing record when latitude and longitude are both passed in' do 
			params = {:latitude => 60, :longitude => 60, :id => cab1.id}
			put :update, params
			updated_cab = Cab.find(cab1.id)
			expect(updated_cab.latitude).to eq(60)
			expect(updated_cab.longitude).to eq(60)
		end
		it 'should update only latitude when only latitude is passed in as a param' do
			params = {:latitude => 60, :id => cab1.id}
			put :update, params
			updated_cab = Cab.find(cab1.id)
			expect(updated_cab.latitude).to eq(60)
			expect(updated_cab.longitude).to eq(50)
		end
		it 'should update only longitude when only longitude is passed in as a param' do
			params = {:longitude => 60, :id => cab1.id}
			put :update, params
			updated_cab = Cab.find(cab1.id)
			expect(updated_cab.latitude).to eq(50)
			expect(updated_cab.longitude).to eq(60)
		end
	end
	context 'delete' do
		let(:cab1) {Cab.create(:latitude => 50, :longitude => 50)}
		let(:cab2) {Cab.create(:latitude => 40, :longitude => 40)}
		it 'should decrease in size by one when deleting a single cab' do
			params = {:id => cab1.id}
			init_size = Cab.all.length
			delete :destroy, params
			expect(init_size-1).to eq(Cab.all.length)
		end
		it 'should have a length of zero when using delete all' do
			init_size = Cab.all.length
			delete :destroy_all
			expect(0).to eq(Cab.all.length)
		end
	end
end
