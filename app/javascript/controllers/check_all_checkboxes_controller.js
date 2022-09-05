import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["checkbox"];
  static activityIds = [];

  connect() {
    console.log("Check all checkboxes")
  }

  checkAll(event) {
    console.log("in checkAll", event.currentTarget);

    this.checkboxTargets.forEach((element) => {
      if (event.currentTarget.checked === true) {
        element.checked = true;
      } else {
        element.checked = false;
      }
      this.activityIds.push(element.value);
      // console.log(element.value);\
      console.log(this.activityIds);

    });

  }
  submit() {
    console.log(this.activityIds);
    fetch("/participations", {
      method: "POST",
      headers: { "Accept": "application/json" },
      body: { "ids": this.activityIds }
    }).then(response => response.json())
    .then((data) => {
      console.log(data);
    })
    // console.log("after checkAll", this.checkboxTargets)
  }

}
