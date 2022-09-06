import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="insert-in-list"
export default class extends Controller {
  static targets = ["items","form", "accordion"]

  connect() {
    console.log(this.element)
    console.log(this.itemsTarget)
    console.log(this.formTarget)
  }


  send(event) {
    event.preventDefault()
    console.log("send event triggered")
    fetch(this.formTarget.action, {
      method: "POST",
      headers: { "Accept": "application/json" },
      body: new FormData(this.formTarget)
    })
    .then(response => response.json())
    .then((data) => {
      console.log(data)
      if (data.inserted_item) {
        this.accordionTarget.insertAdjacentHTML("beforebegin", data.inserted_item)
      }
      this.formTarget.outerHTML = data.form
    })

    // location.reload()
  }
}
