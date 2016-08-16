<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Results</title>
	

<link href="../css/bootstrap.min.css" rel="stylesheet">
<script	src="../js/jquery-2.2.3.min.js"></script>
<script	src="../js/bootstrap.min.js"></script>

<style type="text/css">
.bs-example {
	margin: 20px;
}

select, h3, input, label, button, a, p {
	font-family: verdana;
	font-size: 30px;
}

label.correct {
	color: green;
}

label.incorrect {
	color: red;
}

.setHeading {
    background-color: gold;
    border-radius: 5px;
    margin-top: 10px;
    margin-bottom: 10px;
    padding-left: 10px;
}
body {
background-color: #006193;
}

ol {
font-size: 30px;
}

</style>


<script type="text/javascript">
	$(document).ready(
			function() {
				$('.panel-collapse.in').collapse('hide');
				setInterval(function() {
					location.reload();
				}, 10000);
			});
</script>



</head>


<body>
	<div class="container" style="margin: 0px;width: 100%;">
		<div style="text-align: center;margin-top: 10px;margin-bottom: 10px;border-radius: 10px;font-family: monospace;">
		<label style="font-size: 50px;font-family: verdana;color: blanchedalmond;">Results !!</label>
		</div>
		<form role="form">
		
    	<div class="panel-group" id="accordion">
    	
    	<c:if test="${not empty results.setAResults}">
    	<div class="setHeading">
    	  	<label style="font-size: 30px;" for="usr">Cloud Questions</label>
    	 </div>
    	<c:forEach var="result" items="${results.setAResults}" varStatus="theCount"> 
    	  	<c:if test="${result.set eq 'SET 1'}">	
    		<div class="panel panel-default">
							<a data-toggle="collapse" data-parent="#accordion"
								href="#collapseSET1_${theCount.index}">
								<div class="panel-heading" style="background-color: lavender;">
							<table style="width: 100%">
								<tr>
									<td style="width: 20%"><label for="usr">${result.aNumber }</label></td>
									<td style="width: 30%"><label for="usr">Score - ${result.score } </label></td>
									<td style="width: 50%"><label for="usr"><fmt:formatDate type="time" value="${result.timSubmitted}" /></label>
									
									<c:if test="${theCount.index == 0 }">
										<p style=" float: right;font-family: monospace;font-weight: bold;">winner!</p>
										<!-- <img src="../images/winner-icon-1.png" class="img-rounded" style="height: 10%;width: 10%; float: right;" alt="Cinque Terre"> -->
										
									</c:if>
									
									</td>
								</tr>
							</table>
						</div>
							</a>
							<div id="collapseSET1_${theCount.index}" class="panel-collapse collapse in">
								<div class="panel-body">	
									<ol>
									<c:forEach var="qAnswer" items="${result.qAnswers}">
										<li>
											<label class="${qAnswer.isCorrect ? 'correct' : 'incorrect'}">${qAnswer.answerSelected}</label>
										</li>									
									</c:forEach>
									</ol>
									
								</div>
							</div>
						</div>
						</c:if>
    	
    	</c:forEach>
    	
    	</c:if>
    	
    	<c:if test="${not empty results.setBResults}">
    	<div class="setHeading">
    	  	<label style="font-size: 30px;" for="usr">FIL Cloud Journey</label>
    	 </div>
    	<c:forEach var="result" items="${results.setBResults}" varStatus="theCount"> 
    	  	<c:if test="${result.set eq 'SET 2'}">	
    		<div class="panel panel-default">
							<a data-toggle="collapse" data-parent="#accordion"
								href="#collapseSET2_${theCount.index}">
								<div class="panel-heading" style="background-color: lavender;">
							<table style="width: 100%">
								<tr>
									<td style="width: 20%"><label for="usr">${result.aNumber }</label></td>
									<td style="width: 30%"><label for="usr">Score - ${result.score } </label></td>
									<td style="width: 50%"><label for="usr"><fmt:formatDate type="time" value="${result.timSubmitted}" /></label>
									
									<c:if test="${theCount.index == 0 }">
										<p style=" float: right;font-family: monospace;font-weight: bold;">winner!</p>
										<!-- <img src="../images/winner-icon-1.png" class="img-rounded" style="height: 10%;width: 10%; float: right;" alt="Cinque Terre"> -->
									</c:if>
									
									</td>
								</tr>
							</table>
						</div>
							</a>
							<div id="collapseSET2_${theCount.index}" class="panel-collapse collapse in">
								<div class="panel-body">	
									<ol>
									<c:forEach var="qAnswer" items="${result.qAnswers}">
										<li>
											<label class="${qAnswer.isCorrect ? 'correct' : 'incorrect'}">${qAnswer.answerSelected}</label>
										</li>									
									</c:forEach>
									</ol>
									
								</div>
							</div>
						</div>
						</c:if>
    	
    	</c:forEach>
    	
    	</c:if>
    	
    	<c:if test="${not empty results.setCResults}">
    	<div class="setHeading">
    	  	<label style="font-size: 30px;" for="usr">Beginning Your Cloud Journey</label>
    	 </div>
    	<c:forEach var="result" items="${results.setCResults}" varStatus="theCount"> 
    	  	<c:if test="${result.set eq 'SET 3'}">	
    		<div class="panel panel-default">
							<a data-toggle="collapse" data-parent="#accordion"
								href="#collapseSET3_${theCount.index}">
								<div class="panel-heading" style="background-color: lavender;">
							<table style="width: 100%">
								<tr>
									<td style="width: 20%"><label for="usr">${result.aNumber }</label></td>
									<td style="width: 30%"><label for="usr">Score - ${result.score } </label></td>
									<td style="width: 50%"><label for="usr"><fmt:formatDate type="time" value="${result.timSubmitted}" /></label>
									
									<c:if test="${theCount.index == 0 }">
										<p style=" float: right;font-family: monospace;font-weight: bold;">winner!</p>
										<!-- <img src="../images/winner-icon-1.png" class="img-rounded" style="height: 10%;width: 10%; float: right;" alt="Cinque Terre"> -->
									</c:if>
									
									</td>
								</tr>
							</table>
						</div>
							</a>
							<div id="collapseSET3_${theCount.index}" class="panel-collapse collapse in">
								<div class="panel-body">	
									<ol>
									<c:forEach var="qAnswer" items="${result.qAnswers}">
										<li>
											<label class="${qAnswer.isCorrect ? 'correct' : 'incorrect'}">${qAnswer.answerSelected}</label>
										</li>									
									</c:forEach>
									</ol>
									
								</div>
							</div>
						</div>
						</c:if>
    	
    	</c:forEach>
    	
    	</c:if>
	</div>
		</div>
		</form>
	</div>

</body>
</html>


