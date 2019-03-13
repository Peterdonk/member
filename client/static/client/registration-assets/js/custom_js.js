$(document).ready(function() {
    $("#org").hide();
    $('input[type=radio][name=rad_status]').change(function() {
        if (this.value == 'organization') {
            $('#org').toggle(500);
        } else if (this.value == 'individual') {
            $('#org').toggle(500);
        }
    });
})