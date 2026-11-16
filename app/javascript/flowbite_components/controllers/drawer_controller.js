import { Controller } from '@hotwired/stimulus'

// The classes for showing (active) and hiding (inactive) the drawer for each
// placement, as in flowbite.js.
const PLACEMENT_CLASSES = {
  bottom: { active: ['transform-none'], inactive: ['translate-y-full'] },
  left: { active: ['transform-none'], inactive: ['-translate-x-full'] },
  right: { active: ['transform-none'], inactive: ['translate-x-full'] },
  top: { active: ['transform-none'], inactive: ['-translate-y-full'] }
}

// Shows and hides a Flowbite::Drawer rendered with behavior: :stimulus, the
// same way flowbite.js does.
//
// While shown, the drawer is hidden again by pressing Escape or clicking the
// backdrop. While hidden, the drawer is inert, so its contents can't be
// focused off screen. Set the backdrop value to false to show the drawer without a
// backdrop, and the body-scrolling value to true to allow scrolling the page
// while the drawer is shown.
//
// Customize the backdrop using the backdrop class, ie:
//
//   data-flowbite--drawer-backdrop-class="bg-gray-900/50 fixed inset-0 z-30"
//
// Show the drawer from outside using the flowbite--drawer-trigger controller.
// A drawer rendered with Flowbite::Drawer.new(open: true) is shown on connect.
//
// Dispatches flowbite--drawer:show and flowbite--drawer:hide.
export default class extends Controller {
  static classes = ['backdrop']
  static values = {
    backdrop: { type: Boolean, default: true },
    bodyScrolling: { type: Boolean, default: false },
    placement: { type: String, default: 'left' }
  }

  connect () {
    this.handleKeydown = this.handleKeydown.bind(this)
    document.addEventListener('keydown', this.handleKeydown)

    // Hide before Turbo caches the page, so the snapshot doesn't include the
    // backdrop
    this.hide = this.hide.bind(this)
    document.addEventListener('turbo:before-cache', this.hide)

    // A drawer rendered with open: true is already shown
    const { active } = this.placementClasses()
    if (active.every((c) => this.element.classList.contains(c))) {
      this.show()
    } else {
      this.element.setAttribute('aria-hidden', 'true')
      this.element.inert = true
    }
  }

  disconnect () {
    this.hide()
    document.removeEventListener('keydown', this.handleKeydown)
    document.removeEventListener('turbo:before-cache', this.hide)
  }

  hide () {
    if (!this.visible) return

    const { active, inactive } = this.placementClasses()
    this.element.classList.remove(...active)
    this.element.classList.add(...inactive)
    this.element.setAttribute('aria-hidden', 'true')
    this.element.inert = true
    this.element.removeAttribute('aria-modal')
    this.element.removeAttribute('role')

    if (!this.bodyScrollingValue) document.body.classList.remove('overflow-hidden')
    this.destroyBackdrop()
    this.visible = false

    this.dispatch('hide')
  }

  show () {
    if (this.visible) return

    const { active, inactive } = this.placementClasses()
    this.element.classList.add(...active)
    this.element.classList.remove(...inactive)
    this.element.setAttribute('aria-modal', 'true')
    this.element.setAttribute('role', 'dialog')
    this.element.removeAttribute('aria-hidden')
    this.element.inert = false

    if (!this.bodyScrollingValue) document.body.classList.add('overflow-hidden')
    if (this.backdropValue) this.createBackdrop()
    this.visible = true

    this.dispatch('show')
  }

  toggle () {
    this.visible ? this.hide() : this.show()
  }

  backdropClassList () {
    if (this.hasBackdropClass) return this.backdropClasses

    return ['bg-dark-backdrop/70', 'fixed', 'inset-0', 'z-30']
  }

  createBackdrop () {
    this.backdropElement = document.createElement('div')
    this.backdropElement.classList.add(...this.backdropClassList())
    this.backdropElement.addEventListener('click', () => this.hide())
    document.body.append(this.backdropElement)
  }

  destroyBackdrop () {
    if (!this.backdropElement) return

    this.backdropElement.remove()
    this.backdropElement = null
  }

  handleKeydown (event) {
    if (event.key === 'Escape' && this.visible) this.hide()
  }

  placementClasses () {
    return PLACEMENT_CLASSES[this.placementValue] || PLACEMENT_CLASSES.left
  }
}
