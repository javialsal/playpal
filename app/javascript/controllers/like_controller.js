import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="like"
export default class extends Controller {

  bold(event) {
    event.srcElement.classList.toggle("bold");
  }
}
