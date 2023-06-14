import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="like"
export default class extends Controller {
  static values = {
    path: String
  }

  connect() {
    console.log(this.pathValue)
  }

  boldUp(event) {
    event.preventDefault();
    console.log('hi from boldup')
    fetch(this.pathValue, {
      method: "POST",
      headers: {
        "X-CSRF-Token": document.querySelector("meta[name=csrf-token]").content,
        "Content-Type": "application/json",
        "Accept": "application/json"
      },
      body: JSON.stringify({action_type: "up"})
    })
    .then(response => response.json())
    .then(data => {
      console.log(data.html);
      this.element.outerHTML = data.html;
    })
/*     event.srcElement.classList.toggle("bold");
    event.srcElement.nextElementSibling.classList.toggle("thumbs-marker"); */
  }

  boldDown(event) {
    event.preventDefault();
    console.log('hi from boldup')
    fetch(this.pathValue, {
      method: "POST",
      headers: {
        "X-CSRF-Token": document.querySelector("meta[name=csrf-token]").content,
        "Content-Type": "application/json",
        "Accept": "application/json"
      },
      body: JSON.stringify({action_type: "down"})
    })
    .then(response => response.json())
    .then(data => {
      console.log(data.html);
      this.element.outerHTML = data.html;
    })
/*     event.srcElement.classList.toggle("bold");
    event.srcElement.previousElementSibling.classList.toggle("thumbs-marker"); */
  }
}
