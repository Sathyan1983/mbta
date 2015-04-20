class Route
  class SetBusMarkers
    include HTTParty

    attr_reader :route

    def self.call(route)
      add_markers = new(route)
      add_markers.route
    end

    private

    def initialize(route)
      @route = route
      get_trip_data
      set_markers
      add_markers_to_route
    end

    def get_trip_data
      query = "http://developer.onebusaway.org/mbta-api/api/where/trips-for-route/#{@route.obid}.json?key=TEST&includeStatus=true"
      json = HTTParty.get(query)
      @trips = json['data']['list']
    end

    def set_markers
      @set_markers = @trips.inject([ ]) { |memo, trip_data| memo << trip_data['status']['position'] }
    end

    def add_markers_to_route
      @route.instance_variable_set(:@markers, @set_markers)

      def @route.markers
        @markers
      end
    end

  end
end
