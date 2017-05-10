jQuery(document).ready(function() {
    var str = location.href.toLowerCase();
    $(".nav-menu li a").each(function () {
        if (str.indexOf($(this)[0].href.toLowerCase()) > -1) {
            $("li.active").removeClass("active");
            $(this).parent().addClass("active");
        }
    });
    $("li.active").parents().each(function () {
        if ($(this).is("li")) {
            $(this).addClass("active");
        }
    });
});