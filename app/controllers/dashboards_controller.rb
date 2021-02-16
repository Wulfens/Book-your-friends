class DashboardsController < ApplicationController
  def show
    @animals = Animal.where(user_id: current_user)
  end
end
