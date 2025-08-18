# Pin npm packages by running ./bin/importmap

pin "application"
pin "signin", preload: true
pin "@hotwired/turbo-rails", to: "turbo.min.js"
pin "@hotwired/stimulus", to: "stimulus.min.js"
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js"
pin_all_from "app/javascript/controllers", under: "controllers"
pin "popper",to: 'popper.js',preload: true
pin "bootstrap", to: "bootstrap.min.js", preload: true
pin "jquery", to: "jquery.min.js", preload: true
pin "jquery_ujs", to: "jquery_ujs.js", preload: true
pin "popper", to: "popper.js", preload: true
pin 'select2'
#pin "bootstrap" # @5.3.7
#pin "@popperjs/core", to: "@popperjs--core.js" # @2.11.8
