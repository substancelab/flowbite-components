// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "controllers"
import { application } from "controllers/application"

// Brings dismissed toasts back in the component previews after a while, so
// they can be dismissed again without reloading the page.
const TOAST_REAPPEAR_DELAY = 2000

document.addEventListener("flowbite--toast:hide", (event) => {
  const toast = event.target

  setTimeout(() => {
    const controller = application.getControllerForElementAndIdentifier(toast, "flowbite--toast")
    controller?.enter()
  }, TOAST_REAPPEAR_DELAY)
})
