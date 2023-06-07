import { Controller } from "@hotwired/stimulus"


export default class extends Controller {
  static targets = ["futur", "passed", "futurbtn", "passedbtn"]

  connect() {
  }

  futurPassed() {
    this.futurTarget.classList.add("d-none")
    this.futurbtnTarget.removeAttribute('disabled')
    this.passedTarget.classList.remove("d-none")
    this.passedbtnTarget.setAttribute('disabled', '')
  }

  passedFutur() {
    this.futurTarget.classList.remove("d-none")
    this.futurbtnTarget.setAttribute('disabled', '')
    this.passedTarget.classList.add("d-none")
    this.passedbtnTarget.removeAttribute('disabled')
  }

}
