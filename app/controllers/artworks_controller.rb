class ArtworksController < ApplicationController
  # GET /artworks
  # GET /artworks.xml
  def index
    @artworks = Artwork.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @artworks }
    end
  end

  # GET /artworks/1
  # GET /artworks/1.xml
  def show
    @artwork = Artwork.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @artwork }
    end
  end

end
