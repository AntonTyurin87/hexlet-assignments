# frozen_string_literal: true

# BEGIN
require 'uri'
require 'forwardable'

class Url
  
  include Comparable

  def initialize(url)
    @url = URI(url)
  end

  include Comparable
  attr :str
  def <=>(anOther)
     str.size <=> anOther.str.size
  end
  def initialize(str)
     @str = str
  end
  def inspect
    @str
  end

  def query_params
    ary = URI.decode_www_form(@url.query)
    ary.to_h
  end

  def query_param(key, value = nil)
    ary = URI.decode_www_form(@url.query)
    ary.to_h["#{key}"] ? ary.to_h["#{key}"] : value
  end

  extend Forwardable

  def_delegators :@url, :scheme, :host, :port
end

# yandex_url = Url.new 'http://yandex.ru?key=value&key2=value2'

# yandex_url_same = Url.new 'http://yandex.ru?key2=value2&key=value&key3=value3'


# puts (yandex_url == yandex_url_same) # true

# puts yandex_url.inspect

# puts yandex_url.scheme
# puts yandex_url.host
# puts yandex_url.port
# #puts yandex_url.query
# puts yandex_url.query_params # { key: 'value', key2: 'value2' }
# puts yandex_url.query_param(:key) # 'value'
# puts yandex_url.query_param(:key2, 'lala') # 'value2'
# puts yandex_url.query_param(:new, 'ehu') # 'ehu'
# puts yandex_url.query_param(:lalala) # nil
# puts yandex_url.query_param(:lalala, 'default') # 'default'
# #puts yandex_url.query_params
# END

# class SizeMatters
#   include Comparable
#   attr :str
#   def <=>(other)
#     str.size <=> other.str.size
#   end
#   def initialize(str)
#     @str = str
#   end
#   def inspect
#     @str
#   end
# end


# yandex_url.query_params # { key: 'value', key2: 'value2' }

# ary = URI.decode_www_form("a=1&a=2&b=3")
# ary                   #=> [['a', '1'], ['a', '2'], ['b', '3']]
# ary.assoc('a').last   #=> '1'
# ary.assoc('b').last   #=> '3'
# ary.rassoc('a').last  #=> '2'
# Hash[ary]             #=> {"a"=>"2", "b"=>"3"}