// TODO: remove
import {Greeter} from "javascripts/modules/greeter.js";
const greeter = new Greeter();

export function welcome(name) {
    alert(greeter.greet(name));
}
