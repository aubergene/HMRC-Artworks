class ArtworksController < ApplicationController

  def home_page
    @artworks_count = Artwork.count
  end

  def index
    @artworks = Artwork.paginate(:all, :page => params[:page], :order => "category")

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
  
  def search
    @artworks = Artwork.paginate(:all, :conditions => ["description LIKE ? OR description LIKE ?", "% " + params[:q] + "%", params[:q] + "%"], :page => request[:page])
  end

end
