class PagesController < ApplicationController
  def about
  end

  def services
  end

  def termites
  end

  def insects
  end

  def rodents
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
    # @posts_news = Post.all.order('date DESC').select{|post| post.category == "News"}
    @posts_news = Post.where(:category => 'News').order('date DESC').paginate(:page => params[:page], :per_page => 4)
  end
end
