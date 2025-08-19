import { Controller } from "@hotwired/stimulus"
import { ajaxTurbo } from "./application";
// Connects to data-controller="home"
export default class extends Controller {
  connect() {
    //ajaxTurbo("home/cargar_tabla_principal", {pagina:1});
  }
}
