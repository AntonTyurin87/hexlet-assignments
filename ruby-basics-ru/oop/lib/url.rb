# frozen_string_literal: true

# BEGIN
require 'uri'
require 'forwardable'

class Url
  include Comparable
  extend Forwardable

  attr_reader :url

  def_delegators :@url, :scheme, :host, :port, :query

  def initialize(params)
    @url = URI(params)
    #@ary = URI.decode_www_form(@url.query)
    @ary = (@url.query || '').split('&').each_with_object({}) do |item, acc|
      acc[item.split('=')[0].to_sym] = item.split('=')[1]
    end
    @url
  end

  def query_params
    h = {}
    @ary.each do |key, value|
      h[key.to_sym] = value
    end
    h
  end

  def query_param(key, value = nil)
    query_params[key] ? query_params[key] : value
  end

  def == (other)
    n = (other.query || '').split('&').each_with_object({}) do |item, acc|
      acc[item.split('=')[0].to_sym] = item.split('=')[1] end
    @ary == n  #URI.decode_www_form(other.query).sort 
  end
end
# END

# yandex_url = Url.new 'http://yandex.ru?key=value&key2=value2'

# yandex_url_same = Url.new 'http://yandex.ru?key2=value2&key=value'

# puts (yandex_url == yandex_url_same) # true

# puts yandex_url.scheme
# puts yandex_url.host
# puts yandex_url.port
# puts yandex_url.query_params # { key: 'value', key2: 'value2' }
# puts yandex_url.query_param(:key) # 'value'
# puts yandex_url.query_param(:key2, 'lala') # 'value2'
# puts yandex_url.query_param(:new, 'ehu') # 'ehu'
# puts yandex_url.query_param(:lalala) # nil
# puts yandex_url.query_param(:lalala, 'default') # 'default'
