"use strict";

import './releases.js';
import {Slider} from '../components/slider.js';

// variables
var lastScrollTop = 0;
var navContainer = document.querySelector('.nav-container');
var sliderHero = document.querySelector('.slider-hero');
var sliderReleases = document.querySelector('.slider-releases');

//import defaultMember from "module-name";
//import * as name from "module-name";
//import { member } from "module-name";
//import { member as alias } from "module-name";
//import { member1 , member2 } from "module-name";
//import { member1 , member2 as alias2 , [...] } from "module-name";
//import defaultMember, { member [ , [...] ] } from "module-name";
//import defaultMember, * as name from "module-name";
//import "module-name";

// sticky navigation
window.addEventListener('scroll', function() {
    var currentScrollTop = (this.pageYOffset || document.documentElement.scrollTop)  - (document.clientTop || 0);

    if (currentScrollTop > lastScrollTop) {
        navContainer.classList.add('nav-container-hidden');
    } else {
        navContainer.classList.remove('nav-container-hidden');
    }

    lastScrollTop = currentScrollTop;
});

// initialize sliders
new Slider(sliderHero);
new Slider(sliderReleases, { autoplay: false });

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
