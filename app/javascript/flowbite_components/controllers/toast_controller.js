import { Controller } from "@hotwired/stimulus"
import { useTransition } from "stimulus-use"

// Dismisses a Flowbite::Toast rendered with behavior: :stimulus.
//
// The toast fades out before being removed. Set a delay in milliseconds to
// dismiss the toast automatically:
//
//   <%= render(Flowbite::Toast.new(
//     behavior: :stimulus,
//     data: {"flowbite--toast-delay-value": 5000},
//     message: "Saved!"
//   )) %>
//
// Requires stimulus-use.
export default class extends Controller {
  static values = { delay: Number }

  connect() {
    useTransition(this, {
      hiddenClass: false,
      leaveActive: "transition-opacity duration-300 ease-out motion-reduce:duration-0",
      leaveFrom: "opacity-100",
      leaveTo: "opacity-0",
      removeToClasses: false,
      transitioned: true
    })

    if (this.delayValue > 0) {
      this.timeout = setTimeout(() => this.dismiss(), this.delayValue)
    }
  }

  disconnect() {
    clearTimeout(this.timeout)
  }

  async dismiss() {
    clearTimeout(this.timeout)
    this.dispatch("dismiss")

    await this.leave()
    this.element.remove()
  }
}
