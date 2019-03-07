document.addEventListener('turbolinks:load', function() {
    var fileField = document.getElementById('new-avatar');
    var vatarForm = document.getElementById('avatar-form');
    fileField.addEventListener('change', function() {
        Rails.fire(vatarForm, 'submit')
    });

    vatarForm.addEventListener('ajax:success', function (event) {
        var newAvatar = event.detail[0]['avatar'];
        var avatarEl = document.querySelector('.main-avatar')
        avatarEl.setAttribute('src', newAvatar);
    });
});

