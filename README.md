# Callbacks [![Build Status](https://travis-ci.org/hugoabonizio/callbacks.cr.svg?branch=master)](https://travis-ci.org/hugoabonizio/callbacks.cr)

**Callbacks** is a simple shard that lets you write callbacks to be run before, after or around a specific method.

## Installation

Add this to your application's `shard.yml`:

```yaml
dependencies:
  callbacks:
    github: hugoabonizio/callbacks.cr
```

## Usage

The following example shows a basic usage of ```Callbacks``` module.

```crystal
require "callbacks"

class MyModel
  include Callbacks

  before :save do
    log "Saving model..."
    call_a_method
    # ...
  end

  after :find, id : Int do
    proccess_the_result
    # ...
  end
end
```

### Keep the original value

Even after defining a callback to run after or around a method, the original returned value will be maintained.

```crystal
class MyModel
  include Callbacks

  def calculate
    123
  end

  after :calculate do
    # ...
  end
end

MyModel.new.calculate # => 123
```

### Early stops

If the before callback return false, the original method will not be called.

```crystal
class MyModel
  include Callbacks

  def calculate
    123
  end

  before :calculate do
    1 == 2
  end
end

MyModel.new.calculate # => nil
```

## Contributing

1. Fork it ( https://github.com/hugoabonizio/callbacks.cr/fork )
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create a new Pull Request

## Contributors

- [hugoabonizio](https://github.com/hugoabonizio) Hugo Abonizio - creator, maintainer
