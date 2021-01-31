require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")


// Toastr
global.toastr = require("toastr")

// Jquery
import $ from 'jquery';
global.$ = jQuery;

// Bootstrap
import "bootstrap"


// stylesheets
require("stylesheets/application.scss")