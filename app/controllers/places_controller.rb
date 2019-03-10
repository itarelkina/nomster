class PlacesController < ApplicationController

    before_action :authenticate_user!, only: [:new, :update]
  
    def index
      @places = Place.all.page(params[:page]).per_page(5)
    end  

    # example 1 @posts = Post.paginate :page => params[:page], :order => 'created_at DESC'
    # example 2 @products = Product.order("name").page(params[:page]).per_page(5)
    # @places = Place.paginate :page => params[:page], :order => 'created_at DESC'

  def new
    @place = Place.new
  end


def create
  @place = current_user.places.create(place_params)
  if @place.valid?
    redirect_to root_path
  else
    render :new, status: :unprocessable_entity
  end
end


  def show
    @place = Place.find(params[:id])
  end

def edit
  @place = Place.find(params[:id])

  if @place.user != current_user
    return render plain: 'Not Allowed', status: :forbidden
  end
end

def update
  @place = Place.find(params[:id])
  if @place.user != current_user
    return render plain: 'Not Allowed', status: :forbidden
  end

  @place.update_attributes(place_params)
  if @place.valid?
    redirect_to root_path
  else
    render :edit, status: :unprocessable_entity
  end
end

  def destroy
    @place = Place.find(params[:id])
    if @place.user != current_user
    return render plain: 'Not Allowed', status: :forbidden
  end
    @place.destroy
    redirect_to root_path
  end

  private

  def place_params
    params.require(:place).permit(:name, :description, :address)
  end

end