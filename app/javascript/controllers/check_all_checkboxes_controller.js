import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["checkbox"];

  connect() {
    console.log("Check all checkboxes")
  }

  checkAll(event) {
    console.log(event.currentTarget);

    this.checkboxTargets.forEach((element) => {
      if (event.currentTarget.checked === true) {
        element.checked = true;
      } else {
        element.checked = false;
      }
    });
  }

}
