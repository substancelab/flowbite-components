require "rails/engine"

module Flowbite
  module Components
    class Engine < ::Rails::Engine
      isolate_namespace Flowbite::Components

      config.autoload_paths = [
        "#{root}/app/components"
      ]
    end
  end
end
