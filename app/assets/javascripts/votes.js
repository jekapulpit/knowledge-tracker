document.addEventListener('DOMContentLoaded', function() {
    var VoteRadios = document.getElementsByName('rating');
    var VoteForm = document.getElementById('vote');
    for(i = 0; i < VoteRadios.length; i++) {
        VoteRadios[i].addEventListener('click', function() {
            Rails.fire(VoteForm, 'submit')
        });
    }
    VoteForm.addEventListener('ajax:success', function (event) {
        var AverageMark = event.detail[0]['average_mark'];
        document.getElementById('user_mark')
            .innerHTML = 'Your mark: <b> ' + VoteForm['rating'].value + ' </b>'
        document.getElementById('average_mark')
            .innerHTML = 'Average mark: <b> ' + AverageMark + ' </b>'
    });
});
