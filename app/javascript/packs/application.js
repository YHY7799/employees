import { Turbo } from "@hotwired/turbo-rails";
import "flatpickr/dist/flatpickr.min.css";

Turbo.start();

import { Application } from "@hotwired/stimulus";
const application = Application.start();

// Import all Stimulus controllers
const context = require.context("../controllers", true, /\.js$/);
application.load(definitionsFromContext(context));
