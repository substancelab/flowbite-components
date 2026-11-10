import { Controller } from '@hotwired/stimulus'

// Shows and hides a Flowbite::Modal rendered with behavior: :stimulus, the
// same way flowbite.js does.
//
// While shown, the modal is hidden again by pressing Escape or clicking
// outside of it. Set the backdrop value to "static" to only hide the modal
// using its buttons, and the closable value to false to also ignore Escape.
//
// Customize the backdrop using the backdrop class, ie:
//
//   data-flowbite--modal-backdrop-class="bg-gray-900/50 fixed inset-0 z-40"
//
// Show the modal from outside using the flowbite--modal-trigger controller.
//
// Dispatches flowbite--modal:show and flowbite--modal:hide.
export default class extends Controller {
  static classes = ['backdrop']
  static values = {
    backdrop: { type: String, default: 'dynamic' },
    closable: { type: Boolean, default: true }
  }

  connect () {
    this.handleKeydown = this.handleKeydown.bind(this)
    this.handleOutsideClick = this.handleOutsideClick.bind(this)
  }

  disconnect () {
    this.hide()
  }

  hide () {
    if (!this.visible) return

    this.element.classList.add('hidden')
    this.element.classList.remove('flex')
    this.element.setAttribute('aria-hidden', 'true')
    this.element.removeAttribute('aria-modal')
    this.element.removeAttribute('role')
    this.backdropElement.remove()
    this.backdropElement = null
    this.visible = false

    document.body.classList.remove('overflow-hidden')
    if (this.closableValue) this.removeCloseListeners()

    this.dispatch('hide')
  }

  show () {
    if (this.visible) return

    this.element.classList.add('flex')
    this.element.classList.remove('hidden')
    this.element.setAttribute('aria-modal', 'true')
    this.element.setAttribute('role', 'dialog')
    this.element.removeAttribute('aria-hidden')
    this.createBackdrop()
    this.visible = true

    if (this.closableValue) this.addCloseListeners()
    document.body.classList.add('overflow-hidden')

    this.dispatch('show')
  }

  toggle () {
    this.visible ? this.hide() : this.show()
  }

  addCloseListeners () {
    if (this.backdropValue === 'dynamic') {
      this.element.addEventListener('click', this.handleOutsideClick, true)
    }
    document.body.addEventListener('keydown', this.handleKeydown, true)
  }

  createBackdrop () {
    this.backdropElement = document.createElement('div')
    this.backdropElement.classList.add(...this.backdropClassList())
    document.body.append(this.backdropElement)
  }

  backdropClassList () {
    if (this.hasBackdropClass) return this.backdropClasses

    return ['bg-dark-backdrop/70', 'fixed', 'inset-0', 'z-40']
  }

  handleKeydown (event) {
    if (event.key === 'Escape') this.hide()
  }

  handleOutsideClick (event) {
    if (event.target === this.element || event.target === this.backdropElement) {
      this.hide()
    }
  }

  removeCloseListeners () {
    this.element.removeEventListener('click', this.handleOutsideClick, true)
    document.body.removeEventListener('keydown', this.handleKeydown, true)
  }
}
