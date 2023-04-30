class CountriesController < ApplicationController

    def index
        binding.pry
        @countries = Country.all
    end

end
