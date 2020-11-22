require 'net/ping/external'

ip_addr  = ENV["MY_SMART_PHONE_IP_ADDRESS"]
mac_addr = ENV["MY_SMART_PHONE_MAC_ADDRESS"]

if ip_addr.nil? || mac_addr.nil?
  p false
  return
end

ping_external = Net::Ping::External.new(ip_addr)
ping_external.timeout = 1

arp_a = %x( arp -a )
p ping_external.ping? && arp_a.include?(mac_addr)