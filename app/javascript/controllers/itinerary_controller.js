import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="itinerary"
export default class extends Controller {
  static targets = ["card"];

  connect() {
    console.log("Itinerary stimulus connected");
    console.log(this.cardTargets);

    this.swiper = new Swiper(".mySwiper", {
      effect: "coverflow",
      grabCursor: true,
      centeredSlides: true,
      slidesPerView: "auto",
      coverflowEffect: {
        rotate: 50,
        stretch: 0,
        depth: 100,
        modifier: 1,
        slideShadows: true,
      },
      pagination: {
        el: ".swiper-pagination",
      },
    });
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
