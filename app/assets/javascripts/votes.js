document.addEventListener('DOMContentLoaded', function() {
    vote_radios = document.getElementsByName('rating');
    vote_form = document.getElementById('vote');
    for(i = 0; i < vote_radios.length; i++) {
        vote_radios[i].addEventListener('click', function() {
            vote_form.submit();
        });
    }
});
