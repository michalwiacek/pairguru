class PairguruAdapter
  require "http"
  require "uri"
  API_URL = 'https://pairguru-api.herokuapp.com'

  def initialize()
  end

  def fetch_resource(resource_path)
    make_request(resource_path)
  end

  def get_movie(title)
    path = URI.escape("/api/v1/movies/#{title}")
    result = fetch_resource(path)
    if result
      JSON.parse(result.body).dig('data','attributes')
    else
      {}
    end
  end

  def get_poster(poster_path)
    path = "#{poster_path}"
    result = fetch_resource(poster_path)
  end

  private

  def make_request(path)
    uri = URI("#{API_URL}/#{path}")
    HTTP.get(uri)
  end
end
