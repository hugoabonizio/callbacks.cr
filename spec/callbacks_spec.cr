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

  before :change_state do
    1 == 2 # false
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

  after :returns_value do
    1 + 1
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

    it "don't execute the method if the before callback returns false" do
      obj = Before.new
      obj.change_state
      obj.state.should eq(0)
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

    it "keeps the original returned value" do
      obj = After.new
      obj.returns_value.should eq(666)
    end
  end

  context "#around" do
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

    it "keeps the original returned value" do
      obj = Around.new
      obj.returns_value.should eq(6666)
    end
  end
end
