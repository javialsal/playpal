import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="display-filters"
export default class extends Controller {
  static targets = ["submit", "form"]

  connect() {
  }

  displayForm(event) {
    event.preventDefault()
    this.formTarget.classList.remove("d-none")
  }
}
