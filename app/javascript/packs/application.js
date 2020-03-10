require("@rails/ujs").start()
require("@rails/activestorage").start()
require("channels")

import "bootstrap";

// CSS
import 'mapbox-gl/dist/mapbox-gl.css';
// internal
import Typed from 'typed.js';
import { initMapbox } from '../plugins/init_mapbox';

let check = document.querySelector(".typed")
if (check) {
  var typed = new Typed('.typed', {
    strings: [" GET YOUR PRICE ALERT NOW.", "WHAT ITEM DO YOU WANT TO SEARCH FOR.", " "],
    typeSpeed: 45
  });
}

initMapbox();


