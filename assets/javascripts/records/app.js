"use strict";

import $ from 'jquery';
import './releases.js';
import {Slider} from '../components/slider.js';

var lastScrollTop = 0;
var $navContainer = $('.nav-container');

// sticky navigation
$(window).scroll(function () {
    var currentScrollTop = $(this).scrollTop();

    if (currentScrollTop > lastScrollTop) {
        $navContainer.addClass('nav-container-hidden');
    } else {
        $navContainer.removeClass('nav-container-hidden');
    }

    lastScrollTop = currentScrollTop;
});

// TODO: examples
//import defaultMember from "module-name";
//import * as name from "module-name";
//import { member } from "module-name";
//import { member as alias } from "module-name";
//import { member1 , member2 } from "module-name";
//import { member1 , member2 as alias2 , [...] } from "module-name";
//import defaultMember, { member [ , [...] ] } from "module-name";
//import defaultMember, * as name from "module-name";
//import "module-name";

// variables
var sliders = document.querySelectorAll('.slider');

// TODO: events here

// initializations
if (sliders.length > 0) {
    new Slider();
}


// slider.nextSlide();

// export function welcome(name) {
//     alert(greeter.greet(name));
// }

// console.log($('#test'));
// var $ = require('jquery');
// import $ from 'jquery';

//EXAMPLE
//import React from 'react';
//import ReactDOM from 'react-dom';
//import CartItem from './cartItem.jsx!';
//
//const order = {
//    title: 'Fresh fruits package',
//    image: 'http://images.all-free-download.com/images/graphiclarge/citrus_fruit_184416.jpg',
//    initialQty: 3,
//    price: 8
//};
