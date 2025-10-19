# app/controllers/comments_controller.rb
class CommentsController < ApplicationController
  before_action :set_movie

  def create
    @comment = @movie.comments.build(comment_params)
    @comment.user = current_user if user_signed_in?

    if @comment.save
      redirect_to @movie, notice: 'Comentário adicionado com sucesso!'
    else
      @comments = @movie.comments.recent_first
      render 'movies/show', status: :unprocessable_entity
    end
  end

  private

  def set_movie
    @movie = Movie.find(params[:movie_id])
  end

  def comment_params
    params.require(:comment).permit(:content, :commenter_name)
  end
end