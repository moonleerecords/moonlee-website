'use strict';
export class Slider {
    constructor(slider, options = {}) {
        // TODO: change time, change transition effect ??

        this.slider = slider;
        this.slides = this.slider.querySelectorAll('.slide');
        this.previousButton = this.slider.querySelectorAll('.slider-control-previous');
        this.nextButton = this.slider.querySelectorAll('.slider-control-next');
        this.navigationButtons = this.slider.querySelectorAll('.slider-navigation > li');
        this.currentSlide = 0;
        this.speed = options.speed !== undefined ? options.speed : 5000;
        this.autoplay = options.autoplay !== undefined ? options.autoplay : true;

        if (this.slides.length > 1) {
            // change automatically
            if (this.autoplay) {
                this.slideInterval = setInterval(this.nextSlide.bind(this), this.speed);
            }

            // event listeners
            this.previousButton[0].addEventListener('click', (event) => {
                event.preventDefault();

                this.pauseSlideshow();
                this.previousSlide();
            });

            this.nextButton[0].addEventListener('click', (event) => {
                event.preventDefault();

                this.pauseSlideshow();
                this.nextSlide();
            });

            for (var i=0; i<this.navigationButtons.length; i++) {
                this.navigationButtons[i].addEventListener('click', (event) => {
                    event.preventDefault();

                    let navigateTo = event.target.dataset.navigateTo;

                    this.pauseSlideshow();
                    this.goToSlide(navigateTo);
                });
            }
        }
    }

    goToSlide(toSlide) {
        var nextSlide = (toSlide + this.slides.length) % this.slides.length;

        this.changeButtonStatus(this.currentSlide, nextSlide);


        this.slides[this.currentSlide].classList.remove('active');
        this.currentSlide = nextSlide;
        this.slides[this.currentSlide].classList.add('active');

        this.adjustZIndexes();
    }

    previousSlide() {
        this.goToSlide(this.currentSlide - 1);
    }

    nextSlide() {
        this.goToSlide(this.currentSlide + 1);
    }

    changeButtonStatus(currentSlide, nextSlide) {
        if (this.navigationButtons && this.navigationButtons.length > 0) {
            this.navigationButtons[currentSlide].classList.remove('active');
            this.navigationButtons[nextSlide].classList.add('active');
        }
    }

    adjustZIndexes() {
        for (var i = 0; i < this.slides.length; i++) {
            this.slides[(this.currentSlide + i) % this.slides.length].style.zIndex = this.slides.length - i;
        }
    }

    pauseSlideshow() {
        clearInterval(this.slideInterval);
    }
}
