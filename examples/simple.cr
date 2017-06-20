require "../callbacks"

class Example
  include Callbacks

  def value
    123
  end

  after :value do
    puts "hello"
  end
end

puts Example.new.value
