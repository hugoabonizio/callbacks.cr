require "./spec_helper"

class Before
  include Callbacks

  before :without_args do
    @state = 1
  end

  before :with_1_arg, i do
    @state = 2
  end

  before :with_typed_args, i : Int32, s : String do
    @state = 3
  end
end

class After
  include Callbacks

  after :without_args do
    @state = 4
  end

  after :with_1_arg, i do
    @state = 5
  end

  after :with_typed_args, i : Int32, s : String do
    @state = 6
  end
end

class Around
  include Callbacks

  @state = 10

  around :without_args do
    @state += 1
  end

  around :with_1_arg, i do
    @state += 2
  end

  around :with_typed_args, i : Int32, s : String do
    @state += 3
  end
end

describe Callbacks do
  context "#before" do
    it "executes before a method without arguments" do
      obj = Before.new
      obj.without_args
      obj.state.should eq(1)
    end

    it "executes before a method with typeless arguments" do
      obj = Before.new
      obj.with_1_arg(321)
      obj.state.should eq(2)
    end

    it "executes before a method with typed arguments" do
      obj = Before.new
      obj.with_typed_args(666, "666")
      obj.state.should eq(3)
    end
  end

  context "#after" do
    it "executes after a method without arguments" do
      obj = After.new
      obj.without_args
      obj.state.should eq(4)
    end

    it "executes after a method with typeless arguments" do
      obj = After.new
      obj.with_1_arg(321)
      obj.state.should eq(5)
    end

    it "executes after a method with typed arguments" do
      obj = After.new
      obj.with_typed_args(666, "666")
      obj.state.should eq(6)
    end
  end

  context "#after" do
    it "executes around a method without arguments" do
      obj = Around.new
      obj.without_args
      obj.state.should eq(12)
    end

    it "executes around a method with typeless arguments" do
      obj = Around.new
      obj.with_1_arg(321)
      obj.state.should eq(14)
    end

    it "executes around a method with typed arguments" do
      obj = Around.new
      obj.with_typed_args(666, "666")
      obj.state.should eq(16)
    end
  end
end
