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

# END
