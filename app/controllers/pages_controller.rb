class PagesController < ApplicationController
  def about
  end

  def services
  end

  def contact
  end

  def certification
    @posts_certification = Post.all.select{|post| post.category == "Certification"}
  end

  def insurance
    @posts_insurance = Post.all.select{|post| post.category == "Insurance"}
  end

  def news
    @posts_news = Post.all.select{|post| post.category == "News"}
  end
end