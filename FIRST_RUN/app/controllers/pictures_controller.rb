class PicturesController < ApplicationController

  before_action :ensure_logged_in, except: [:show, :index]
  before_action :load_picture, only: [:show, :edit, :update, :destroy]
  before_action :ensure_user_owns_picture, only: [:edit, :update, :destroy]


  def load_picture
    @picture = Picture.find(params[:id])
  end

  def index
    @pictures = Picture.all

    @most_recent_pictures = Picture.most_recent_five

    time_now = Time.now
    last_month = Time.utc(time_now.year, time_now.month - 1)
    @one_month_old_pictures = Picture.created_before(last_month)

    @pictures_2016 = Picture.pictures_created_in_year("2016%")
    @pictures_2017 = Picture.pictures_created_in_year("2017%")
  end

  def show
    load_picture
  end

  def new
    @picture = Picture.new
  end

  def create
    @picture = Picture.new

    @picture.title = params[:picture][:title]
    @picture.artist = params[:picture][:artist]
    @picture.url = params[:picture][:url]

    @picture.user_id = current_user.id

    if @picture.save
      # if the picture gets saved, generate a get request to "/pictures" (the index)
      redirect_to "/pictures"
    else
      # otherwise render new.html.erb
      render :new
    end
  end

  def edit
  load_picture
  end

  def update
    load_picture

    @picture.title = params[:picture][:title]
    @picture.artist = params[:picture][:artist]
    @picture.url = params[:picture][:url]
    @picture.created_at = params[:picture][:created_at]


    if @picture.save
      redirect_to "/pictures/#{@picture.id}"
    else
      render :edit
    end
  end

  def destroy
    load_picture
    @picture.destroy
    redirect_to "/pictures"
  end


end
