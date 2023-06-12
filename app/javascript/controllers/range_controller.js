import { Controller } from "@hotwired/stimulus"
// Connects to data-controller="range"
export default class extends Controller {
  static targets = ['rangeElement', 'input']
  connect() {
    this.#displayValue()
  }
  range(event) {
    this.#displayValue()
  }
  #displayValue(){
    if (this.inputTarget.value >= 60) {
      this.rangeElementTarget.innerText = `${Math.floor(this.inputTarget.value / 60)}h${this.inputTarget.value % 60}`;
      if (this.inputTarget.value % 60 === 0) {
        this.rangeElementTarget.innerText = `${Math.floor(this.inputTarget.value / 60)}h`;
      }
    } else {
      this.rangeElementTarget.innerText = `${this.inputTarget.value % 60}min`;
    }
  }
}
