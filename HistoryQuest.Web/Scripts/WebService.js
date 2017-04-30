WebService = { };

WebService.prototype = function () { };

WebService.GetQuestCheckPoints = function (questGID, onSuccess) {
    $.ajax({
        type: "POST",
        url: "../WebServices/WebService.asmx/GetQuestCheckPoints",
        data: "{ questGID: '" + questGID + "' }",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (r) {
            QuestMap.OnLoadSuccess(JSON.parse(r.d));
        },
        error: function (r) {
            alert(r.responseText);
        },
        failure: function (r) {
            alert(r.responseText);
        }
    });
};