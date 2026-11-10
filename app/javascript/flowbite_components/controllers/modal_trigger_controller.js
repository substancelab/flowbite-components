import { Controller } from '@hotwired/stimulus'

// Shows, hides, or toggles a Flowbite::Modal rendered with
// behavior: :stimulus from an element outside the modal, like the
// data-modal-show, data-modal-hide, and data-modal-toggle attributes of
// flowbite.js.
//
// Use Flowbite::Modal.trigger_options to render the data attributes:
//
//   <%= render(Flowbite::Button.new(**Flowbite::Modal.trigger_options("terms"))) { "Show terms" } %>
export default class extends Controller {
  static outlets = ['flowbite--modal']

  hide () {
    this.flowbiteModalOutlets.forEach((modal) => modal.hide())
  }

  show () {
    this.flowbiteModalOutlets.forEach((modal) => modal.show())
  }

  toggle () {
    this.flowbiteModalOutlets.forEach((modal) => modal.toggle())
  }
}
