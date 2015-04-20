class RoutesController < ApplicationController
  def index
    @routes = Route.all
  end

  def show
    route = Route.find(params[:id])
    @route = Route::AddBusPositions.call(route)
    @hash = Gmaps4rails.build_markers(@route.buses) do |bus, marker|
      marker.lat bus['lat']
      marker.lng bus['lon']
    end
  end
end
