import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr";

export default class extends Controller {

  static targets = ['start']

  connect() {
    flatpickr(this.startTarget, {
      minDate: "today",
      enableTime: true,
      dateFormat: "Y-m-d H:i"
    })

  }
}
