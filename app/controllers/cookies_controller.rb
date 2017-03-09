class CookiesController < ApplicationController
  before_filter :set_cookie, only: [:show, :edit, :update, :destroy]

  def index
    @cookies = Cookie.all
  end

  def show
  end

  def new
    @cookie = Cookie.new
  end

  def create
    @cookie = Cookie.new(cookie_params)

    if @cookie.save
      redirect_to @cookie
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @cookie.update(cookie_params)
      redirect_to @cookie
    else
      render 'edit'
    end
  end

  def destroy
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
