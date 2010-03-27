class VisitRequestsController < ApplicationController

  # GET /visit_requests
  # GET /visit_requests.xml
  def index
    @visit_requests = VisitRequest.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @visit_requests }
    end
  end

  # GET /visit_requests/1
  # GET /visit_requests/1.xml
  def show
    @visit_request = VisitRequest.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @visit_request }
    end
  end

  # GET /visit_requests/new
  # GET /visit_requests/new.xml
  def new
    @artwork = Artwork.find(params[:artwork_id])
    @visit_request = VisitRequest.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @visit_request }
    end
  end

  # GET /visit_requests/1/edit
  def edit
    @visit_request = VisitRequest.find(params[:id])
  end

  # POST /visit_requests
  # POST /visit_requests.xml
  def create
    @visit_request = VisitRequest.new(params[:visit_request])

    respond_to do |format|
      if @visit_request.save
        flash[:notice] = 'VisitRequest was successfully created.'
        format.html { redirect_to(@visit_request) }
        format.xml  { render :xml => @visit_request, :status => :created, :location => @visit_request }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @visit_request.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /visit_requests/1
  # PUT /visit_requests/1.xml
  def update
    @visit_request = VisitRequest.find(params[:id])

    respond_to do |format|
      if @visit_request.update_attributes(params[:visit_request])
        flash[:notice] = 'VisitRequest was successfully updated.'
        format.html { redirect_to(@visit_request) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @visit_request.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /visit_requests/1
  # DELETE /visit_requests/1.xml
  def destroy
    @visit_request = VisitRequest.find(params[:id])
    @visit_request.destroy

    respond_to do |format|
      format.html { redirect_to(visit_requests_url) }
      format.xml  { head :ok }
    end
  end
end
