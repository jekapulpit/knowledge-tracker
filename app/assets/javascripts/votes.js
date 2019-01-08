document.addEventListener('DOMContentLoaded', function() {
    var vote_radios = document.getElementsByName('rating');
    var vote_form = document.getElementById('vote');
    for(i = 0; i < vote_radios.length; i++) {
        vote_radios[i].addEventListener('click', function() {
            Rails.fire(vote_form, 'submit')
        });
    }
    vote_form.addEventListener('ajax:success', function (event) {
        var average_mark = event.detail[0]['average_mark'];
        document.getElementById('user_mark')
            .innerHTML = 'Your mark: <b> ' + vote_form['rating'].value + ' </b>'
        document.getElementById('average_mark')
            .innerHTML = 'Average mark: <b> ' + average_mark + ' </b>'
    });
});
