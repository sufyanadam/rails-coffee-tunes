class HomeController < ApplicationController
  def show
  end

  def albums
    render "public/albums.json"
  end
end