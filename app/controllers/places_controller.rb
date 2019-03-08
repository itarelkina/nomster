class PlacesController < ApplicationController
  
  def index
    @places = Place.all
    # example 1 @posts = Post.paginate :page => params[:page], :order => 'created_at DESC'
    # example 2 @products = Product.order("name").page(params[:page]).per_page(5)
    # @places = Place.paginate :page => params[:page], :order => 'created_at DESC'
  end

  def new
    @place = Place.new
  end


  def create
    Place.create(place_params)
    redirect_to root_path
  end

  private

  def place_params
    params.require(:place).permit(:name, :description, :address)
  end

end