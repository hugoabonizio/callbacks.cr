require "./callbacks/*"

module Callbacks
  macro before(method, *args, &block)
    def {{ method.id }}({{ *args }})
      return if ({{ block.body }}) == false
      previous_def
    end
  end

  macro after(method, *args, &block)
    def {{ method.id }}({{ *args }})
      %result = previous_def
      {{ block.body }}
      %result
    end
  end

  macro around(method, *args, &block)
    def {{ method.id }}({{ *args }})
      {{ block.body }}
      %result = previous_def
      {{ block.body }}
      %result
    end
  end
end
