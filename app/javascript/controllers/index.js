import { Application } from "@hotwired/stimulus";
const application = Application.start();

import FlatpickrController from "./flatpicker_controller";
application.register("flatpicker", FlatpickrController);
