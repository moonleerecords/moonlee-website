"use strict";

// import './releases.js';
import {Slider} from '../components/slider.js';
import {Newsletter} from '../components/newsletter.js';

// TODO: debugging jspm / system.js...fuck, shit, aaaaaaaa

// variables
let lastScrollTop = 0;
let navContainer = document.querySelector('.nav-container');
let sliderHero = document.querySelector('.slider-hero');
let sliderReleases = document.querySelector('.slider-releases');
let newsletterForm = document.querySelector('.newsletter-form');

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

// sticky navigation
window.addEventListener('scroll', function () {
    let currentScrollTop = (this.pageYOffset || document.documentElement.scrollTop) - (document.clientTop || 0);

    if (currentScrollTop > 100 && currentScrollTop > lastScrollTop) {
        navContainer.classList.add('smaller');
    } else if (currentScrollTop < 100 && currentScrollTop < lastScrollTop) {
        navContainer.classList.remove('smaller');
    }

    lastScrollTop = currentScrollTop;
});

// initialize components
if (sliderHero) {
    new Slider(sliderHero);
}

if (sliderReleases) {
    new Slider(sliderReleases, {autoplay: false});
}

if (newsletterForm) {
    new Newsletter(newsletterForm);
}
