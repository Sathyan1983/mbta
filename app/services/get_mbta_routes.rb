class GetMbtaRoutes
  include HTTParty

  attr_reader :data

  private

  def initialize
    @json = HTTParty.get("http://developer.onebusaway.org/mbta-api/api/where/routes-for-agency/1.json?key=TEST")
    @routes = @json['data']['list']
    save_routes
  end

  def save_routes
    @routes.each do |route|
      new_route = Route.new
      new_route.agency_id = route["agencyId"]
      new_route.obid = route["id"]
      new_route.long_name = route["longName"]
      new_route.short_name = route["shortName"]
      new_route.description = route["description"]

      route.save!
    end
  end

end
