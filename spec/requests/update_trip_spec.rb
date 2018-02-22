require 'rails_helper'

describe 'PUT /api/v1/trips/1' do
  let!(:trips) { FactoryBot.create_list(:trip, 10) }

  before {
    put '/api/v1/trips/1',
    params: { :driver => "update_test_driver", :state => "completed" }
  }

  it 'returns the driver name' do
    body = JSON.parse(response.body)['data']['attributes']
    expect(body['driver']).to eq('update_test_driver')
  end

  it 'returns the trip state' do
    body = JSON.parse(response.body)['data']['attributes']
    expect(body['state']).to eq('completed')
  end

  it 'returns a updated status' do
    expect(response).to have_http_status(:ok)
  end
end