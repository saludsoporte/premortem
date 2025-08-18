import { Application } from "@hotwired/stimulus"

const application = Application.start()

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

export { application }

export function ajaxTurbo(ruta, parametros) {
  const csrtToken = document.querySelector("meta[name='csrf-token']").content;
  fetch(ruta, {
    method: "POST",
    mode: "cors",
    cache: "no-cache",
    credentials: "same-origin",
    headers: {
      "Content-Type": "application/json",
      "X-CSRF-Token": csrtToken,
    },
    body: JSON.stringify(parametros),
  })
    .then((response) => response.text())
    .then(Turbo.renderStreamMessage);
}