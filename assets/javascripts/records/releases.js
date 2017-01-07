"use strict";

if (document.querySelector('.release-show')) {
    adjustBandcampPlayer();
}

function adjustBandcampPlayer() {
    let coverHeader = document.querySelector('.cover-header');
    let bandcampPlayer = document.querySelector('.bandcamp-player');
    let releaseSide = document.querySelector('.release-side');

    bandcampPlayer.style.marginTop = `${coverHeader.offsetHeight - bandcampPlayer.offsetWidth}px`;
    releaseSide.style.marginTop = `${bandcampPlayer.offsetHeight - bandcampPlayer.offsetWidth - 10}px`;
    releaseSide.style.visibility = 'visible';
}
