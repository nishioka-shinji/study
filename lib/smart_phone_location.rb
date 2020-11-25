class SmartPhoneLocation
  require "json"
  require "./config/initializers/constants"

  CONST::PLACE.each_key do |k|
    define_method("in_my_#{k.downcase}?") do
      latitude, latitude_tolerance, longtitude, longtitude_tolerance =\
        CONST::PLACE[k].values

      @current_latitude  >= latitude   - latitude_tolerance   &&\
      @current_latitude  <= latitude   + latitude_tolerance   &&\
      @current_longitude >= longtitude - longtitude_tolerance &&\
      @current_longitude <= longtitude + longtitude_tolerance
    end
  end

  def initialize
    set_current_location
  end

  def set_current_location
    # location_json = %x( termux-location -p network)
    # location_info = JSON.parse(location_json)
    location_info = {"longitude" => 135.000000, "latitude" => 35.000000}

    longitude_and_latitude = location_info.values_at("longitude", "latitude")
    @current_longitude, @current_latitude = longitude_and_latitude.map { |value|
      value.to_f.floor(6)
    }
  end
end