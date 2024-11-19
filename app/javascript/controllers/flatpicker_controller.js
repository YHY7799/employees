import { Controller } from "@hotwired/stimulus";
import flatpickr from "flatpickr";

export default class extends Controller {
  connect() {
    console.log("Flatpickr initialized!"); // Debug message
    flatpickr(this.element, {
      enableTime: true,
      dateFormat: "Y-m-d H:i",
      time_24hr: true,
    });
  }
}
