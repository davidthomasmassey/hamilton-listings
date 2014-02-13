class ListingsController < ApplicationController
  http_basic_authenticate_with name: "david", password: "secret", only: :destroy

  def index
    if genre = params[:genre]
      @listings = Listing.where(genre: genre)
    else
      @listings = Listing.all
    end
  end
  
  def show 
    @listing = Listing.all
  end

  def new
    @listing = Listing.new
  end

  def create
    @listing = Listing.new(listing_params)
    
    if @listing.save
      redirect_to @listing
    else 
      render 'new'
    end
  end

  def edit
    @listing = Listing.find(params[:id])
  end
  
  def update
    @listing = Listing.find(params[:id])
    
    if @listing.update(listing_params)
      redirect_to @listing
    else
      render 'edit'
    end
  end
  
  def destroy
    @listing = Listing.find(params[:id])
    @listing.destroy
    redirect_to listings_url
  end
  
  private
    def listing_params
      params.require(:listing).permit(:genre, :title, :location, :date, :info)
    end
end
