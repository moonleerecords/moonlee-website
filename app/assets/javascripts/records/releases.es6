'use strict';

if (document.querySelector('.release-show')) {
    if (! window.mobilecheck()) {
        adjustBandcampPlayer();
        window.addEventListener('resize', adjustBandcampPlayer, true);
    }
}

function adjustBandcampPlayer() {
    let coverHeader = document.querySelector('.cover-header');
    let bandcampPlayer = document.querySelector('.bandcamp-player');
    let releaseSide = document.querySelector('.release-side');

    // TODO: on big screens, 1px gets lost
    bandcampPlayer.style.marginTop = `${coverHeader.offsetHeight - bandcampPlayer.offsetWidth}px`;
    releaseSide.style.marginTop = `${bandcampPlayer.offsetHeight - bandcampPlayer.offsetWidth - 10}px`;
    releaseSide.style.visibility = 'visible';
}
