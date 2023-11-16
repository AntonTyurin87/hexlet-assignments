# frozen_string_literal: true

# BEGIN
module Model
  attr_reader :attributes

  def initialize(params = {})
    @attributes = {}
    self.class.attribute_options.each do |name, options|
      @attributes[name] = set_type(params[name], options[:type])
    end
  end

  def set_type(value, type)
    return value if value.nil?

    return DateTime.parse value if type == :datetime

    value
  end

  module ClassMethods
    attr_reader :attribute_options

    def attribute(name, options = {})
      @attribute_options ||= {}
      @attribute_options[name] = options

      define_method :"#{name}" do
        @attributes[name]
      end

      define_method :"#{name}=" do |value|
        @attributes[name] = set_type(value, options[:type])
      end
    end
  end

  def self.included(base)
    base.extend(ClassMethods)
  end
end
# END
