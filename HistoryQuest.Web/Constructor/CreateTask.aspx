<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CreateTask.aspx.cs" MasterPageFile="~/Main.Master" Inherits="HistoryQuest.Constructor.CreateTask" %>

<%@ Import Namespace="HistoryQuest.Domain" %>
<%@ Import Namespace="HistoryQuest.WebServices" %>

<asp:Content runat="server" ContentPlaceHolderID="ContentPlaceHolder">
    <div class="wrapper">
        <div class="info" id="TaskContainer" runat="server" ClientIDMode="Static" taskgid="">
            <div class="container clearfix">
                <div class="page-content card">
                    <fieldset class="form-fieldset">
                        <label for="DropDownTaskType" class="form-label">Оберіть тип завдання:</label>
                        <asp:DropDownList ID="DropDownTaskType" runat="server" ClientIDMode="Static" class="form-input" > 
                        </asp:DropDownList>
                    </fieldset>
                </div>
                <div class="task">
                    <div class="page-content card" id="Types">
                        <div class="question-text create clearfix">
                            <textarea id="QuestionText" class="form-input" placeholder="Текст запитання"></textarea>
                        </div>
                        <div class="question-choises" id="Test" style="display:none">
                            <div class="variant">
                                <label class="question-form">
                                    <input name="taskId" value="0" type="radio" />
                                    <span class="icon"><i class="fa fa-check" aria-hidden="true"></i></span>
                                    <input type="text" class="form-input create" placeholder="Перший варіант відповіді" validation="text" answer/>
                                </label>
                            </div>
                            <div class="variant">
                                <label class="question-form">
                                    <input name="taskId" value="1" type="radio" />
                                    <span class="icon"><i class="fa fa-check" aria-hidden="true"></i></span>
                                    <input type="text" class="form-input create" placeholder="Другий варіант відповіді" validation="text" answer/>
                                </label>
                            </div>
                            <div class="variant">
                                <label class="question-form">
                                    <input name="taskId" value="2" type="radio" />
                                    <span class="icon"><i class="fa fa-check" aria-hidden="true"></i></span>
                                    <input type="text" class="form-input create" placeholder="Третій варіант відповіді" validation="text" answer/>
                                </label>
                            </div>
                            <div class="variant">
                                <label class="question-form">
                                    <input name="taskId" value="3" type="radio" />
                                    <span class="icon"><i class="fa fa-check" aria-hidden="true"></i></span>
                                    <input type="text" class="form-input create" placeholder="Четвертий варіант відповіді" validation="text" answer/>
                                </label>
                            </div>
                        </div>
                        <div class="question-map" id="Map" style="display:none">
                            <div id="map"></div>
                            <script async defer
                                src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAGaJ_hdTjIj5HSIH4qyVrMf379w6k_vtg&libraries=geometry&callback=QuestMap.InitializeTaskMap">
                            </script>
                        </div>
                        <div id="Conformity" style="display:none">
                            <div class="question-choises-50">
                                <div class="variant">
                                    <label class="question-form">
                                        <input name="taskName" value="taskId" type="radio" />
                                        <span class="icon">1</span>
                                        <input type="text" class="form-input create" question/>
                                    </label>
                                </div>
                                <div class="variant">
                                    <label class="question-form">
                                        <input name="taskName" value="taskId" type="radio" />
                                        <span class="icon">2</span>
                                        <input type="text" class="form-input create" question/>
                                    </label>
                                </div>
                                <div class="variant">
                                    <label class="question-form">
                                        <input name="taskName" value="taskId" type="radio" />
                                        <span class="icon">3</span>
                                        <input type="text" class="form-input create" question/>
                                    </label>
                                </div>
                                <div class="variant">
                                    <label class="question-form">
                                        <input name="taskName" value="taskId" type="radio" />
                                        <span class="icon">4</span>
                                        <input type="text" class="form-input create" question/>
                                    </label>
                                </div>
                            </div>
                            <div class="question-choises-50">
                                <div class="variant">
                                    <label class="question-form">
                                        <input name="taskName" value="taskId" type="radio" />
                                        <span class="icon">А</span>
                                        <input type="text" class="form-input create" answer/>
                                    </label>
                                </div>
                                <div class="variant">
                                    <label class="question-form">
                                        <input name="taskName" value="taskId" type="radio" />
                                        <span class="icon">Б</span>
                                        <input type="text" class="form-input create" answer/>
                                    </label>
                                </div>
                                <div class="variant">
                                    <label class="question-form">
                                        <input name="taskName" value="taskId" type="radio" />
                                        <span class="icon">В</span>
                                        <input type="text" class="form-input create" answer/>
                                    </label>
                                </div>
                                <div class="variant">
                                    <label class="question-form">
                                        <input name="taskName" value="taskId" type="radio" />
                                        <span class="icon">Г</span>
                                        <input type="text" class="form-input create" answer/>
                                    </label>
                                </div>
                            </div>
                            <table class="question-matching">
                                <tbody>
                                    <tr>
                                        <th></th>
                                        <th>А</th>
                                        <th>Б</th>
                                        <th>В</th>
                                        <th>Г</th>
                                    </tr>
                                    <tr>
                                        <th class="v">1</th>
                                        <td>
                                            <label class="question-form matching">
                                                <input name="1" value="А" type="radio" />
                                                <span class="icon"><i class="fa fa-check" aria-hidden="true"></i></span>
                                            </label>
                                        </td>
                                        <td>
                                            <label class="question-form matching">
                                                <input name="1" value="Б" type="radio" />
                                                <span class="icon"><i class="fa fa-check" aria-hidden="true"></i></span>
                                            </label>
                                        </td>
                                        <td>
                                            <label class="question-form matching">
                                                <input name="1" value="В" type="radio" />
                                                <span class="icon"><i class="fa fa-check" aria-hidden="true"></i></span>
                                            </label>
                                        </td>
                                        <td>
                                            <label class="question-form matching">
                                                <input name="1" value="Г" type="radio" />
                                                <span class="icon"><i class="fa fa-check" aria-hidden="true"></i></span>
                                            </label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th class="v">2</th>
                                        <td>
                                            <label class="question-form matching">
                                                <input name="2" value="А" type="radio" />
                                                <span class="icon"><i class="fa fa-check" aria-hidden="true"></i></span>
                                            </label>
                                        </td>
                                        <td>
                                            <label class="question-form matching">
                                                <input name="2" value="Б" type="radio" />
                                                <span class="icon"><i class="fa fa-check" aria-hidden="true"></i></span>
                                            </label>
                                        </td>
                                        <td>
                                            <label class="question-form matching">
                                                <input name="2" value="В" type="radio" />
                                                <span class="icon"><i class="fa fa-check" aria-hidden="true"></i></span>
                                            </label>
                                        </td>
                                        <td>
                                            <label class="question-form matching">
                                                <input name="2" value="Г" type="radio" />
                                                <span class="icon"><i class="fa fa-check" aria-hidden="true"></i></span>
                                            </label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th class="v">3</th>
                                        <td>
                                            <label class="question-form matching">
                                                <input name="3" value="А" type="radio" />
                                                <span class="icon"><i class="fa fa-check" aria-hidden="true"></i></span>
                                            </label>
                                        </td>
                                        <td>
                                            <label class="question-form matching">
                                                <input name="3" value="Б" type="radio" />
                                                <span class="icon"><i class="fa fa-check" aria-hidden="true"></i></span>
                                            </label>
                                        </td>
                                        <td>
                                            <label class="question-form matching">
                                                <input name="3" value="В" type="radio" />
                                                <span class="icon"><i class="fa fa-check" aria-hidden="true"></i></span>
                                            </label>
                                        </td>
                                        <td>
                                            <label class="question-form matching">
                                                <input name="3" value="Г" type="radio" />
                                                <span class="icon"><i class="fa fa-check" aria-hidden="true"></i></span>
                                            </label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th class="v">4</th>
                                        <td>
                                            <label class="question-form matching">
                                                <input name="4" value="А" type="radio" />
                                                <span class="icon"><i class="fa fa-check" aria-hidden="true"></i></span>
                                            </label>
                                        </td>
                                        <td>
                                            <label class="question-form matching">
                                                <input name="4" value="Б" type="radio" />
                                                <span class="icon"><i class="fa fa-check" aria-hidden="true"></i></span>
                                            </label>
                                        </td>
                                        <td>
                                            <label class="question-form matching">
                                                <input name="4" value="В" type="radio" />
                                                <span class="icon"><i class="fa fa-check" aria-hidden="true"></i></span>
                                            </label>
                                        </td>
                                        <td>
                                            <label class="question-form matching">
                                                <input name="4" value="Г" type="radio" />
                                                <span class="icon"><i class="fa fa-check" aria-hidden="true"></i></span>
                                            </label>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <div class=" question-choises" id="Writing" style="display:none">
                            <div class="variant">
                                <label class="caption">Відповідь</label>
                                <input class="input-answer" autocomplete="off" type="text" validation="text" rightanswer/>
                            </div>
                        </div>
                        <div id="TestWithImage"></div>
                    </div>
                    <div class="card">
                        <button id="CreateTaskButton" class="btn btn-primary">Зберегти</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script>
        CreateTask.Initialize();
        $("#CreateTaskButton").click(function (e) {
            e.preventDefault();
            WebService.SaveTask(CreateTask.GetTask());
        });
    </script>
</asp:Content>
