require 'minitest/autorun'
require 'minitest/reporters'
require_relative '../lib/Stack'

describe "Test Stack Implementation" do
  it "creates a Stack" do
    s = Stack.new
    puts "A stack has been created and currently contains #{s}"
    s.class.must_equal(Stack)
  end

  it "pushes something onto a empty Stack" do
    s = Stack.new
    s.push(10)
    puts "Stack currently contains #{s}"
    s.to_s.must_equal("[10]")
  end

  it "pushes multiple somethings onto a Stack" do
    s = Stack.new
    s.push(10)
    s.push(20)
    s.push(30)
    puts "Stack currently contains #{s}"
    s.to_s.must_equal("[10, 20, 30]")
  end
end
