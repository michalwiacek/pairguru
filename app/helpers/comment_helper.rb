module CommentHelper
  def user_commented_movie?(movie)
    if Comment.where(user: current_user, movie: movie).count >= 1
      return true
    end
  end
end
