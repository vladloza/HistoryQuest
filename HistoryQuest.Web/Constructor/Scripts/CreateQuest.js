﻿CreateQuest = function () {

};

CreateQuest.InitializeCheckPointsTable = function () {
    if (window.CreatedCheckPoints && window.CreatedCheckPoints.length >= 0) {
       CreateQuest.AddCheckPoinsTableRows(window.CreatedCheckPoints);
    }
};

CreateQuest.InitializeTasksTable = function () {
    if (window.CreatedTasks && window.CreatedTasks.length >= 0) {
        CreateQuest.AddTasksTableRows(window.CreatedTasks);
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
    var newCellName = newRow.insertCell(0);
    var newCellTasksCount = newRow.insertCell(1);
    var newCellThresholdScore = newRow.insertCell(2);
    var newCellButtons = newRow.insertCell(3);
    newRow.setAttribute("gid", item.gid);
    newCellName.appendChild(document.createTextNode(item.Name));
    newCellTasksCount.appendChild(document.createTextNode(item.TasksCount));
    newCellThresholdScore.appendChild(document.createTextNode(item.ThresholdScore ? item.ThresholdScore : ""));
    newCellButtons.innerHTML = '<a onclick="WebService.SaveQuest(CreateQuest.GetQuest(), false, function () { WebService.OpenCreateCheckPointPage(\'' + item.gid + '\'); });"><i class="fa fa-edit" aria-hidden="true"></i></a><a onclick="CreateQuest.RemoveCheckPoint(\'' + item.gid + '\')"><i class="fa fa-times" aria-hidden="true"></i></a>';
};

CreateQuest.RemoveCheckPoint = function (gid) {
    var checkPointIndex = QuestMap.FindIndex(window.CreatedCheckPoints, function (item) { return item.gid.toUpperCase() === gid.toUpperCase(); });
    if (checkPointIndex !== -1) {
        window.CreatedCheckPoints.splice(checkPointIndex, 1);
    }
    CreateQuest.InitializeCheckPointsTable();
};

CreateQuest.AddTasksTableRows = function (tasksList) {
    var table = document.getElementById("tasksTable").getElementsByTagName('tbody')[0];

    while (table.firstChild) {
        table.removeChild(table.firstChild);
    }

    $.each(tasksList, function (a, item) {
        CreateQuest.AddTasksTableRow(item, table);
    });
};

CreateQuest.AddTasksTableRow = function (item, table) {
    if (!table) {
        table = document.getElementById("tasksTable").getElementsByTagName('tbody')[0];
    }

    var taskType = window.TaskTypes.find(function (taskTypeItem) { return item.TaskTypeGID.toUpperCase() === taskTypeItem.gid.toUpperCase(); });

    var newRow = table.insertRow(table.rows.length);
    var newCellText = newRow.insertCell(0);
    var newCellMaxScore = newRow.insertCell(1);
    var newCellType = newRow.insertCell(2);
    var newCellButtons = newRow.insertCell(3);
    newRow.setAttribute("gid", item.gid);
    newCellText.appendChild(document.createTextNode(item.Text));
    newCellMaxScore.appendChild(document.createTextNode(item.MaxScore));
    newCellType.appendChild(document.createTextNode(taskType.Name));
    //<a onclick="WebService.SaveCheckPoint(CreateQuest.GetCheckPoint(), false, function () { WebService.OpenCreateTaskPage(\'' + item.gid + '\'); });"><i class="fa fa-edit" aria-hidden="true"></i></a>
    newCellButtons.innerHTML = '<a onclick="CreateQuest.RemoveTask(\'' + item.gid + '\')"><i class="fa fa-times" aria-hidden="true"></i></a>';
};

CreateQuest.RemoveTask = function (gid) {
    var taskIndex = QuestMap.FindIndex(window.CreatedTasks, function (item) { return item.gid.toUpperCase() === gid.toUpperCase(); });
    if (taskIndex !== -1) {
        window.CreatedTasks.splice(taskIndex, 1);
    }
    CreateQuest.InitializeTasksTable();
};

CreateQuest.GetQuest = function () {
    var quest = { };
    quest.Name = document.getElementById("QuestName").value; 
    quest.ShortInfo = document.getElementById("ShortInfo").value; 
    quest.FullInfo = document.getElementById("FullInfo").value; 
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
    checkPoint.Tasks = window.CreatedTasks ? window.CreatedTasks : [];
    return checkPoint;
};