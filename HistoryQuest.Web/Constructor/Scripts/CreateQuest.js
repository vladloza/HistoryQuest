CreateQuest = function () {

};

CreateQuest.CheckPointsList = [];

CreateQuest.Initialize = function () {
    if (window.CreatedCheckPoints && window.CreatedCheckPoints.length > 0) {
       CreateQuest.AddCheckPoinsTableRows(window.CreatedCheckPoints);
    }
};

CreateQuest.AddCheckPoinsTableRows = function (checkPointsList) {
    var table = document.getElementById("checkpointsTable").getElementsByTagName('tbody')[0];
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
    newCellId.appendChild(document.createTextNode(item.id));
    newCellName.appendChild(document.createTextNode(item.Name));
    newCellTasksCount.appendChild(document.createTextNode(item.TasksCount));
    newCellThresholdScore.appendChild(document.createTextNode(item.ThresholdScore ? item.ThresholdScore : ""));
    newCellButtons.innerHTML = '<a onclick="WebService.OpenCreateCheckPointPage(\'' + item.gid + '\')"><i class="fa fa-edit" aria-hidden="true"></i></a><a onclick="this.parentNode.parentNode.parentNode.removeChild(this.parentNode.parentNode)"><i class="fa fa-times" aria-hidden="true"></i></a>';

    CreateQuest.CheckPointsList.push(item);
};