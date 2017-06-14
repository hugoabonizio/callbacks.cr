require "./callbacks/*"

module Callbacks
  macro before(method, *args, &block)
    def {{ method.id }}({{ *args }})
      {{ block.body }}
      previous_def
    end
  end

  macro after(method, *args, &block)
    def {{ method.id }}({{ *args }})
      previous_def
      {{ block.body }}
    end
  end

  macro around(method, *args, &block)
    def {{ method.id }}({{ *args }})
      {{ block.body }}
      previous_def
      {{ block.body }}
    end
  end
end
