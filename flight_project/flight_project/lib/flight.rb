class Flight
    def initialize(flight_number, capacity)
        @flight_number = flight_number
        @capacity = capacity
        @passengers = []
    end

    def passengers
        @passengers
    end

    def full?
        if @passengers.length == @capacity 
            true
        else
            false
        end
    end

    def board_passenger(passenger_instance)
        if !self.full? && passenger_instance.has_flight?(@flight_number)
            @passengers << passenger_instance
        end
    end

    def list_passengers
        names = []
        @passengers.each do |passenger|
            names << passenger.name
        end
        names
    end

    def [](idx)
        @passengers[idx]
    end

    def <<(passenger_instance)
        self.board_passenger(passenger_instance)
    end
end