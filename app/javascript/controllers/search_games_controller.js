import { Controller } from "@hotwired/stimulus"
import MapboxGeocoder from "@mapbox/mapbox-gl-geocoder"

// Connects to data-controller="search-games"
export default class extends Controller {
  static values = { apiKey: String }
  static targets = ["form", "input", "list", "locationWrapper"]

  connect() {
    console.log(this.formTarget)
    console.log(this.inputTarget)
    console.log(this.listTarget)

    this.geocoder = new MapboxGeocoder({
      accessToken: this.apiKeyValue,
      types: "country,region,place,postcode,locality,neighborhood,address",
      placeholder: "Address",
      countries: "FR",
      limit: 3
    })
    this.geocoder.addTo(this.locationWrapperTarget)
    this.geocoder.on("result", event => this.#updateGames(event))
    this.geocoder.on("clear", () => this.#clearInputValue())
  }

  disconnect() {
    this.geocoder.onRemove()
  }

  #updateGames(event) {
    this.#setInputValue(event)

    const url = `${this.formTarget.action}?query=${this.inputTarget.value}`

    fetch(url, {headers: {"Accept": "text/plain"}})
      .then(response => response.text())
      .then((data) => {
        console.log(data);
        this.listTarget.innerHTML = data
      })
  }

  #setInputValue(event) {
    this.inputTarget.value = event.result["place_name"]
  }

  #clearInputValue() {
    this.inputTarget.value = ""
  }
}
