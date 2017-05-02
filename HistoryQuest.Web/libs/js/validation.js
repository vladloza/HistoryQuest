var pass;
function formValidation(containers) {
    var conts = [];
    var valid = true;
    var errorBox = document.getElementById('error_box');

    for (var i = 0; i < containers.length; i++) {
        conts.push(document.getElementById(containers[i]));
    }
    for (var i = 0; i < conts.length; i++) {
        if (conts[i].style.display != 'none') {
            valid = validateControls(conts[i], valid);
        }
    }
    if (!valid && errorBox) {
        errorBox.innerHTML = 'Заповніть обязкові поля!';
        errorBox.style.color = "red";
    }
    return valid;
};
function validateControls(container, valid) {
    var elements = container.querySelectorAll('input[validation]');

    for (var i = 0; i < elements.length; i++) {
        if (!validate(elements[i])) {
            valid = false;
            elements[i].style.border = '1px solid red';
        }
        else {
            elements[i].style.border = '';
        }
    }
    return valid;
}
function validate(el) {
    var value = el.value;
    var attribute = el.getAttribute('validation');

    switch (attribute) {
        case 'email':
            return validateEmail(value);
            break;
        case 'password':
            if (value != '') {
                pass = value;
                return true;
            }
            return false;
            break;
        case 'password-commit':
            if (pass && value == pass) {
                return true;
            }
            return false;
            break;
        case 'text':
        default:
            return value != '';
            break;
    }

}
function validateEmail(email) {
    var re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
    return re.test(email);
};