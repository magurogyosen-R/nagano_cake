class Admin::GenresController < ApplicationController
  def new
    @genre = Genre.new
  end

  def create
    genre = Genre.new(genre_params)
    genre.save
    redirect_to '/admin/genres'
  end

  def index
    @genre = Genre.new
    @genres = Genre.all
  end

  def edit
  end
end

private
  def genre_params
    params.require(:genre).permit(:name)
  end