'use strict';

if (document.querySelector('.posts-list')) {
    adjustFirstArticle();
    window.addEventListener('resize', adjustFirstArticle, true);
}

function adjustFirstArticle() {
    let pageWidth = document.body.clientWidth;
    let firstArticle = document.querySelector('.post-item.painted');
    let indentation = (pageWidth - firstArticle.offsetWidth) / 2;

    firstArticle.style.paddingLeft = `${indentation}px`;
    firstArticle.style.paddingRight = `${indentation}px`;
    firstArticle.style.margin = `0 -${indentation}px`;
}
