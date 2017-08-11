class Journey
  attr_accessor :entry_station, :exit_station, :current_journey

  def initialize(entry_station = nil, exit_station = nil)
    @entry_station = entry_station
    @exit_station = exit_station
    @current_journey = {}
  end

  def store_entry(entry)
    @entry_station = entry
    @current_journey[entry] = 'not touched out yet'
  end

  def in_journey?
    !@entry_station.nil?
  end

  def store_exit(exit_station)
    @current_journey[@entry_station] = exit_station
  end

  def fare
    if @current_journey.size > 1
      return PENALTY_FARE
    else
      return MINIMUM_FARE
    end
  end
end
