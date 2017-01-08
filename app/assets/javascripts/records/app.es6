'use strict';

import {Slider} from '../components/slider.es6';
import {Newsletter} from '../components/newsletter.es6';
import './releases.es6';

// variables
let lastScrollTop = 0;
let navContainer = document.querySelector('.nav-container');
let sliderHero = document.querySelector('.slider-hero');
let sliderReleases = document.querySelector('.slider-releases');
let newsletterForm = document.querySelector('.newsletter-form');

// sticky navigation
window.addEventListener('scroll', function () {
    let currentScrollTop = (this.pageYOffset || document.documentElement.scrollTop) - (document.clientTop || 0);

    if (currentScrollTop > 100 && currentScrollTop > lastScrollTop) {
        navContainer.classList.add('smaller');
    } else if (currentScrollTop < 300 && currentScrollTop < lastScrollTop) {
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