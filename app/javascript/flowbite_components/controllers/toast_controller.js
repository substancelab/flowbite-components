import { Controller } from '@hotwired/stimulus'
import { useTransition } from 'stimulus-use'

// Dismisses a Flowbite::Toast rendered with behavior: :stimulus, the same way
// flowbite.js does: the toast fades out and is then hidden.
//
// Customize the transition using the leave classes, ie:
//
//   data-flowbite--toast-leave-active-class="transition-opacity duration-500"
//
// Dispatches flowbite--toast:hide when the toast starts hiding.
//
// Requires stimulus-use.
export default class extends Controller {
  static classes = ['leaveActive', 'leaveFrom', 'leaveTo']

  connect () {
    useTransition(this, {
      leaveActive: this.classesOrDefault('leaveActive', 'transition-opacity duration-300 ease-out'),
      leaveFrom: this.classesOrDefault('leaveFrom', ''),
      leaveTo: this.classesOrDefault('leaveTo', 'opacity-0'),
      removeToClasses: false,
      // Keeps dismissed toasts hidden when reconnected, ie when restored from
      // the Turbo cache.
      transitioned: !this.element.classList.contains('hidden')
    })
  }

  dismiss () {
    // Ignore toasts that are already hidden or hiding
    if (!this.transitioned) return

    this.dispatch('hide')
    this.leave()
  }

  classesOrDefault (name, defaultClasses) {
    const hasClass = `has${name[0].toUpperCase()}${name.slice(1)}Class`
    return this[hasClass] ? this[`${name}Classes`].join(' ') : defaultClasses
  }
}
