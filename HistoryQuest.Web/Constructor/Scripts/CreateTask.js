CreateTask = function () { };

CreateTask.TaskTypeName;
CreateTask.TaskTypeGID;

CreateTask.Initialize = function () {
    if (window.TaskTypes && window.DropDownTaskType) {
        CreateTask.DropDownChanged();
        window.DropDownTaskType.onchange = CreateTask.DropDownChanged;
        if (window.CreatedTask) {
            CreateTask.InitializeForEdit();
        }
    }
};

CreateTask.InitializeForEdit = function () {
    var parentContainer = document.getElementById(CreateTask.TaskTypeName);
};

CreateTask.InitializeTestTaskForEdit = function (task, parentContainer) {
    var elements = parentContainer.querySelectorAll('input[answer]');
    var rightID = parentContainer.querySelector('input[name=taskId]:checked').value;

    for (var i = 0; i < elements.length; i++) {
        task.Source.answers[i] = elements[i].value;
    }
    task.Source.rightanswer = rightID;

    return task;
};

CreateTask.InitializeDropDown = function (TaskTypes) {
    for (var i = 0; i < TaskTypes.length; i++) {
        var el = document.createElement("option");
        el.value = TaskTypes[i].gid;
        el.textContent = TaskTypes[i].Caption;
        el.setAttribute('name', TaskTypes[i].Name);
        window.DropDownTaskType.appendChild(el);
    }
    CreateTask.DropDownChanged();

    window.DropDownTaskType.onchange = CreateTask.DropDownChanged;
};

CreateTask.DropDownChanged = function () {
    CreateTask.TaskTypeGID = $("#DropDownTaskType").find(":selected")[0].value;
    var taskType = window.TaskTypes.find(function (item) { return CreateTask.TaskTypeGID.toUpperCase() === item.gid.toUpperCase(); });
    CreateTask.TaskTypeName = taskType.Name;

    $.each(window.TaskTypes, function (a, item) {
        document.getElementById(item.Name).style.display = 'none';
    });
    document.getElementById(CreateTask.TaskTypeName).style.display = 'block';

    var center = QuestMap.googleMap.getCenter();
    google.maps.event.trigger(QuestMap.googleMap, 'resize');
    QuestMap.googleMap.setCenter(center);
};

CreateTask.GetTask = function () {
    var task = {};
    var parentContainer = document.getElementById(CreateTask.TaskTypeName);

    task.TaskGID = document.getElementById("TaskContainer").attributes.taskgid.value;
    task.Text = document.getElementById("QuestionText").value;
    task.TaskTypeGID = CreateTask.TaskTypeGID;
    task.MaxScore = document.getElementById("MaxScore").value;
    task.Source = {
        questions: [],
        answers: [],
        rightanswer: ""
    };
    switch (CreateTask.TaskTypeName) {
        case 'Map':
            CreateTask.CreateMapTask(task, parentContainer);
            break;
        case 'Test':
            CreateTask.CreateTestTask(task, parentContainer);
            break;
        case 'Writing':
            CreateTask.CreateWritingTask(task, parentContainer);
            break;
        case 'TestWithImage': break;
        case 'Conformity':
            CreateTask.CreateConformityTask(task, parentContainer);
            break;
    }
    return task;
};

CreateTask.CreateMapTask = function (task, parentContainer) {
    var map = document.getElementById("map");

    if (map && map.attributes.userAnswer) {
        task.Source.rightanswer = map.attributes.userAnswer.value;
    }
    else {
        task.Source.rightanswer = "0;0";
    }
};

CreateTask.CreateTestTask = function (task, parentContainer) {
    var elements = parentContainer.querySelectorAll('input[answer]');
    var rightID = parentContainer.querySelector('input[name=taskId]:checked').value;

    for (var i = 0; i < elements.length; i++) {
        task.Source.answers[i] = WebService.HtmlEncode(elements[i].value);
    }
    task.Source.rightanswer = rightID;

    return task;
};

CreateTask.CreateWritingTask = function (task, parentContainer) {
    task.Source.rightanswer = WebService.HtmlEncode(parentContainer.querySelector('input[rightanswer]').value);
};

CreateTask.CreateConformityTask = function (task, parentContainer) {
    var questions = parentContainer.querySelectorAll('input[question]');
    var answers = parentContainer.querySelectorAll('input[answer]');
    var radio_answers = parentContainer.getElementsByClassName("matching");

    for (var i = 0; i < questions.length; i++) {
        task.Source.questions[i] = WebService.HtmlEncode(questions[i].value);
    }
    for (var i = 0; i < answers.length; i++) {
        task.Source.answers[i] = WebService.HtmlEncode(answers[i].value);
    }
    for (var i = 0; i < radio_answers.length; i++) {
        if (radio_answers[i].children[0].checked) {
            task.Source.rightanswer += radio_answers[i].children[0].name + "-" + radio_answers[i].children[0].value + ";";
        }
    }
};