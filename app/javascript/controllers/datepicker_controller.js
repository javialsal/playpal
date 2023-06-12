import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr";

export default class extends Controller {

  connect() {
    flatpickr(this.element, {
      minDate: "today",
      enableTime: true,
      dateFormat: "Y-m-d H:i",
      defaultDate: Date.now(),
      time_24hr: true,
      disableMobile: "true"
    })
  }
}
