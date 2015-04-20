class RoutesController < ApplicationController
  def index
    @routes = Route.all
  end

  def show
    route = Route.find(params[:id])
    @route = Route::GetBusPositions.call(route)
    #@hash = Gmaps4rails.build_markers(@route.markers) do |bus, marker|
    binding.pry
  end
end
