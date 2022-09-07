import { Controller } from "@hotwired/stimulus";
import MapboxGeocoder from "@mapbox/mapbox-gl-geocoder";

// Connects to data-controller="map"

export default class extends Controller {
  static values = {
    apiKey: String,
    markers: Array,
  };

  // var map = new mapboxgl.Map({
  //   container: 'map',
  //   style: 'mapbox://styles/mapbox/streets-v11',
  //   center: [-79.4512, 43.6568],
  //   zoom: 13
  // });

  // var geocoder = new MapboxGeocoder({
  //   accessToken: mapboxgl.accessToken,
  //   mapboxgl: mapboxgl
  // });

  // document.getElementById('geocoder')
  //   .appendChild(geocoder.onAdd(map));

  connect() {
    console.log("Connected to mapbox");

    let countryInput = document.getElementsByName("itinerary[country]")[0];
    let cityInput = document.getElementsByName("itinerary[city]")[0];

    let geocoderInput = document.getElementById("geocoder");

    mapboxgl.accessToken = this.apiKeyValue;

    this.map = new mapboxgl.Map({
      container: "map",
      style: "mapbox://styles/mapbox/streets-v11",
      center: [-24, 42], // starting center in [lng, lat]
      zoom: 1, // starting zoom
      projection: "globe", // display map as a 3D globe
    });

    // var geocoder = new MapboxGeocoder({
    //   accessToken: mapboxgl.accessToken,
    //   mapboxgl: mapboxgl,
    //   language: "en-US",
    //   placeholder: "Enter city and country",
    // }).on("result", ({ result }) => {
    //   console.log("returnStr: " + this.#parseReverseGeo(result));

    //   console.log("result: " + JSON.stringify(result));
    //   console.log("result.place_name: " + result.place_name);
    //   console.log(
    //     "result.s0: " + this.#parseReverseGeo(result).split(",")[0].trim()
    //   );
    //   console.log(
    //     "result.s1: " + this.#parseReverseGeo(result).split(",")[1].trim()
    //   );

    //   countryInput.value = this.#parseReverseGeo(result).split(",")[1].trim();
    //   cityInput.value = this.#parseReverseGeo(result).split(",")[0].trim();
    // });

    var geocoder = new MapboxGeocoder({
      accessToken: mapboxgl.accessToken,
      mapboxgl: mapboxgl,
      language: "en-US",
      placeholder: "Enter city and country",
    }).on("result", ({ result }) => {
      const parsed_str = this.#parseReverseGeo(result);
      const parsed_str_array = this.#parseReverseGeo(result).split(",");
      if (parsed_str_array.length == 1) {
        countryInput.value = parsed_str_array[0].trim();
        cityInput.value = parsed_str_array[0].trim();
      } else if (parsed_str_array.length == 2) {
        countryInput.value = parsed_str_array[1].trim();
        cityInput.value = parsed_str_array[0].trim();
      } else {
        countryInput.value =
          parsed_str_array[parsed_str_array.length - 1].trim();
        cityInput.value = parsed_str_array[0].trim();
      }
    });

    this.location = new mapboxgl.GeolocateControl({
      positionOptions: {
        enableHighAccuracy: true,
      },
      // When active the map will receive updates to the device's location as it changes.
      trackUserLocation: true,
      // Draw an arrow next to the location dot to indicate which direction the device is heading.
      showUserHeading: true,
    });

    // to track location autmatically when opening map page
    if (navigator.geolocation) {
      navigator.geolocation.getCurrentPosition((e) => {
        this.map.jumpTo({ center: [e.coords.longitude, e.coords.latitude] });
      });
    }

    this.#addMarkersToMap();
    this.#fitMapToMarkers();
    this.map.addControl(this.location, "top-left");

    geocoderInput.appendChild(geocoder.onAdd(this.map));
  }

  #addMarkersToMap() {
    this.markersValue.forEach((marker) => {
      new mapboxgl.Marker().setLngLat([marker.lng, marker.lat]).addTo(this.map);
    });
  }

  #fitMapToMarkers() {
    const bounds = new mapboxgl.LngLatBounds();
    this.markersValue.forEach((marker) =>
      bounds.extend([marker.lng, marker.lat])
    );
    this.map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 });
  }

  #parseReverseGeo(geoData) {
    // debugger;
    let place = "";
    let countryName = "";
    let placeName = "";
    let returnStr = "";
    if (geoData.context) {
      $.each(geoData.context, function (i, v) {
        if (v.id.indexOf("place") >= 0) {
          place = v.text;
        }
        if (v.id.indexOf("country") >= 0) {
          countryName = v.text;
        }
      });
    }
    if (place != "" && countryName != "") {
      returnStr = place + ", " + countryName;
    } else {
      returnStr = geoData.place_name;
    }
    return returnStr;
  }
}
