class MypageController < ApplicationController
  before_action :require_login
  def index
  end

  def cart
  end

  def history
    #binding.pry
    @histories = History.where(user_name: current_user.email).page(params[:page]).order("created_at DESC").per(10)
  end
  private
  def require_login
    unless user_signed_in?
      redirect_to("/users/sign_in?redirect=#{request.url}")
      flash[:alert] = "ログインしてください。"
    end 
  end
end

