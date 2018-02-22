describe 'GET /api/v1/trips' do
  let!(:trips) { FactoryBot.create_list(:trip, 10) }

  before { get '/api/v1/trips', headers: { 'Accept': 'application/vnd' } }

  it 'returns HTTP status 200' do
    expect(response).to have_http_status 200
  end

  it 'returns all trips' do
    body = JSON.parse(response.body)
    expect(body['data'].size).to eq(10)
  end
end