class PostsController < ApplicationController
  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if params[:post][:attachments].present?
      params[:post][:attachments].each do |attachment|
        req = Cloudinary::Uploader.upload(attachment)
        @post.attachments << req["public_id"]
      end
    end

    @post.save

    if @post.save
      flash[:success] = "New post successfully created"
      redirect_to post_path(@post)
    else
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if params[:post][:attachments].present?
      params[:post][:attachments].each do |attachment|
        req = Cloudinary::Uploader.upload(attachment)
        @post.attachments << req["public_id"]
      end
    end

    @post.update_attributes(post_params)
    @post.save

    if @post.save
      flash[:success] = "New post successfully updated"
      redirect_to post_path(@post)
    else
      render :edit
    end
  end

  def remove_attachments
    @post = Post.find(params[:id])
    @post.attachments = []
    @post.save
    flash[:success] = "Attachments cleared"
    redirect_to post_path(@post)
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:success] = "Post deleted"
    redirect_to root_path
  end

  private
    def post_params
      params.require(:post).permit(:title, :date, :body, :attachments, :category)
    end
end
