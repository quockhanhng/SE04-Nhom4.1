$(document).on('turbolinks:load', function () {
    function addEventChangeForInput(input) {
        input.addEventListener("change", function () {
            let url = this.parentElement.parentElement.lastElementChild.href
            let quantity = this.value <= 0 ? 1 : this.value
            $.ajax({
                type: "PUT",
                url: url,
                data: {quantity: quantity},
                success: function () {
                }
            })
        })
    }
    var inputs = $('.quantity').children()
    for (let i = 0; i < inputs.length; i++) {
        addEventChangeForInput(inputs[i])
    }
})
