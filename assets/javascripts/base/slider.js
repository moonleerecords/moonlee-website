'use strict';
export class Slider {
    constructor(speed = 5000) {
        this.slider = document.querySelector('.slider');
        this.slides = this.slider.querySelectorAll('.slide');
        this.previousButton = this.slider.querySelectorAll('.slider-control-previous');
        this.nextButton = this.slider.querySelectorAll('.slider-control-next');
        this.navigationButtons = this.slider.querySelectorAll('.slider-navigation > li');
        this.currentSlide = 0;
        this.speed = speed;

        this.slideInterval = setInterval(this.nextSlide.bind(this), this.speed);

        // event listeners
        this.previousButton[0].addEventListener('click', () => {
            this.pauseSlideshow();
            this.previousSlide();
        });

        this.nextButton[0].addEventListener('click', () => {
            this.pauseSlideshow();
            this.nextSlide();
        });

        for (var i=0; i<this.navigationButtons.length; i++) {
            this.navigationButtons[i].addEventListener('click', (event) => {
                let navigateTo = event.target.dataset.navigateTo;

                this.pauseSlideshow();
                this.goToSlide(navigateTo);
            });
        }
    }

    goToSlide(toSlide) {
        this.slides[this.currentSlide].className = 'slide';
        this.navigationButtons[this.currentSlide].className = '';
        this.currentSlide = (toSlide + this.slides.length) % this.slides.length;
        this.slides[this.currentSlide].className = 'slide active';
        this.navigationButtons[this.currentSlide].className = 'active';
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
