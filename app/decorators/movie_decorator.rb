class MovieDecorator < Draper::Decorator
  delegate_all

  def cover
    "https://pairguru-api.herokuapp.com#{get_movie['poster']}"
  end

  def description
    get_movie['plot']
  end

  def rating
    get_movie['rating']
  end

  private
  
  def get_movie
    response = PairguruAdapter.new.get_movie(self.title)
  end
end
