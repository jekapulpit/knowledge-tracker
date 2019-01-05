// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require turbolinks
//= require_tree .

function toggle_user_menu() {
    user_menu = document.getElementsByClassName('user-menu')[0];
    if (user_menu.getAttribute('class').indexOf('user-menu-active') != -1){
        user_menu.setAttribute('class', 'user-menu');
    }
    else {
        user_menu.setAttribute('class', 'user-menu user-menu-active');
    }
}