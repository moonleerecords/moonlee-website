// TODO: http://rafbm.github.io/howtomakeaslider/
// TODO: load javascript at the end??? needs time to initialize!!
'use strict';

export class Slider {
    constructor(speed = 5000) {
        this.slides = document.querySelectorAll('.slider > .slide');
        this.currentSlide = 0;
        this.speed = speed;
        this.previousButton = document.querySelectorAll('.slider > .slider-control-previous');
        this.nextButton = document.querySelectorAll('.slider > .slider-control-next');

        this.slideInterval = setInterval(this.nextSlide.bind(this), this.speed);

        this.previousButton[0].addEventListener('click', () => {
            this.pauseSlideshow();
            this.previousSlide();
        });

        this.nextButton[0].addEventListener('click', () => {
            this.pauseSlideshow();
            this.nextSlide();
        });
    }

    goToSlide(toSlide) {
        this.slides[this.currentSlide].className = 'slide';
        this.currentSlide = (toSlide + this.slides.length) % this.slides.length;
        this.slides[this.currentSlide].className = 'slide active';
    }

    previousSlide() {
        this.goToSlide(this.currentSlide - 1);
    }

    nextSlide() {
        this.goToSlide(this.currentSlide + 1);
    }

    pauseSlideshow() {
        clearInterval(this.slideInterval);
    }
}
