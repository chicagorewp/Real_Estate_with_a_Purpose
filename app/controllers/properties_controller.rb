class PropertiesController < ApplicationController
    def index
    @properties = Property.all
  end

  def new
    @property = Property.new
  end

  def create
    @property = Property.create(num_bedrooms: params[:num_bedrooms],
                              num_bathrooms: params[:num_bathrooms],
                              list_price: params[:list_price],
                              image: params[:image],
                              overview: params[:overview],
                              details: params[:details],
                              misc_details: params[:misc_details]
                              )
    
    flash[:success] = 'New Property Created'
    redirect_to '/properties/#{@property.id}'
  end

  def show
    @property = Property.find_by(id: params[:id])
  end

  def edit
    @property = Property.find_by(id: params[:id])
  end

  def update
    @property = Property.find_by(id: params[:id])
    @property.update(num_bedrooms: params[:num_bedrooms],
                    num_bathrooms: params[:num_bathrooms],
                    list_price: params[:list_price],
                    image: params[:image],
                    overview: params[:overview],
                    details: params[:details],
                    misc_details: params[:misc_details]
                    )

    flash[:success] = 'Property Updated'
    redirect_to '/propertys/#{@property.id}'
  end

  def destroy
    @property = Property.find_by(id: params[:id])
    @property.destroy

    flash[:warning] = "Destroyed!"
    redirect_to "/"
  end
end
