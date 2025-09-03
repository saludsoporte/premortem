import { Controller } from "@hotwired/stimulus"
import "jquery";
import "jquery_ujs";
import "popper";
import "select2";

// Connects to data-controller="documentos"
export default class extends Controller {
  connect() {
    $("#documento_area_id").select2({
      placeholder: "Seleccionar areas",
      allowClear: true,
      clear: true,
      remove: true,
      cache: true,
    });
    $("#area_id").val(null).trigger("change");
    if($("#errores").is(":checked")) {
      // Si hay errores, mostrar un mensaje      
      //alert("Por favor, complete todos los campos requeridos.");
      console.log($("#datos").val().match(/\'\"\,"+/g));
      cambiarInputs($("#errores").val().match(/\d+/g),$("#datos").val().split(",") );
    }
    $("#AJ").prop('checked',true)
     $("#area_id").val(432);
    $("#AJ").on('change', function() {
      if ($(this).is(':checked')) {   
        $("#area_id").val(432)
      }
    });
    $("#R1").on("change", function () {
      if ($(this).is(":checked")) {
        $("#area_id").val(192);
      }
    });
  }

}
function cambiarInputs(valor,datos){    
  $.each(valor,function(index,value){  
    switch (value) {
      case "1":        
        $("#fr").css("color", " red");
        break;
      case "2":
        $("#fd").css("color", " red");
        break;
      case "3":
        $("#nm").css("color", " red");
      case "4":
        $("#nl").css("color", " red");
        break;
      case "5":
        $("#ar").css("color", " red");  
        break;
      case "6":
        $("#nom").css("color", " red");
        break;
      case "7":
        $("#not").css("color", " red");
        break;
      case "8":
        $("#nn").css("color", " red");
        break
      case "9":
        $("#noc").css("color", " red");
        break;
      case "10":
        $("#fc").css("color", " red");
        break
      case "11":
        $("#ac").css("color", " red");
        break
    }    
  })
}
