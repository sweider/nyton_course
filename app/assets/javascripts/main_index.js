function checkInput(input) {
    var input_int = parseInt(input.val());
    if (isNaN(input_int)) {
        return false;
    }
    else {
        if ((input_int + '').length != input.val().length) {
            return false;
        }
    }
    return true;
}
/**
 * Created by alex on 21.12.14.
 */


$(document).ready(function(){
    $('.input').on('input',function(){
        var a_input = $('#a_input');
        var b_input = $('#b_input');
        var a_valid = checkInput(a_input);
        var b_valid = checkInput(b_input);
        var disable_btn = !(a_valid && b_valid) || (parseInt(a_input.val()) >= parseInt(b_input.val()));
        $('#submit_btn').attr('disabled', disable_btn);
    });
});