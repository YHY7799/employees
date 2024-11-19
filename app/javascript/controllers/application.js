import { Application } from "@hotwired/stimulus";

const application = Application.start();

// Configure Stimulus (optional settings)
application.debug = false;
window.Stimulus = application;

export { application };
