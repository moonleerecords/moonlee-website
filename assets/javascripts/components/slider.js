'use strict';
export class Slider {
    constructor(slider, options = {}) {
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
        this.slides[this.currentSlide].classList.remove('active');
        this.navigationButtons[this.currentSlide].classList.remove('active');
        this.currentSlide = (toSlide + this.slides.length) % this.slides.length;
        this.slides[this.currentSlide].classList.add('active');
        this.navigationButtons[this.currentSlide].classList.add('active');
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
