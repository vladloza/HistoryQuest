function showControl(who, sender) {
    document.getElementById(sender).style.display = 'none';
    document.getElementById(who).style.display = 'block';

    var href = document.getElementById('href-back');
    if (href) {
        href.setAttribute('href', 'Registration.aspx');
    }
};