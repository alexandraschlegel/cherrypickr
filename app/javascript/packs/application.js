require("@rails/ujs").start()
require("@rails/activestorage").start()
require("channels")

import "bootstrap";


import Typed from 'typed.js';

let check = document.querySelector(".typed")
if (check) {
  var typed = new Typed('.typed', {
    strings: [" GET YOUR PRICE ALERT NOW.", "WHAT ITEM DO YOU WANT TO SEARCH FOR.", " "],
    typeSpeed: 45
  });
}

import { initMapbox } from '../plugins/init_mapbox';

console.log(initMapbox)

initMapbox();

