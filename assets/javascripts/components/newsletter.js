'use strict';

import $ from 'jquery';

export class Newsletter {
    constructor(newsletter) {
        this.newsletter = newsletter;
        this.newsletterDivs = this.newsletter.querySelectorAll('div');
        this.emailInput = this.newsletter.querySelector('input[name=email]');
        this.countryInput = this.newsletter.querySelector('input[name=country]');
        this.successMessage = this.newsletter.querySelector('.success-message');
        this.emailError = this.newsletter.querySelector('.error-message-email');
        this.countryError = this.newsletter.querySelector('.error-message-country');

        this.newsletter.addEventListener('submit', (event) => {
            event.preventDefault();

            this.resetErrorMessages();

            if (this.valid()) {
                var newsletterFormData = $(this.newsletter).serialize();
                var token = $('meta[name="csrf-token"]').attr('content');

                $.ajax({
                    url: this.newsletter.action,
                    context: this,
                    type: 'post',
                    data: newsletterFormData,
                    dataType: 'json'
                }).then(
                    this.showSuccessMessage,
                    this.showErrorMessage
                );
            }
        });
    }

    valid() {
        var isValid = true;

        if (!this.validEmail()) {
            this.emailError.innerHTML = this.emailError.dataset.message;
            if (!this.emailInput.value) {
                this.emailError.innerHTML = this.emailError.dataset.messageEmpty;
            }
            this.emailError.classList.add('active');
            isValid = false;
        }

        if (!this.validCountry()) {
            this.countryError.innerHTML = this.countryInput.dataset.message;
            if (!this.countryInput.value) {
                this.countryError.innerHTML = this.countryError.dataset.messageEmpty;
            }
            this.countryError.classList.add('active');
            isValid = false;
        }

        return isValid;
    }

    validEmail() {
        var re = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
        return re.test(this.emailInput.value);
    }

    validCountry() {
        return this.countryInput.value.length > 3;
    }

    showSuccessMessage() {
        for (var i=0; i<this.newsletterDivs.length; i++) {
            this.newsletterDivs[i].classList.add('hidden');
        }
        this.successMessage.classList.remove('hidden');
        this.successMessage.classList.add('active');
    }

    showErrorMessage(response) {
        // show error message in the same div as the one for e-mail
        this.emailError.innerHTML = this.emailError.dataset.messageGeneral;
        if (response.responseJSON.message == 'Member Exists') {
            this.emailError.innerHTML = this.emailError.dataset.messageExists;
        }
        this.emailError.classList.add('active');
    }

    resetErrorMessages() {
        this.successMessage.classList.remove('active');
        this.emailError.classList.remove('active');
        this.countryError.classList.remove('active');
    }
}
