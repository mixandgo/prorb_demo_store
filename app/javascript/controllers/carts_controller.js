import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="carts"
export default class extends Controller {
  connect() {
    console.log("Carts connected")
  }

  select() {
    this.element.requestSubmit();
  }
}
