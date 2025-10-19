# app/controllers/movies_controller.rb
class MoviesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_movie, only: [:show, :edit, :update, :destroy]
  before_action :authorize_user!, only: [:edit, :update, :destroy]

  def index
    @movies = Movie.includes(:user)
                   .recent_first
                   .page(params[:page])
  end

  def show
    @comments = @movie.comments.includes(:user).recent_first
    @comment = Comment.new
  end

  def new
    @movie = current_user.movies.build
  end

  def create
    @movie = current_user.movies.build(movie_params)

    if @movie.save
      redirect_to @movie, notice: 'Filme criado com sucesso!'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @movie.update(movie_params)
      redirect_to @movie, notice: 'Filme atualizado com sucesso!'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @movie.destroy
    redirect_to movies_path, notice: 'Filme removido com sucesso!'
  end

  private

  def set_movie
    @movie = Movie.find(params[:id])
  end

  def authorize_user!
    unless @movie.user == current_user
      redirect_to movies_path, alert: 'Você não tem permissão para esta ação.'
    end
  end

  def movie_params
    params.require(:movie).permit(:title, :synopsis, :year, :duration, :director)
  end
end