module Yard
  class CodeObject < SimpleDelegator
    def docstring_introduction
      docstring.split("\n\n").first
    end

    def docstring_without_introduction
      remainders = docstring.split("\n\n")[1..]
      return nil unless remainders

      remainders.join("\n\n")
    end
  end
end
