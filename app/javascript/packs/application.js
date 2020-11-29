require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
import 'bootstrap';
import '../stylesheets/application';
import "@fortawesome/fontawesome-free/js/all";
import './cart_items'

document.addEventListener("turbolinks:load", () => {
    $('[data-toggle="tooltip"]').tooltip()
});

$(document).on('turbolinks:load', function () {
    $("#close-sidebar").click(function () {
        $(".page-wrapper").removeClass("toggled");
    })
    $("#show-sidebar").click(function () {
        $(".page-wrapper").addClass("toggled");
    })

    $(".alert").delay(3500).fadeOut();

    $('#customFile').on('change', function () {
        let fileName = $(this).val();
        $(this).next('.custom-file-label').html(fileName);
    })
})
