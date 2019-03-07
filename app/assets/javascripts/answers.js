document.addEventListener('turbolinks:load', function() {
    var forms = document.querySelectorAll('.question-form');
    forms.forEach(function (form) {
        form.addEventListener('ajax:success', function(event) {
            var detail = event.detail;
            var isPassed = detail[0]['success'];
            var button = event.target.querySelector('.submit-btn');

            if (isPassed) {
                button.classList.add('success-btn');
            }
            else {
                button.classList.add('fail-btn');
            }

            event.target.disabled = true;
        });
    });
});
