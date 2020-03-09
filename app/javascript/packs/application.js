require("@rails/ujs").start()
require("@rails/activestorage").start()
require("channels")

import "bootstrap";

import Typed from 'typed.js';

var typed = new Typed('.typed', {
  strings: [" GET YOUR PRICE ALERT NOW.", "WHAT ITEM DO YOU WANT TO SEARCH FOR.", " "],
  typeSpeed: 45
});
