import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr";

export default class extends Controller {

  static targets = ['start', 'hour']

  connect() {
    flatpickr(this.startTarget, {
      minDate: "today"
    })

    flatpickr(this.hourTarget, {
      enableTime: true,
      noCalendar: true,
      dateFormat: "H:i",
      time_24hr: true
    })
  }
}
