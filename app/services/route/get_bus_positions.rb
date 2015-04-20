class Route
  class GetBusPositions
    include HTTParty

    attr_reader :route

    def self.call(route)
      add_buses = new(route)
      add_buses.route
    end

    private

    def initialize(route)
      @route = route
      get_trip_data
      get_bus_positions
      add_buses_to_route
    end

    def get_trip_data
      query = "http://developer.onebusaway.org/mbta-api/api/where/trips-for-route/#{@route.obid}.json?key=TEST&includeStatus=true"
      json = HTTParty.get(query)
      @trips = json['data']['list']
    end

    def get_bus_positions
      @bus_positions = @trips.inject([ ]) { |memo, trip_data| memo << trip_data['status']['position'] }
    end

    def add_buses_to_route
      @route.instance_variable_set(:@buses, @bus_positions)

      def @route.buses
        @buses
      end
    end

  end
end
