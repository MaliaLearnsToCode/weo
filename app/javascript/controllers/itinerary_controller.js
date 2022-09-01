import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="itinerary"
export default class extends Controller {
  static targets = ["card"];

  connect() {
    console.log("Itinerary stimulus connected");
    console.log(this.cardTargets);
  }

  showItineraries(event) {
    const targetDate = event.target.dataset["filter"];
    console.log(`${targetDate} clicked`);
    this.itineraryTargets.forEach((itinerary) => {
      itinerary.dataset["date"] === targetDate || targetDate === "all"
        ? itinerary.classList.remove("d-none")
        : itinerary.classList.add("d-none");
    });
    console.log(this.itineraryTargets);
  }
}
