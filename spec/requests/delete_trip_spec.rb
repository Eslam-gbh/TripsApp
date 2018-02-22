require 'rails_helper'

describe 'DELETE /api/v1/trips/1' do
  let!(:trips) { FactoryBot.create_list(:trip, 1) }

  before {
    delete '/api/v1/trips/1'
  }

  it 'returns a deleted status' do
    expect(response).to have_http_status(:ok)
  end
end