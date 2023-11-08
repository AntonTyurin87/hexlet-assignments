# frozen_string_literal: true

require_relative 'test_helper'
require_relative '../lib/stack'

class StackTest < Minitest::Test
  # BEGIN
  def setup; end

  def teardown; end

  def test_to_a_returns_true
    stack = Stack.new
    assert(stack.to_a == [])
  end

  def test_empty_returns_true
    stack = Stack.new
    assert(stack.empty? == true)
  end

  def test_size_returns_zirro
    stack = Stack.new
    assert(stack.size == 0)
  end

  def test_adding_elements
    stack = Stack.new
    stack.push! 'ruby'
    stack.push! 'php'
    stack.push! 'java'
    assert(stack.to_a == ['ruby', 'php', 'java'])
    assert(stack.size == 3)
    assert(stack.empty? == false)
  end
  # END
end

test_methods = StackTest.new({}).methods.select { |method| method.start_with? 'test_' }
raise 'StackTest has not tests!' if test_methods.empty?
