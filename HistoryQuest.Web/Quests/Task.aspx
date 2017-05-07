<%@ Page Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeBehind="Task.aspx.cs" Inherits="HistoryQuest.Quests.Task" %>

<%@ Import Namespace="HistoryQuest.Domain" %>

<asp:Content runat="server" ContentPlaceHolderID="ContentPlaceHolder">
    <div class="wrapper">
        <div class="info">
            <div class="container clearfix">
                <div class="task">
                    <div class="page-title"> <%--Название стоит только для первого блока для удобства.--%>
                        <div>
                            <h2 id="TaskHeader" runat="server">Название квеста. Название чекпоинта</h2>
                            <div class="b-progress-bar">
                                <div class="progress-bar" style="width: 25%"></div>  <%--Длина полоски регулируется стилем. Сейчас стоит 1/4 длины.--%>
                            </div>
                        </div>
                    </div>
                    <div class="page-content card">
                        <div class="question-total">4 из 5</div>
                        <div class="question-text">
                            <p id="QuestionText" runat="server">На службу в роту Почетного караула набирают юношей с законченным средним образованием, высокими моральными качествами, отменным здоровьем и ростом от 182 см до 188 см. Укажите число, которое не может равняться среднему росту служащего роты Почетного караула.</p>
                        </div>
                        <div class="question-choises">
                            <div class="variant">
                                <label class="question-form">
                                    <input name="taskName" value="taskId" type="radio" />
                                    <span class="icon"><i class="fa fa-check" aria-hidden="true"></i></span>
                                    <span class="caption">Ответ</span>
                                </label>
                            </div>
                            <div class="variant">
                                <label class="question-form">
                                    <input name="taskName" value="taskId" type="radio" />
                                    <span class="icon"><i class="fa fa-check" aria-hidden="true"></i></span>
                                    <span class="caption">Ответ</span>
                                </label>
                            </div>
                            <div class="variant">
                                <label class="question-form">
                                    <input name="taskName" value="taskId" type="radio" />
                                    <span class="icon"><i class="fa fa-check" aria-hidden="true"></i></span>
                                    <span class="caption">Ответ</span>
                                </label>
                            </div>
                            <div class="variant">
                                <label class="question-form">
                                    <input name="taskName" value="taskId" type="radio" />
                                    <span class="icon"><i class="fa fa-check" aria-hidden="true"></i></span>
                                    <span class="caption">Ответ</span>
                                </label>
                            </div>
                        </div>
                    </div>
                    <div class="card">
                        <button id="NextButton" runat="server" onclick="OnNextButtonClick" class="btn btn-primary">Дальше</button>
                        <button id="GiveUpButton" runat="server" class="btn btn-default right">Сдаться</button>
                    </div>
                </div>
                <%--Задача (текст) с одним правильным ответом--%>
                <div class="task">
                    <div class="page-content card">
                        <div class="question-total">4 из 5</div>
                        <div class="question-text">
                            <p>Кто изображен на рисунке?</p>
                        </div>
                        <div class="question-img">
                            <img src="../libs/img/sagay.jpg" />
                        </div>
                        <div class=" question-choises">
                            <div class="variant">
                                <label class="question-form">
                                    <input name="taskName" value="taskId" type="radio" />
                                    <span class="icon"><i class="fa fa-check" aria-hidden="true"></i></span>
                                    <span class="caption">Ответ</span>
                                </label>
                            </div>
                            <div class="variant">
                                <label class="question-form">
                                    <input name="taskName" value="taskId" type="radio" />
                                    <span class="icon"><i class="fa fa-check" aria-hidden="true"></i></span>
                                    <span class="caption">Ответ</span>
                                </label>
                            </div>
                            <div class="variant">
                                <label class="question-form">
                                    <input name="taskName" value="taskId" type="radio" />
                                    <span class="icon"><i class="fa fa-check" aria-hidden="true"></i></span>
                                    <span class="caption">Ответ</span>
                                </label>
                            </div>
                            <div class="variant">
                                <label class="question-form">
                                    <input name="taskName" value="taskId" type="radio" />
                                    <span class="icon"><i class="fa fa-check" aria-hidden="true"></i></span>
                                    <span class="caption">Ответ</span>
                                </label>
                            </div>
                        </div>
                    </div>
                    <div class="card">
                        <button class="btn btn-primary">Дальше</button>
                        <button class="btn btn-default right">Сдаться</button>
                    </div>
                </div>
                <%--Задача (фото) с одним правильным ответом--%>
                <div class="task">
                    <div class="page-content card">
                        <div class="question-total">4 из 5</div>
                        <div class="question-text">
                            <p>Укажите на карте место рождения Сагайдачного.</p>
                        </div>
                        <div class="question-map">
                            <div id="map"></div>
                            <script async defer
                                src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAGaJ_hdTjIj5HSIH4qyVrMf379w6k_vtg&libraries=geometry&callback=QuestMap.InitializeMap">
                            </script>
                        </div>
                    </div>
                    <div class="card">
                        <button class="btn btn-primary">Дальше</button>
                        <button class="btn btn-default right">Сдаться</button>
                    </div>
                </div>
                <%--Задача (карта) с одним правильным ответом--%>
                <div class="task">
                    <div class="page-content card">
                        <div class="question-total">4 из 5</div>
                        <div class="question-text">
                            <p>На службу в роту Почетного караула набирают юношей с законченным средним образованием, высокими моральными качествами, отменным здоровьем и ростом от 182 см до 188 см. Укажите число, которое не может равняться среднему росту служащего роты Почетного караула.</p>
                        </div>
                        <div class="question-choises-50">
                            <div class="variant">
                                <label class="question-form">
                                    <input name="taskName" value="taskId" type="radio" />
                                    <span class="icon">1</span>
                                    <span class="caption">Фраза 1</span>
                                </label>
                            </div>
                            <div class="variant">
                                <label class="question-form">
                                    <input name="taskName" value="taskId" type="radio" />
                                    <span class="icon">2</span>
                                    <span class="caption">Фраза 2</span>
                                </label>
                            </div>
                            <div class="variant">
                                <label class="question-form">
                                    <input name="taskName" value="taskId" type="radio" />
                                    <span class="icon">3</span>
                                    <span class="caption">Фраза 3</span>
                                </label>
                            </div>
                            <div class="variant">
                                <label class="question-form">
                                    <input name="taskName" value="taskId" type="radio" />
                                    <span class="icon">4</span>
                                    <span class="caption">Фраза 4</span>
                                </label>
                            </div>
                        </div>
                        <div class="question-choises-50">
                            <div class="variant">
                                <label class="question-form">
                                    <input name="taskName" value="taskId" type="radio" />
                                    <span class="icon">А</span>
                                    <span class="caption">Ответ 1</span>
                                </label>
                            </div>
                            <div class="variant">
                                <label class="question-form">
                                    <input name="taskName" value="taskId" type="radio" />
                                    <span class="icon">Б</span>
                                    <span class="caption">Ответ 2</span>
                                </label>
                            </div>
                            <div class="variant">
                                <label class="question-form">
                                    <input name="taskName" value="taskId" type="radio" />
                                    <span class="icon">В</span>
                                    <span class="caption">Ответ 3</span>
                                </label>
                            </div>
                            <div class="variant">
                                <label class="question-form">
                                    <input name="taskName" value="taskId" type="radio" />
                                    <span class="icon">Г</span>
                                    <span class="caption">Ответ 4</span>
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
                    <div class="card">
                        <button class="btn btn-primary">Дальше</button>
                        <button class="btn btn-default right">Сдаться</button>
                    </div>
                </div>
                <%--Задача: установить соответствие--%>
                <div class="task">
                    <div class="page-content card">
                        <div class="question-total">4 из 5</div>
                        <div class="question-text">
                            <p>На службу в роту Почетного караула набирают юношей с законченным средним образованием, высокими моральными качествами, отменным здоровьем и ростом от 182 см до 188 см. Укажите число, которое не может равняться среднему росту служащего роты Почетного караула.</p>
                        </div>
                        <div class=" question-choises">
                            <div class="variant">
                                <label class="caption">Ответ</label>
                                <input class="input-answer" name="taskName" autocomplete="off" type="text" />
                            </div>
                        </div>
                    </div>
                    <div class="card">
                        <button class="btn btn-primary">Дальше</button>
                        <button class="btn btn-default right">Сдаться</button>
                    </div>
                </div>
                <%--Задача: написать ответ вручную--%>
            </div>
        </div>
    </div>
</asp:Content>
