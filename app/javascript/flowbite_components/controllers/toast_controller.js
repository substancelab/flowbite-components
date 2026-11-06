import { Controller } from "@hotwired/stimulus"
import { useTransition } from "stimulus-use"

// Dismisses a Flowbite::Toast rendered with behavior: :stimulus, the same way
// flowbite.js does: the toast fades out and is then hidden.
//
// Dispatches flowbite--toast:hide when the toast starts hiding.
//
// Requires stimulus-use.
export default class extends Controller {
  connect() {
    useTransition(this, {
      leaveActive: "transition-opacity duration-300 ease-out",
      leaveTo: "opacity-0",
      removeToClasses: false,
      transitioned: true
    })
  }

  dismiss() {
    this.dispatch("hide")
    this.leave()
  }
}
