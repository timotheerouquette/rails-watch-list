class BookmarksController < ApplicationController
  def new
    @list = List.find(params[:list_id])
    @bookmark= Bookmark.new()
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    @list = List.find(params[:list_id])
    @bookmark.list = @list
    @movie = Movie.find(params[:bookmark][:movie_id])
    @bookmark.movie = @movie
    @bookmark.save!
    redirect_to list_path(@list)
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:movie, :list, :comment)
  end
end
