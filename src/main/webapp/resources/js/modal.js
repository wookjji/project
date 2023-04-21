
window.onload = function(){

const modal = document.querySelector('.modal');
const btnOpenPopup = document.querySelector('.btn-open-popup');
const closeBtn = document.querySelector('.close_modal');
btnOpenPopup.addEventListener('click',() => {modal.style.display ='block';});
closeBtn.addEventListener('click',() => {modal.style.display ='none';});
modal.addEventListener("click", e => {const evTarget = e.target
    if(evTarget.classList.contains("modal")) {
        modal.style.display = "none"
    }
});
}