// 요소 가져오기
document.addEventListener('DOMContentLoaded', () => {
    const showPopupButton = document.getElementById('showPopup');
    const popupOverlay = document.getElementById('popupOverlay');
    const closePopupButton = document.getElementById('closePopup');

    // 팝업 열기
    showPopupButton.addEventListener('click', () => {
        popupOverlay.classList.add('active');
    });

    // 팝업 닫기
    closePopupButton.addEventListener('click', () => {
        popupOverlay.classList.remove('active');
    });

    // Overlay를 클릭하면 닫기
    popupOverlay.addEventListener('click', (e) => {
        if (e.target === popupOverlay) {
            popupOverlay.classList.remove('active');
        }
    });
});
