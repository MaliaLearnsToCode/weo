import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="insert-in-list"
export default class extends Controller {
  static targets = ["items"];

  connect() {
    console.log(this.element);
    console.log(this.itemsTarget);
    console.log(this.formTarget);
  }

  send(event) {
    event.preventDefault();
    console.log("send event triggered");
    fetch(this.formTarget.action, {
      method: "GET",
      headers: { Accept: "application/json" },
      body: new FormData(this.formTarget),
    }).then((response) => response.json());
  }
}
