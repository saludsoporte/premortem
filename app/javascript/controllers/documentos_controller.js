import { Controller } from "@hotwired/stimulus"
import "jquery";
import "jquery_ujs";
import "popper";
import "select2";

// Connects to data-controller="documentos"
export default class extends Controller {
  connect() {
    $("#area_id").select2({
      placeholder: "Seleccionar areas",
      allowClear: true,
      clear: true,
      remove: true,
      cache: true,
    });
    $("#area_id").val(null).trigger("change");
  }

}
