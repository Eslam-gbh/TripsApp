require 'rails_helper'

describe 'POST /api/v1/trips' do
  before {
    post '/api/v1/trips',
    params: { :driver => "test_driver", :state => "ongoing" }
}

  it 'returns the driver name' do
    body = JSON.parse(response.body)['data']['attributes']
    expect(body['driver']).to eq('test_driver')
  end

  it 'returns the quote content' do
    body = JSON.parse(response.body)['data']['attributes']
    expect(body['state']).to eq('ongoing')
  end

  it 'returns a created status' do
    expect(response).to have_http_status(:created)
  end
end