class User::CommentsController < ApplicationController
  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  private

  def comment_params
    params.require(:comment).permit(:post_id, :comment)
  end
end
