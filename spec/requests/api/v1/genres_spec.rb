require 'rails_helper'

describe 'Api v1 Genres request', type: :request do
  let!(:genres) { create_list(:genre, 2, :with_movies) }
  
  describe 'index' do
    before :each do
      visit '/api/v1/genres'
    end

    it 'responds with json' do
      expect(page.response_headers['content-type']).to include 'application/json'
    end

    it 'displays genres' do
      json = JSON.parse(body)
      expect(json.length).to eq(2)
    end
  end

  describe 'show' do
    before :each do
      visit "/api/v1/genres/#{genres.first.id}"
    end

    it 'responds with json' do
      expect(page.response_headers['content-type']).to include 'application/json'
    end

    it 'displays genre with movies' do
      json = JSON.parse(body)
      expect(json['name']).to eq genres.first.name
      expect(json['movies_amount']).to eq(5)
      expect(json['movies'].length).to eq(5)
    end
  end
end