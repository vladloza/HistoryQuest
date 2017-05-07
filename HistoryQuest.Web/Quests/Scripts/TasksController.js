TasksController = function () { };

TasksController.prototype = { };

TasksController.TestTaskGID = '6D1E2691-3EAB-41A7-90C4-8BD9EC7B1FD8';

TasksController.ReadAnswer = function (taskTypeGID) {
    switch (taskTypeGID.toUpperCase()) {
        case TasksController.TestTaskGID:
            return TasksController.ReadTestTask();
    }
};

TasksController.ReadTestTask = function () {
    var answers = document.getElementsByClassName("question-form");

    for (var i = 0; i < answers.length; i++) {
        if (answers[i].children[0].checked) {
            return answers[i].children[2].innerText;
        }
    }

    return "no user entry";
};