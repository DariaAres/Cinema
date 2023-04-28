class UsersController < ApplicationController
  def index
    authorize_request
  end

  def show
  end
end
