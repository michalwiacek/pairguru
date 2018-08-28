class HomeController < ApplicationController
  def welcome; end
  
  def top_commenters
    @top_commenters ||= Comment.last_week_comments.group(:user).limit(10).order('count_all').count
  end
end
