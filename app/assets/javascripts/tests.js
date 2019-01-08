// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
document.addEventListener('DOMContentLoaded', function() {
    document.getElementById('finish-test')
        .addEventListener('ajax:success', function (event) {
            var result = event.detail[0]['result'];
            document.getElementsByClassName('tests-container')[0]
                .innerHTML = '<h1>Your result: ' + result + '/10</h1>' +
                '<a href="/profile">back to profile</a>';
        });
});
