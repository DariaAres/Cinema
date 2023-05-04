class CountriesController < ApplicationController
    before_action :authorize_country

    def index
        @countries = Country.all.offset(params[:offset]).limit(params[:limit])
        render json: @countries
    end

    def show 
        render json: country
    end

    def create 
        @country = Country.create!(country_params)
        render json: @country, status: :created
    end

    def update 
        country.update!(country_params)
        render json: @country, status: :ok
    end

    def destroy 
        country.destroy
        render json: {}, status: :no_content
    end

    def country_params
        params.require(:country).permit(:name)
    end

    def country 
        @country ||= Country.find(params[:id])
    end

    def authorize_country 
        authorize(Country) 
    end

end
