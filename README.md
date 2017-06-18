# Callbacks

**Callbacks** is a simple shard that lets you write callbacks to be run before, after or around a specific method.

## Installation

Add this to your application's `shard.yml`:

```yaml
dependencies:
  callbacks:
    github: hugoabonizio/callbacks.cr
```

## Usage

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

## Contributing

1. Fork it ( https://github.com/hugoabonizio/callbacks.cr/fork )
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create a new Pull Request

## Contributors

- [hugoabonizio](https://github.com/hugoabonizio) Hugo Abonizio - creator, maintainer
