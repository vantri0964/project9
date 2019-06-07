class Admin::StatisticalsController < ApplicationController
  def index
    @microposts = Micropost.all
    @users = User.all
  end
end
