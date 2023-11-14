# frozen_string_literal: true
require 'uri'

# BEGIN
class Url
  include Comparable
  extend Forwardable

  attr_reader :url, :query_params

  def_delegator :@url, :scheme, :scheme
  def_delegator :@url, :host, :host
  def_delegator :@url, :to_s, :to_s

  def initialize(params)
    @url = URI(params)

    @query_params = (url.query || '').split('&').each_with_object({}) do |item, acc|
      acc[item.split('=')[0].to_sym] = item.split('=')[1]
    end
  end

  def query_param(key, default = nil)
    query_params.fetch(key, default)
  end

  def ==(other)
    to_s == other.to_s
  end
end
# END


# yandex_url = Url.new 'http://yandex.ru?key=value&key2=value2'

# yandex_url_same = Url.new 'http://yandex.ru?key2=value2&key=value&key3=value3'


# puts (yandex_url == yandex_url_same) # true

# puts yandex_url.inspect

# puts yandex_url.scheme
# puts yandex_url.host
# puts yandex_url.port
# puts yandex_url.query_params # { key: 'value', key2: 'value2' }
# puts yandex_url.query_param(:key) # 'value'
# puts yandex_url.query_param(:key2, 'lala') # 'value2'
# puts yandex_url.query_param(:new, 'ehu') # 'ehu'
# puts yandex_url.query_param(:lalala) # nil
# puts yandex_url.query_param(:lalala, 'default') # 'default'
# #puts yandex_url.query_params