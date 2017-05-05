WebService = function () { };

WebService.prototype = { };

WebService.GetQuestCheckPoints = function (questGID, onSuccess) {
    $.ajax({
        type: "POST",
        url: "../WebServices/WebService.asmx/GetQuestCheckPoints",
        data: "{ questGID: '" + questGID + "' }",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (r) {
            if (onSuccess) {
                onSuccess(r.d);
            }
        },
        error: function (r) {
            alert(r.responseText);
        },
        failure: function (r) {
            alert(r.responseText);
        }
    });
};

WebService.GetTeacherRequests = function () {
    $.ajax({
        type: "POST",
        url: "../WebServices/WebService.asmx/GetTeacherRequests",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (r) {
            var table = document.getElementById("requestsTable").getElementsByTagName('tbody')[0];
            $.each(r.d, function (a, item) {
                var newRow = table.insertRow(table.rows.length);
                var newCellId = newRow.insertCell(0);
                var newCellLast = newRow.insertCell(1);
                var newCellFirst = newRow.insertCell(2);
                var newCellFather = newRow.insertCell(3);
                var newCellButtons = newRow.insertCell(4);
                newCellId.appendChild(document.createTextNode(item.id));
                newCellLast.appendChild(document.createTextNode(item.LastName));
                newCellFirst.appendChild(document.createTextNode(item.FirstName));
                newCellFather.appendChild(document.createTextNode(item.MiddleName ? item.MiddleName : ""));
                newCellButtons.innerHTML = '<a onclick="AddStudent(this, \'' + item.gid + '\')"><i class="fa fa-check" aria-hidden="true"></i></a><a onclick="DeleteStudent(this, \'' + item.gid + '\')"><i class="fa fa-times" aria-hidden="true"></i></a>';
            });
        },
        error: function (r) {
            alert(r.responseText);
        },
        failure: function (r) {
            alert(r.responseText);
        }
    });
};

WebService.AddStudent = function (gid) {
    $.ajax({
        type: "POST",
        data: "{ studentGID: '" + gid + "' }",
        url: "../WebServices/WebService.asmx/AddStudent",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        error: function (r) {
            alert(r.responseText);
        },
        failure: function (r) {
            alert(r.responseText);
        }
    });
};

WebService.DeleteStudent = function (gid) {
    $.ajax({
        type: "POST",
        data: "{ studentGID: '" + gid + "' }",
        url: "../WebServices/WebService.asmx/DeleteStudent",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        error: function (r) {
            alert(r.responseText);
        },
        failure: function (r) {
            alert(r.responseText);
        }
    });
};

WebService.OpenQuestPage = function (questGID) {
    $.ajax({
        type: "POST",
        data: "{ questGID: '" + questGID + "' }",
        url: "../WebServices/WebService.asmx/OpenQuestPage",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (r) {
            window.location = r.d;
        },
        error: function (r) {
            alert(r.responseText);
        },
        failure: function (r) {
            alert(r.responseText);
        }
    });
};

WebService.StartCheckPoint = function (checkPointGID) {
    $.ajax({
        type: "POST",
        data: "{ checkPointGID: '" + checkPointGID + "' }",
        url: "../WebServices/WebService.asmx/StartCheckPoint",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (r) {
            window.location = r.d;
        },
        error: function (r) {
            alert(r.responseText);
        },
        failure: function (r) {
            alert(r.responseText);
        }
    });
};
