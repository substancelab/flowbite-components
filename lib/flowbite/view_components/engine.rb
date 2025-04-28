require "rails/engine"

module Flowbite
  module ViewComponents
    class Engine < ::Rails::Engine
      isolate_namespace Flowbite::ViewComponents

      config.autoload_paths = [
        "#{root}/app/components"
      ]
    end
  end
end
