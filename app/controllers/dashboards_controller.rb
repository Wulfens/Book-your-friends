class DashboardsController < ApplicationController
  def show
    @animals = current_user.animals
  end
end
