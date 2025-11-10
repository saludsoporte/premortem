import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="datos-personal"
export default class extends Controller {
  connect() {
   
    $("#datos_personal_usuario").on("keyup", function () {
      console.log("entro en usuario")
      if ($(this).val() == "") {
        $("#datos_personal_password").prop("disabled", true);
      } else {
        $("#datos_personal_password").prop("disabled", false);
      }
    });
    $("#datos_personal_password").on("keyup", function () {
      console.log("entro en usuario");
      if ($(this).val() == "") {
        $("#datos_personales").prop("disabled", true);
      } else {
        $("#datos_personales").prop("disabled", false);
        habilitar();
      }
    });
    $("#datos_personales").on("keyup", function () {
      habilitar()
    });
    $("#datos_personales").on("change", function () {
      console.log("entro en change");
      habilitar();
    });
    $("#sbm").prop("disabled", true);
  }
}

function habilitar(){
  var bandera = true;  
  if ($("#datos_personal_nombre").val() == "") {
    bandera = false;
  }
  if ($("#datos_personal_apellido_paterno").val() == "") {
    bandera = false;
  }
  if ($("#datos_personal_apellido_materno").val() == "") {
    bandera = false;
  }
  if ($("#datos_personal_unidad").val() == "") {
    bandera = false;
  }
  if ($("#datos_personal_puesto").val() == "") {
    bandera = false;
  }
  if ($("#datos_personal_curp").val() == "") {
    bandera = false;
  }
  if ($("#datos_personal_correo").val() == "") {
    bandera = false;
  }
  console.log("bandera "+bandera)
  if (bandera) {    
    $("#sbm").prop("disabled", false);
  }    
  else{
    $("#sbm").prop("disabled", true);
  }    
}

