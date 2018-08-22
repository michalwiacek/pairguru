class MovieDecorator < Draper::Decorator
  delegate_all

  def cover
    "https://pairguru-api.herokuapp.com#{get_movie.dig('data','attributes','poster')}"
  end

  def description
    get_movie_attr.dig('plot')
  end

  def rating
    get_movie_attr.dig('rating')
  end

  private
  
  def get_movie_attr
    attributes ||= get_movie.dig('data','attributes')
  end
  
  def get_movie
    response = PairguruAdapter.new.get_movie(self.title)
  end
end
