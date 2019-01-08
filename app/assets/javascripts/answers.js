document.addEventListener('DOMContentLoaded', function() {
    var forms = document.getElementsByClassName('question-form');
    for (i = 0; i < forms.length; i++) {
        forms[i].addEventListener('ajax:success', function(event) {
            var detail = event.detail;
            var isPassed = detail[0]['success'];
            var button = event.target.getElementsByClassName('submit-btn')[0];

            if (isPassed) {
                button.classList.add('success-btn');
            }
            else {
                button.classList.add('fail-btn');
            }

            event.target.disabled = true;
        });
    }
});
