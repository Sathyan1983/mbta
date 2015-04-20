class RoutesController < ApplicationController
  def index
    @routes = Route.all
  end

  def show
    route = Route.find(params[:id])
    @route = Route::SetBusMarkers.call(route)
    binding.pry
  end
end
