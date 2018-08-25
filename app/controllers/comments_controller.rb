class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    movie        = Movie.find(params[:movie_id])
    comment      = movie.comments.build(comment_params)
    comment.user = current_user

    if Comment.where(user: current_user, movie: movie).count >= 1
      redirect_to movie, flash: { danger: 'You can post only one comment per movie' }
    else
      if comment.save
        redirect_to movie, notice: 'Comment has been added'
      else
        redirect_to movie, flash: { danger: 'Something went wrong' }
      end
    end
  end

  def destroy
    comment = Comment.find(params[:id])
    movie   = comment.movie

    if comment.user == current_user
      comment.destroy
      redirect_to movie, notice: 'Comment has been deleted'
    else
      redirect_to movie, flash: { danger: 'Something went wrong' }
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end