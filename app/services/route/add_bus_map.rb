class Route
  class AddBusMap
    attr_reader :route

    def self.call(route)
      with_map = new(route)
      with_map.route
    end

    private

    def initialize(route)
      @route = Route::AddBusPositions.call(route)
      generate_map
      add_bus_map
    end

    def generate_map
      @map =  Gmaps4rails.build_markers(@route.buses) do |bus, marker|
                marker.lat bus['lat']
                marker.lng bus['lon']
              end
    end

    def add_bus_map
      @route.instance_variable_set(:@bus_map, @map)

      def @route.bus_map
        @bus_map
      end
    end

  end
end
