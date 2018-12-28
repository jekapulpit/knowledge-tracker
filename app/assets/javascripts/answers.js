document.addEventListener('ajax:success', function(event) {
    var detail = event.detail;
    var isPassed = detail[0]['success'];
    if (isPassed)
        alert('uraaa');
    else
        alert('oh nooo');
});
