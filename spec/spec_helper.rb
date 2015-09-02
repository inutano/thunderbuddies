$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'thunderbuddies'
require 'net/http'

def url_exist?(url_string)
  url = URI.parse(url_string)
  req = Net::HTTP.new(utl.host, url.port)
  req.use_ssl = (url.scheme == 'https')
  path = url.path if url.path.present?
  res = req.request_head(path || '/')
  if res.kind_of?(Net::HTTPRedirection)
    url_exist?(res['location'])
  else
    res.code[0] != "4"
  end
rescue Errno::ENOENT
  false
end
