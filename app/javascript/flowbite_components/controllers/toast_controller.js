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
    const leaveTo = this.classesOrDefault('leaveTo', 'opacity-0')

    useTransition(this, {
      leaveActive: this.classesOrDefault('leaveActive', 'transition-opacity duration-300 ease-out'),
      leaveFrom: this.classesOrDefault('leaveFrom', ''),
      leaveTo,
      removeToClasses: false,
      // Keeps dismissed toasts hidden when reconnected, ie when restored from
      // the Turbo cache.
      transitioned: !this.isDismissed(leaveTo)
    })
  }

  dismiss () {
    // Ignore toasts that are already hidden or hiding
    if (!this.transitioned) return

    this.dispatch('hide')
    this.leave()
  }

  // Toasts that were hiding when disconnected, ie captured mid-fade in a Turbo
  // cache snapshot, have the leave-to classes but aren't hidden yet.
  isDismissed (leaveTo) {
    const classList = this.element.classList
    const leaveToClasses = leaveTo.split(' ').filter(Boolean)

    return classList.contains('hidden') ||
      (leaveToClasses.length > 0 && leaveToClasses.every((name) => classList.contains(name)))
  }

  // Returns a blank string rather than an empty one when there are no classes,
  // as useTransition otherwise falls back to data attributes like data-leave.
  classesOrDefault (name, defaultClasses) {
    const hasClass = `has${name[0].toUpperCase()}${name.slice(1)}Class`
    const classes = this[hasClass] ? this[`${name}Classes`].join(' ') : defaultClasses
    return classes || ' '
  }
}
