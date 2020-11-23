class SmartPhoneLocation
  require "json"

  %w(HOME COMPANY).each do |place|
    %w(LONGTITUDE LATITUDE).each do |attr_name|
      Module.const_set("MY_#{place}_#{attr_name}", JSON.parse(ENV["MY_#{place}_#{attr_name}"]))
    end

    define_method("in_my_#{place.downcase}?") do
      my_longtitude = Module.const_get("MY_#{place}_LONGTITUDE").map(&:to_f)
      my_latitude   = Module.const_get("MY_#{place}_LATITUDE").map(&:to_f)

      
      @current_longitude >= my_longtitude.first && @current_longitude <= my_longtitude.last  &&\
      @current_latitude  >= my_latitude.first   && @current_latitude  <= my_latitude.last
    end
  end


  def initialize
    set_current_location
  end

  def set_current_location
    location_json = %x( termux-location -p network)
    location_info = JSON.parse(location_json)
    # location_info = {"longitude" => 35, "latitude" => 135}

    longitude_and_latitude = location_info.values_at("longitude", "latitude")
    @current_longitude, @current_latitude = longitude_and_latitude.map { |value|
      value.to_f.floor(4)
    }
  end
end