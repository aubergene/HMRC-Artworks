class ArtworksController < ApplicationController

  def home_page
    @artworks_count = Artwork.count
  end

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
    @visit_request = VisitRequest.new

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @artwork }
    end
  end

end
