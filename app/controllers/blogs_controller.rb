class BlogsController < ApplicationController
  before_action :set_blog, only: [:show,:edit,:update,:destroy]
  def new
    @blog = Blog.new
  end
  def confirm
    @blog = Blog.new(blog_params)
  end
  def create
    @blog = Blog.new(blog_params)
    if params[:back]
      render :new
    else
      if @blog.save
        redirect_to blogs_path, notice: "Tweetしました"
      else
        render :new
      end
    end
  end
  def show
  end
  def edit
  end
  def update
    if @blog.update(blog_params)
      redirect_to blogs_path, notice: "Tweetが編集されました"
    else
      render :edit
    end
  end
  def index
    @blog = Blog.all
  end
  def destroy
    @blog.destroy
    redirect_to blogs_path,notice:"Tweetを消去しました"
  end
  private
  def set_blog
    @blog = Blog.find(params[:id])
  end
  def blog_params
    params.require(:blog).permit( :content)
  end
end
