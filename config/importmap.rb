# Pin npm packages by running ./bin/importmap

pin "application"
pin "flatpickr" # @4.6.13
pin "@hotwired/stimulus", to: "stimulus.min.js"
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js"
pin_all_from "app/javascript/controllers", under: "controllers"
pin "@hotwired/turbo-rails", to: "turbo.min.js", preload: true
pin "bootstrap" # @5.3.3
pin "@popperjs/core", to: "@popperjs--core.js" # @2.11.8
pin "jquery-ui" # @1.14.1
pin "jquery" # @3.7.1
