document.addEventListener('DOMContentLoaded', function() {
    forms = document.getElementsByClassName('question-form');
    for (i = 0; i < forms.length; i++) {
        forms[i].addEventListener('ajax:success', function(event) {
            var detail = event.detail;
            var isPassed = detail[0]['success'];
            if (isPassed)
                alert('uraaa');
            else
                alert('oh nooo');
        });
    }
});
