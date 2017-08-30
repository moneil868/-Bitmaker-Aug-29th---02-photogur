class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
  end

  def edit
  @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])

    @post.title = params[:post][:title]
    @post.summary = params[:post][:summary]
    @post.date = params[:post][:date]


    if @post.save
      redirect_to "/posts/#{@post.id}"
    else
      render :edit
    end
  end


  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to "/posts"
  end

end
