class RoutesController < ApplicationController
  def index
    @routes = Route.all
  end

  def show
    route = Route.find(params[:id])
    @route = Route::AddBusMap.call(route)
  end
end
