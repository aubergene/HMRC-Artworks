class ContactsController < ApplicationController

  def index
    @contacts = Contact.find(:all, :order => "name")

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @artworks }
    end
  end

  def show
    @contact = Contact.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @artwork }
    end
  end

end
