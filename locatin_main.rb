require "./lib/smart_phone_location"

current_location = "home"
smp = SmartPhoneLocation.new
begin
  loop do
    current_time     = Time.now.strftime('%H:%M')
    current_time_int = current_time.gsub(/:/, "").to_i
    if smp.in_my_home?
      current_location = "home"
    elsif smp.in_my_company?
      current_location = "company"
    else
      if current_location == "company" && current_time_int.between?(1730, 2359)
        p "帰ります"
      end
      current_location = "other"
    end

    p current_location
    p current_time
    p current_time_int
    sleep(5)
  end
rescue Interrupt
  p "Forced stop"
rescue
  p "Unexpected error"
  raise
end