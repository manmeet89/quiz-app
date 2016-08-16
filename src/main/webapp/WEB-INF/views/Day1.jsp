<input type="hidden" value="${set}" id="hiddenSetName" />

            <c:choose>
                <c:when test="${set eq 'SET 1'}">
                    <div class="panel-group set1" id="accordion">
                        <div class="panel panel-default">

                            <div class="panel-heading" style="background-color: lavender;">
                                <span class="qNumber">1.</span> <span class="question">
									What % of organisations are convinced that CLOUD will solve business challange ?
									</span>
                            </div>
                            <div id="collapse1" class="">
                                <div class="panel-body">
                                    <table class="optionsTable">
                                        <tr>
                                            <td class="optionsTd">
                                                <label class="radio-inline">
                                                    <input class="optionRadio" type="radio" name="q1" value="A"><span class="optionText">60%</span>
                                                </label>
                                            </td>
                                            <td class="optionsTd">
                                                <label class="radio-inline">
                                                    <input class="optionRadio" type="radio" name="q1" value="B"><span class="optionText">65%</span>
                                                </label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="optionsTd">
                                                <label class="radio-inline">
                                                    <input class="optionRadio" type="radio" name="q1" value="C"><span class="optionText">40%</span>
                                                </label>
                                            </td>
                                            <td class="optionsTd">
                                                <label class="radio-inline">
                                                    <input class="optionRadio" type="radio" name="q1" value="D"><span class="optionText">90%</span>
                                                </label>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                            </div>
                        </div>

                        <div class="panel panel-default">
                            <div class="panel-heading" style="background-color: lavender;">
                                <span class="qNumber">2.</span> <span class="question">
									'THE INTERNET' of today is being compared to 'THE CLOUD' by which year ?
									</span>
                            </div>
                            <div id="collapse2" class="">
                                <div class="panel-body">
                                    <table class="optionsTable">
                                        <tr>
                                            <td class="optionsTd">
                                                <label class="radio-inline">
                                                    <input class="optionRadio" type="radio" name="q2" value="A"><span class="optionText">2010</span>
                                                </label>
                                            </td>
                                            <td class="optionsTd">
                                                <label class="radio-inline">
                                                    <input class="optionRadio" type="radio" name="q2" value="B"><span class="optionText">2015</span>
                                                </label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="optionsTd">
                                                <label class="radio-inline">
                                                    <input class="optionRadio" type="radio" name="q2" value="C"><span class="optionText">2020</span>
                                                </label>
                                            </td>
                                            <td class="optionsTd">
                                                <label class="radio-inline">
                                                    <input class="optionRadio" type="radio" name="q2" value="D"><span class="optionText">1990</span>
                                                </label>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                            </div>
                        </div>

                        <div class="panel panel-default">
                            <div class="panel-heading" style="background-color: lavender;">
                                <span class="qNumber">3.</span> <span class="question">
									Which % of enterprises will adopt a HYBRID CLOUD deployment by 2017 ?
									</span>
                            </div>
                            <div id="collapse3" class="">
                                <div class="panel-body">
                                    <table class="optionsTable">
                                        <tr>
                                            <td class="optionsTd">
                                                <label class="radio-inline">
                                                    <input class="optionRadio" type="radio" name="q3" value="A"><span class="optionText">40%</span>
                                                </label>
                                            </td>
                                            <td class="optionsTd">
                                                <label class="radio-inline">
                                                    <input class="optionRadio" type="radio" name="q3" value="B"><span class="optionText">50%</span>
                                                </label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="optionsTd">
                                                <label class="radio-inline">
                                                    <input class="optionRadio" type="radio" name="q3" value="C"><span class="optionText">60%</span>
                                                </label>
                                            </td>
                                            <td class="optionsTd">
                                                <label class="radio-inline">
                                                    <input class="optionRadio" type="radio" name="q3" value="D"><span class="optionText">20%</span>
                                                </label>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                            </div>
                        </div>
                        
                    </div>
                </c:when>
                <c:when test="${set eq 'SET 2'}">
                    <div class="panel-group set2" id="accordion">
                        <div class="panel panel-default">

                            <div class="panel-heading" style="background-color: lavender;">
                                <span class="qNumber">1.</span> <span class="question">
									Which of these is not part of FIL's Cloud Journey ?
									</span>
                            </div>
                            <div id="collapse1" class="">
                                <div class="panel-body">
                                    <table class="optionsTable">
                                        <tr>
                                            <td class="optionsTd">
                                                <label class="radio-inline">
                                                    <input class="optionRadio" type="radio" name="q1" value="A"><span class="optionText">Salesforce</span>
                                                </label>
                                            </td>
                                            <td class="optionsTd">
                                                <label class="radio-inline">
                                                    <input class="optionRadio" type="radio" name="q1" value="B"><span class="optionText">Office 365</span>
                                                </label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="optionsTd">
                                                <label class="radio-inline">
                                                    <input class="optionRadio" type="radio" name="q1" value="C"><span class="optionText">Workforce</span>
                                                </label>
                                            </td>
                                            <td class="optionsTd">
                                                <label class="radio-inline">
                                                    <input class="optionRadio" type="radio" name="q1" value="D"><span class="optionText">Concur</span>
                                                </label>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                            </div>
                        </div>

                        <div class="panel panel-default">
                            <div class="panel-heading" style="background-color: lavender;">
                                <span class="qNumber">2.</span> <span class="question">
									Which of these was on boarded as a CLOUD offering by FIL in 2013 ?
									</span>
                            </div>
                            <div id="collapse2" class="">
                                <div class="panel-body">
                                    <table class="optionsTable">
                                        <tr>
                                            <td class="optionsTd">
                                                <label class="radio-inline">
                                                    <input class="optionRadio" type="radio" name="q2" value="A"><span class="optionText">PaaS</span>
                                                </label>
                                            </td>
                                            <td class="optionsTd">
                                                <label class="radio-inline">
                                                    <input class="optionRadio" type="radio" name="q2" value="B"><span class="optionText">Shuttle</span>
                                                </label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="optionsTd">
                                                <label class="radio-inline">
                                                    <input class="optionRadio" type="radio" name="q2" value="C"><span class="optionText">Filter</span>
                                                </label>
                                            </td>
                                            <td class="optionsTd">
                                                <label class="radio-inline">
                                                    <input class="optionRadio" type="radio" name="q2" value="D"><span class="optionText">None</span>
                                                </label>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                            </div>
                        </div>

                        <div class="panel panel-default">
                            <div class="panel-heading" style="background-color: lavender;">
                                <span class="qNumber">3.</span> <span class="question">
									Which of these is not SaaS ?
									</span>
                            </div>
                            <div id="collapse3" class="">
                                <div class="panel-body">
                                    <table class="optionsTable">
                                        <tr>
                                            <td class="optionsTd">
                                                <label class="radio-inline">
                                                    <input class="optionRadio" type="radio" name="q3" value="A"><span class="optionText">Concur</span>
                                                </label>
                                            </td>
                                            <td class="optionsTd">
                                                <label class="radio-inline">
                                                    <input class="optionRadio" type="radio" name="q3" value="B"><span class="optionText">Salesforce</span>
                                                </label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="optionsTd">
                                                <label class="radio-inline">
                                                    <input class="optionRadio" type="radio" name="q3" value="C"><span class="optionText">Shuttle</span>
                                                </label>
                                            </td>
                                            <td class="optionsTd">
                                                <label class="radio-inline">
                                                    <input class="optionRadio" type="radio" name="q3" value="D"><span class="optionText">None</span>
                                                </label>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                            </div>
                        </div>
                        
                    </div>
                </c:when>
                <c:otherwise>
                    <div class="panel-group set3" id="accordion">
                        <div class="panel panel-default">

                            <div class="panel-heading" style="background-color: lavender;">
                                <span class="qNumber">1.</span> <span class="question">
									Which of these is not part of 12 Factors ?
									</span>
                            </div>
                            <div id="collapse1" class="">
                                <div class="panel-body">
                                    <table class="optionsTable">
                                        <tr>
                                            <td class="optionsTd">
                                                <label class="radio-inline">
                                                    <input class="optionRadio" type="radio" name="q1" value="A"><span class="optionText">Elasticity</span>
                                                </label>
                                            </td>
                                            <td class="optionsTd">
                                                <label class="radio-inline">
                                                    <input class="optionRadio" type="radio" name="q1" value="B"><span class="optionText">Process</span>
                                                </label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="optionsTd">
                                                <label class="radio-inline">
                                                    <input class="optionRadio" type="radio" name="q1" value="C"><span class="optionText">Concurrency</span>
                                                </label>
                                            </td>
                                            <td class="optionsTd">
                                                <label class="radio-inline">
                                                    <input class="optionRadio" type="radio" name="q1" value="D"><span class="optionText">Agility</span>
                                                </label>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                            </div>
                        </div>

                        <div class="panel panel-default">
                            <div class="panel-heading" style="background-color: lavender;">
                                <span class="qNumber">2.</span> <span class="question">
									Reduction of CAPEX is a mandate for CLOUD adoption in organisations. What does CAPEX stand for ?
									</span>
                            </div>
                            <div id="collapse2" class="">
                                <div class="panel-body">
                                    <table class="optionsTable">
                                        <tr>
                                            <td class="optionsTd">
                                                <label class="radio-inline">
                                                    <input class="optionRadio" type="radio" name="q2" value="A"><span class="optionText">Capacity Expense</span>
                                                </label>
                                            </td>
                                            <td class="optionsTd">
                                                <label class="radio-inline">
                                                    <input class="optionRadio" type="radio" name="q2" value="B"><span class="optionText">Capital Expenditure</span>
                                                </label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="optionsTd">
                                                <label class="radio-inline">
                                                    <input class="optionRadio" type="radio" name="q2" value="C"><span class="optionText">Capabity Experience</span>
                                                </label>
                                            </td>
                                            <td class="optionsTd">
                                                <label class="radio-inline">
                                                    <input class="optionRadio" type="radio" name="q2" value="D"><span class="optionText">Captive Engine</span>
                                                </label>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                            </div>
                        </div>

                        <div class="panel panel-default">
                            <div class="panel-heading" style="background-color: lavender;">
                                <span class="qNumber">3.</span> <span class="question">
									Which one is NOT a type of CLOUD ?
									</span>
                            </div>
                            <div id="collapse3" class="">
                                <div class="panel-body">
                                    <table class="optionsTable">
                                        <tr>
                                            <td class="optionsTd">
                                                <label class="radio-inline">
                                                    <input class="optionRadio" type="radio" name="q3" value="A"><span class="optionText">Homogeneous Cloud</span>
                                                </label>
                                            </td>
                                            <td class="optionsTd">
                                                <label class="radio-inline">
                                                    <input class="optionRadio" type="radio" name="q3" value="B"><span class="optionText">Hybrid Cloud</span>
                                                </label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="optionsTd">
                                                <label class="radio-inline">
                                                    <input class="optionRadio" type="radio" name="q3" value="C"><span class="optionText">Public Cloud</span>
                                                </label>
                                            </td>
                                            <td class="optionsTd">
                                                <label class="radio-inline">
                                                    <input class="optionRadio" type="radio" name="q3" value="D"><span class="optionText">Private CLoud</span>
                                                </label>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                            </div>
                        </div>
                        
                    </div>
                </c:otherwise>
            </c:choose>