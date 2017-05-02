function showControl(who, sender) {
    if (sender)
    {
        for (var i = 0; i < sender.length; i++) {
            document.getElementById(sender[i]).style.display = 'none';
        }   
    }
    if (who) document.getElementById(who).style.display = 'block';

    //var href = document.getElementById('href-back');
    //if (href) {
    //    href.setAttribute('href', 'Registration.aspx');
    //}
};