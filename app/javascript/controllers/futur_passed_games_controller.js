import { Controller } from "@hotwired/stimulus"


export default class extends Controller {
  static targets = ["futur", "passed"]

  connect() {
  }

  futurPassed() {
    this.futurTarget.classList.add("d-none")
    this.passedTarget.classList.remove("d-none")
  }

  passedFutur() {
    this.futurTarget.classList.remove("d-none")
    this.passedTarget.classList.add("d-none")
  }

}
