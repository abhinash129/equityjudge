//'use strict'
//var App = angular.module('myApp', [ 'nvd3' ]);
//'path'
//var path="http://localhost:8080/Nivesh_Development";
////var path = "http://www.equityjudge.com";
//var path = "http://192.168.0.148:8080/Nivesh_Development";



'use strict';

var App = angular.module('myApp', ['nvd3']);

// Check if we're running on localhost or an external device (based on IP address)
var path;
var hostname = window.location.hostname;

// If hostname is localhost, use localhost, otherwise use the IP (you can add multiple conditions here)
if (hostname === 'localhost' || hostname === '127.0.0.1') {
    path = "http://localhost:8080/Nivesh_Development";  // Localhost path for your laptop
} else if (hostname === '192.168.0.148') {
    path = "http://192.168.0.148:8080/Nivesh_Development";  // IP path for your laptop (same network)
} else {
    path = "http://192.168.0.148:8080/Nivesh_Development";  // Default path for other devices
}

console.log('API path is:', path);  // You can remove this after testing
