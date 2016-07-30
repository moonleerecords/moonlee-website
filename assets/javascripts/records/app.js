import "./releases";
import "../base/slider";
import {Slider} from "../base/slider";

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
var headerNavOpener = document.querySelector('.header-nav-opener');
var headerNav = document.querySelector('.header-nav');
var sliders = document.querySelectorAll('.slider');

// events
headerNavOpener.addEventListener('click', (event) => {
    event.preventDefault();
    event.stopPropagation();

    headerNav.classList.toggle('active');
});

document.addEventListener('click', () => {
    headerNav.classList.remove('active');
});

// other initializations
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
