// Installed by flowbite-components 0.4.0.
// Update using bin/rails generate flowbite_components:behavior drawer
import { Controller } from '@hotwired/stimulus'

// Shows, hides, or toggles a Flowbite::Drawer rendered with
// behavior: :stimulus from an element outside the drawer, like the
// data-drawer-show, data-drawer-hide, and data-drawer-toggle attributes of
// flowbite.js.
//
// Use Flowbite::Drawer.trigger_options to render the data attributes:
//
//   <%= render(Flowbite::Button.new(**Flowbite::Drawer.trigger_options("info"))) { "Show drawer" } %>
export default class extends Controller {
  static outlets = ['flowbite--drawer']

  hide () {
    this.flowbiteDrawerOutlets.forEach((drawer) => drawer.hide())
  }

  show () {
    this.flowbiteDrawerOutlets.forEach((drawer) => drawer.show())
  }

  toggle () {
    this.flowbiteDrawerOutlets.forEach((drawer) => drawer.toggle())
  }
}
