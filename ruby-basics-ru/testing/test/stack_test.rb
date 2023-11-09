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

  def test_size_returns_ziro
    stack = Stack.new
    assert(stack.size.zero?)
  end

  def test_adding_elements
    stack = Stack.new
    stack.push! 'ruby'
    stack.push! 'php'
    stack.push! 'java'
    assert(stack.to_a == %w[ruby php java])
    assert(stack.size == 3)
    assert(stack.empty? == false)
  end

  def test_deletting_elements
    stack = Stack.new
    stack.push! 'ruby'
    stack.push! 'php'
    stack.push! 'java'
    stack.pop!
    assert(stack.to_a == %w[ruby php])
    assert(stack.size == 2)
  end

  def test_clearing_stack
    stack = Stack.new
    stack.push! 'ruby'
    stack.push! 'php'
    stack.push! 'java'
    stack.clear!
    assert(stack.to_a == [])
    assert(stack.empty? == true)
  end
  # END
end

test_methods = StackTest.new({}).methods.select { |method| method.start_with? 'test_' }
raise 'StackTest has not tests!' if test_methods.empty?
