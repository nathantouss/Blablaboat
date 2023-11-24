import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="toggle"
export default class extends Controller {
  static targets = ["togglableElement"];

  connect() {
    console.log(this.togglableElementTarget);
    document.addEventListener("turbo:render", ()=> {
      if (document.querySelector(".alert-warning")){
        this.togglableElementTarget.classList.toggle("d-none")
      }
      });
  }
  fire() {
    this.togglableElementTarget.classList.toggle("d-none");
  }
}
