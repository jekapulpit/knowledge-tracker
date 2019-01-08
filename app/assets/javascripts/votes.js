document.addEventListener('DOMContentLoaded', function() {
    var voteRadios = document.getElementsByName('rating');
    var voteForm = document.getElementById('vote');
    voteRadios.forEach(function (voteRadio) {
        voteRadio.addEventListener('click', function() {
            Rails.fire(voteForm, 'submit')
        });
    });
    voteForm.addEventListener('ajax:success', function (event) {
        var averageMark = event.detail[0]['average_mark'];
        document.getElementById('user_mark')
            .innerHTML = 'Your mark: <b> ' + voteForm.rating.value + ' </b>'
        document.getElementById('average_mark')
            .innerHTML = 'Average mark: <b> ' + averageMark + ' </b>'
    });
});
