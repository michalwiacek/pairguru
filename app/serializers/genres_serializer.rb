class GenresSerializer < ActiveModel::Serializer
  attributes :id, :name, :movies_amount

  has_many :movies

  def movies_amount
    @object.movies.count
  end
end