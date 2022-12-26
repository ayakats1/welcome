class User::SearchesController < ApplicationController
  before_action :authenticate_user!

  def search
    @range = params[:range]
    @posts = Post.looks(params[:word], params[:range])
  end
end
