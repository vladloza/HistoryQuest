CreateQuest = function () {

};

CreateQuest.CheckPointsList = [];

CreateQuest.Initialize = function () {
    if (window.CreatedCheckPoints && window.CreatedCheckPoints.length >= 0) {
       CreateQuest.AddCheckPoinsTableRows(window.CreatedCheckPoints);
    }
};

CreateQuest.AddCheckPoinsTableRows = function (checkPointsList) {
    var table = document.getElementById("checkpointsTable").getElementsByTagName('tbody')[0];

    while (table.firstChild) {
        table.removeChild(table.firstChild);
    }

    $.each(checkPointsList, function (a, item) {
        CreateQuest.AddCheckPoinsTableRow(item, table);
    });
};

CreateQuest.AddCheckPoinsTableRow = function (item, table) {
    if (!table) {
        table = document.getElementById("checkpointsTable").getElementsByTagName('tbody')[0];
    }

    var newRow = table.insertRow(table.rows.length);
    var newCellId = newRow.insertCell(0);
    var newCellName = newRow.insertCell(1);
    var newCellTasksCount = newRow.insertCell(2);
    var newCellThresholdScore = newRow.insertCell(3);
    var newCellButtons = newRow.insertCell(4);
    newRow.setAttribute("gid", item.gid);
    newCellId.appendChild(document.createTextNode(item.id));
    newCellName.appendChild(document.createTextNode(item.Name));
    newCellTasksCount.appendChild(document.createTextNode(item.TasksCount));
    newCellThresholdScore.appendChild(document.createTextNode(item.ThresholdScore ? item.ThresholdScore : ""));
    newCellButtons.innerHTML = '<a onclick="WebService.SaveQuest(CreateQuest.GetQuest(), false, function () { WebService.OpenCreateCheckPointPage(\'' + item.gid + '\'); });"><i class="fa fa-edit" aria-hidden="true"></i></a><a onclick="CreateQuest.RemoveCheckPoint(\'' + item.gid + '\')"><i class="fa fa-times" aria-hidden="true"></i></a>';

    CreateQuest.CheckPointsList.push(item);
};

CreateQuest.RemoveCheckPoint = function (gid) {
    var checkPointIndex = window.CreatedCheckPoints.findIndex(function (item) { return item.gid.toUpperCase() === gid.toUpperCase(); });
    if (checkPointIndex !== -1) {
        window.CreatedCheckPoints.splice(checkPointIndex, 1);
    }
    CreateQuest.Initialize();
};

CreateQuest.GetQuest = function () {
    var quest = { };
    quest.Name = document.getElementById("QuestName").value; 
    quest.ShortInfo = document.getElementById("ShortInfo").value; 
    quest.CheckPoints = window.CreatedCheckPoints ? window.CreatedCheckPoints : [];
    return quest;
};

CreateQuest.GetCheckPoint = function () {
    var checkPoint = { };
    checkPoint.gid = document.getElementById("CheckPointDiv").attributes.checkpointgid.value;
    checkPoint.Name = document.getElementById("CheckPointName").value;
    checkPoint.Info = document.getElementById("Info").value;
    checkPoint.TasksCount = document.getElementById("TasksCount").value;
    checkPoint.ThresholdScore = document.getElementById("ThresholdScore").value;
    checkPoint.ParentGID = document.getElementById("DropDownParent").value;
    checkPoint.GeoCoordinates = document.getElementById("map").attributes.userAnswer.value;
    return checkPoint;
};
    
//Debug only
CreateQuest.CreateTask = function () {
    var xmlString = "<TestTask></TestTask>";
    var parser = new DOMParser();
    var xmlDoc = parser.parseFromString(xmlString, "text/xml");
    var root = xmlDoc.getElementsByTagName("TestTask")[0];
    var node = xmlDoc.createElement("answers");
    root.appendChild(node);

    var serializer = new XMLSerializer();
    xmlString = serializer.serializeToString(xmlDoc);
    return xmlString;
};