class HomeController < ApplicationController
  before_action :authenticate_user!

  def index
    @supports = Supports::Home.new current_user, params[:page]
  end
end
