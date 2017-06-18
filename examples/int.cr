require "../callbacks"

struct Int
  include Callbacks

  around :**, exponent : Int do
    puts Time.now
  end
end

puts 10 ** 10
