$(function () {
    $("[id$=teachersBox]").autocomplete({
        source: function (request, response) {
            $.ajax({
                url: '/WebServices/WebService.asmx/GetTeachersByPrefix',
                dataType: "json",
                data: "{ 'prefix': '" + request.term + "'}",
                type: "POST",
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    response($.map(data.d, function (item) {
                        return {
                            label: item.LastName + ' ' + item.FirstName[0] + '.' + item.MiddleName[0] + '. (' + item.id + ')',
                            val: item.gid
                        }
                    }))
                },
                error: function (response) {
                    alert(response.responseText);
                },
                failure: function (response) {
                    alert(response.responseText);
                }
            });
        },
        select: function (e, i) {
            $("[id$=selectedTeacher]").val(i.item.val);
        },
        minLength: 1
    });
});