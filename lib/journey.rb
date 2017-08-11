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
    @all_trips << @current_journey
    @current_journey = {}
    @entry_station = nil
  end
end
