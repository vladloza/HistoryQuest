TasksController = function () { };

TasksController.prototype = { };

TasksController.TestTaskGID = '6D1E2691-3EAB-41A7-90C4-8BD9EC7B1FD8';
TasksController.TestWithImageGID = '9044BC32-30A7-49A5-8DC2-BA24BECE5E39';
TasksController.WritingTaskGID = '979F14EB-265C-4080-A375-9C10CD49B544';
TasksController.MapTask = '09DAFF50-996E-4077-9BE0-3C0BF516E56C';
TasksController.ConformityTaskGID = '9F3A9B8B-6B56-473E-B88A-DDD33C337396';

TasksController.ReadAnswer = function (taskTypeGID) {
    switch (taskTypeGID.toUpperCase()) {
        case TasksController.TestWithImageGID:
        case TasksController.TestTaskGID:
            return TasksController.ReadTestTask();
        case TasksController.WritingTaskGID:
            return TasksController.ReadWritingTask();
        case TasksController.MapTask:
            return TasksController.ReadMapTask();
        case TasksController.ConformityTaskGID:
            return TasksController.ReadConformityTask();
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

TasksController.ReadWritingTask = function () {
    var answer = document.getElementsByClassName("input-answer");

    if (answer.length > 0) {
        return answer[0].value;
    }

    return "no user entry";
};

TasksController.ReadMapTask = function () {
    var map = document.getElementById("map");

    if (map && map.attributes.userAnswer) {
        return map.attributes.userAnswer.value;
    }

    return "no user entry";
};

TasksController.ReadConformityTask = function () {
    var answers = document.getElementsByClassName("matching");
    var userAnswers = "";

    for (var i = 0; i < answers.length; i++) {
        if (answers[i].children[0].checked) {
            userAnswers += answers[i].children[0].name + "-" + answers[i].children[0].value + ";";
        }
    }

    return userAnswers;
};