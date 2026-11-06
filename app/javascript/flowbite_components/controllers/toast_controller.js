import { Controller } from "@hotwired/stimulus"

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
export default class extends Controller {
  static values = { delay: Number }

  connect() {
    if (this.delayValue > 0) {
      this.timeout = setTimeout(() => this.dismiss(), this.delayValue)
    }
  }

  disconnect() {
    clearTimeout(this.timeout)
  }

  dismiss() {
    clearTimeout(this.timeout)
    this.dispatch("dismiss")

    if (window.matchMedia("(prefers-reduced-motion: reduce)").matches) {
      this.element.remove()
      return
    }

    this.element
      .animate([{ opacity: 1 }, { opacity: 0 }], { duration: 300, easing: "ease-out" })
      .finished.then(() => this.element.remove())
  }
}
