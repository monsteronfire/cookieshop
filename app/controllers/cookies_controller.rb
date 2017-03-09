class CookiesController < ApplicationController
  before_action :set_cookie, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @cookies = Cookie.all
  end

  def show
  end

  def new
    @cookie = Cookie.new
    authorize @cookie
  end

  def create
    @cookie = Cookie.new(cookie_params)
    authorize @cookie

    if @cookie.save
      redirect_to @cookie
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    authorize @cookie
    if @cookie.update(cookie_params)
      redirect_to @cookie
    else
      render 'edit'
    end
  end

  def destroy
    authorize @cookie
    @cookie.destroy
    redirect_to cookies_path
  end

  private

  def set_cookie
    @cookie = Cookie.find(params[:id])
  end

  def cookie_params
    params.require(:cookie).permit(:name, :description, :jar_size, :allergans)
  end
end
