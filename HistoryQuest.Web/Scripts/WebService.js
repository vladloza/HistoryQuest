WebService = function () { };

WebService.prototype =
    {
        
    };

var startFrom = 0;

WebService.GetComments = function (guid, countToTake) {
    var start = countToTake ? 0 : startFrom;
    countToTake = countToTake || 5;

    $.ajax({
        type: 'POST',
        url: '../WebServices/WebService.asmx/GetComments',
        data: "{ startFrom:'" + start + "', questGuid:'" + guid + "', countToTake:'" + countToTake + "' }",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (data) {
            if (data.d.length > 0) {
                $.each(data.d, function (a, item) {
                    var sec = parseInt(item.Date.replace(/[^0-9]/g, ''));
                    var date = new Date(sec);
                    if(data.d.length == 1){
                        var commentEl = document.getElementById('comments');

                        var news = document.createElement('div');
                        news.className = 'small-card card';
                        news.innerHTML = "<h4>" + item.FullName + "</h4>" +
                                            "<p>" + item.Text + "</p>" +
                                            "<div class='time'>" + date.toLocaleString() + "</div>";

                        commentEl.insertBefore(news, commentEl.firstChild);
                    }
                    else {
                        var comments = $("#comments");
                        var news = "<div class='small-card card'>" +
                                    "<h4>" + item.FullName + "</h4>" +
                                    "<p>" + item.Text + "</p>" +
                                    "<div class='time'>" + date.toLocaleString() + "</div>" +
                                    "</div>";
                        comments.append(news);
                    }
                        
                });
                startFrom += countToTake;
            }
        }
    });
};

WebService.AddComment = function (questGuid, text) {
    var inProgress = false;
    $.ajax({
        type: 'POST',
        url: '../WebServices/WebService.asmx/AddComment',
        data: "{ questGuid:'" + questGuid + "', text:'" + text + "' }",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function () {
            WebService.GetComments(questGuid, 1);
        }
    });
};
WebService.GetCheckPointLikesCount = function (checkPointGID) {
    $.ajax({
        type: "POST",
        url: "../WebServices/WebService.asmx/GetCheckPointLikesCount",
        data: "{ checkPointGID: '" + checkPointGID + "' }",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (data) {
            WebService.BindLikesToControl(data.d.count, data.d.liked);
        },
        error: function (r) {
            alert(r.responseText);
        },
        failure: function (r) {
            alert(r.responseText);
        }
    });
};
WebService.BindLikesToControl = function (count, liked) {
    $("#likes-count")[0].innerText = count;
    if (!liked) {
        document.getElementById('i-like').classList.remove('liked');
    }
    else {
        document.getElementById('i-like').classList.add('liked');
    }
};
WebService.UpdateCheckPointLikesCount = function (checkPointGID) {
    $.ajax({
        type: "POST",
        url: "../WebServices/WebService.asmx/UpdateCheckPointLikesCount",
        data: "{ checkPointGID: '" + checkPointGID + "' }",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function () {
            WebService.GetCheckPointLikesCount(checkPointGID);
        }
    });
};

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

WebService.OnNextButtonPressed = function (userAnswer, elapsedTime) {
    $.ajax({
        type: "POST",
        url: "../WebServices/WebService.asmx/OnNextButtonPressed",
        data: "{ userAnswer: '" + userAnswer + "', elapsedTime: '" + elapsedTime + "' }",
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