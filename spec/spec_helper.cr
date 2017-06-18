require "spec"
require "../src/callbacks"

class Before
  property state = 0

  def without_args
    123
  end

  def with_1_arg(i)
    "#{i}"
  end

  def with_typed_args(i : Int32, s : String)
    "#{i} #{s}"
  end

  def change_state
    @state = 111
  end
end

class After
  property state = 0

  def without_args
    123
  end

  def with_1_arg(i)
    "#{i}"
  end

  def with_typed_args(i : Int32, s : String)
    "#{i} #{s}"
  end
end

class Around
  property state = 0

  def without_args
    123
  end

  def with_1_arg(i)
    "#{i}"
  end

  def with_typed_args(i : Int32, s : String)
    "#{i} #{s}"
  end
end
