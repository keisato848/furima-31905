class ItemsController < ApplicationController
  def index
  end

  def create
    @user = User.new
  end
end
