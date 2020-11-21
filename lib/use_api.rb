require 'net/http'
require 'json'

uri = URI.parse("https://randomuser.me/api/")

begin
  res = Net::HTTP.start(uri.host, uri.port, use_ssl: true) do |http|
    http.open_timeout = 5
    http.read_timeout = 10
    http.get(uri.request_uri)
  end

  case res
  when Net::HTTPSuccess
    p JSON.parse(res.body)
  else
    p res.code
    p res.message
  end
rescue => e
  p e.message
end


# 参考
# https://techacademy.jp/magazine/21788
# https://qiita.com/mogulla3/items/a4bff2e569dfa7da1896
# http://sato-s.github.io/2015/10/22/ruby-nethttp.html
