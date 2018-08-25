require 'rails_helper'

describe 'Api v1 Movies request', type: :request do
  let!(:genres) { create_list(:genre, 2, :with_movies) }
  
  describe 'index' do
    before :each do
      visit '/api/v1/movies'
    end

    it 'responds with json' do
      expect(page.response_headers['content-type']).to include 'application/json'
    end

    it 'displays titles' do
      json = JSON.parse(body)
      expect(json.length).to eq(10) 
      expect(json.first['title']).to eq genres.first.movies.first.title
    end
  end

  describe 'show' do
    before :each do
      visit "/api/v1/movies/#{genres.first.movies.first.id}"
    end

    it 'responds with json' do
      expect(page.response_headers['content-type']).to include 'application/json'
    end

    it 'displays movie' do
      json = JSON.parse(body)
      expect(json['title']).to eq genres.first.movies.first.title
      expect(json['id']).to eq genres.first.movies.first.id
    end
  end
end