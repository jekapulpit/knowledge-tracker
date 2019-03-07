document.addEventListener('turbolinks:load', function() {
    var voteRadios = document.getElementsByName('rating');
    var voteForm = document.getElementById('vote');
    voteRadios.forEach(function (voteRadio) {
        voteRadio.addEventListener('click', function() {
            Rails.fire(voteForm, 'submit')
        });
    });

    voteForm.addEventListener('ajax:success', function (event) {
        var averageMark = event.detail[0]['average_mark'];
        var markId = event.detail[0]['mark_id'];
        document.getElementById('user_mark')
            .innerHTML = 'Your mark: <b> ' + voteForm.rating.value + ' </b> ' +
            '<a id="remove-mark" data-remote="true" rel="nofollow" data-method="delete" href="/vote/'+ markId +'">remove</a>';
        document.getElementById('average_mark')
            .innerHTML = 'Average mark: <b> ' + averageMark + ' </b>';
        removeLink = document.getElementById('remove-mark');
    });
});

