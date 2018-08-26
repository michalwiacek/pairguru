class HomeController < ApplicationController
  def welcome; end
  
  def top_commenters
    @top_commenters ||= Comment.group(:user).limit(10).order('count_all desc').count
  end
end
