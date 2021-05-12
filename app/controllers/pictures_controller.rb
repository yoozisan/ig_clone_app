class PicturesController < ApplicationController
  before_action :set_picture, only: [:show, :edit, :update, :destroy]  
  skip_before_action :login_required, only: [:new, :create, :show, :edit, :confirm, :destroy]

  def new
    @picture = Picture.new
  end

  def create
    @picture = Picture.new(picture_params)
    if params[:back]
      render :new
		else
      if @picture.save
        redirect_to pictures_path, notice: "ブログを作成しました！"
    	else
    		render :new
      end
    end
  end

  def index
    @pictures = Picture.all
  end

  def show
  end

  def edit
  end

  def update
    if @picture.update(picture_params)
      redirect_to pictures_path, notice: "ブログを編集しました！"
    else
      render :edit
    end
  end

  def destroy
    @picture.destroy
 		redirect_to pictures_path, notice:"ブログを削除しました！"
 	end

  def confirm
    @picture = Picture.new(picture_params)
    render :new if @picture.invalid?
  end

  private
  def picture_params
    params.require(:picture).permit(:title, :content)
  end

  def set_picture
    @picture = Picture.find(params[:id])
  end


end
