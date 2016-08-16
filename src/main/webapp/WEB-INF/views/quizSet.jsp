<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"> -->
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=0">
<title>Quiz</title>
<link href="../css/bootstrap.min.css" rel="stylesheet">
<script	src="../js/jquery-2.2.3.min.js"></script>
<script	src="../js/bootstrap.min.js"></script>


<script type="text/javascript">
	var setCount = [ 1, 2, 3];
	var numericReg = /^([A|a][0-9]{6})$/;
	$(document).ready(function() {
		$(document).ajaxStart(function(){
	        $('#quizForm').hide();
	        $('.loadingDiv').show();
	    });
	    $(document).ajaxComplete(function(){
	    	$('#quizForm').show();
	    	$('.loadingDiv').hide();
	    });
		var setName = $('#hiddenSetName').val();
		switch(setName) {				
			case 'SET 1' : 
				$('.setNameHeading').html('Cloud Questions');
				break;
				
			case 'SET 2' : 
				$('.setNameHeading').html('FIL Cloud Journey');
				break;
				
			case 'SET 3' : 
				$('.setNameHeading').html('Beginning Your Cloud Journey');
				break;			
		}
		$('.submitBtn').click(function() {
			$('html, body').animate({scrollTop:0}, 'slow');
			$('.alert').hide();
			if (validateForm()) {
				var responseObj = prepareJSONRequest();
				$('.submitBtn').prop('disabled', true);
				submitQuizAnswers(responseObj);
			} else {
				
			}
		});
		
		$('.aNumber').focus(function(){
			if($('.aNumber').val() == ''){
				$('.aNumber').val('A');
				}
			});
		
		$('.aNumber').bind('keyup', function(){
			if($('.aNumber').val() == ''){
				$('.aNumber').val('A');
				}
			});
		});
	
	function prepareJSONRequest() {
		var responseObj = {};
		responseObj.aNumber = $.trim($('.aNumber').val());
		responseObj.set = $('#hiddenSetName').val();
		responseObj.answers = [];
		$.each(setCount, function(i, val) {
			responseObj.answers.push($('#collapse' + val).find('input:checked').val());
		});
		return responseObj;
	}
	
	function validateForm() {
		$('.aNumber').css('border-color', 'black');
		var result = true;
		$('#aNumberInput').removeClass('has-error');
		$('.aNumber').val($.trim($('.aNumber').val()));
		if ($('.aNumber').val() == '' || !numericReg.test($('.aNumber').val())) {
			$('#aNumberInput').addClass('has-error');
			$('.aNumber').css('border-color', 'red');
			$('.invalidAnumber').fadeIn(1000);
			result = false;
			return result;
		}
		$.each(setCount,function(i, val) {
					$('#collapse' + val).parent('.panel').find('.qNumber').css('color','black');
					if ($('#collapse' + val).find('input:checked').length == 0) {
						result = false;
						$('#collapse' + val).parent('.panel').find('.qNumber').css('color', 'red');
					}
				});
		if(result == false) {
			$('.validateError').fadeIn(1000);
		}
		return result;
	}
	
	function handleSuccess(result) {
		$('html, body').animate({scrollTop:0}, 'slow');
		if(result == 'duplicate') {
    		$('.duplicateSubmit').fadeIn(1000);
    		$('.submitBtn').prop('disabled', false);
    	}
    	if(result == 'success') {
    		$('.submitSuccess').fadeIn(1000);
    		$('.imageDiv').show();
    		$('.container').remove();
    	}
	}
	
	function handleError(result) {
		$('html, body').animate({scrollTop:0}, 'slow');
		$('.submitError').fadeIn(1000);
		$('.submitBtn').prop('disabled', false);
	}
	
	function submitQuizAnswers(responseObj) {
		$.ajax({
            url: '/submitQuiz',
            type: 'POST',
            headers: {
            	'Accept' : 'text/plain',
            	'Content-Type' : 'application/json'
            },
            data: JSON.stringify(responseObj),
            success: function (result) {
            	handleSuccess(result);
            },
            error : function(result) {
            	handleError(result);
            }
        });
	}
</script>

<style type="text/css">
.bs-example {
	margin: 20px;
}


.btn-primary {
	background-color: #3ABE00;
	webkit-box-shadow: 0px 9px 0px rgba(219,31,5,1), 0px 9px 25px rgba(0,0,0,.7);
	moz-box-shadow: 0px 9px 0px rgba(219,31,5,1), 0px 9px 25px rgba(0,0,0,.7);
	box-shadow: 0px 9px 0px rgba(219,31,5,1), 0px 9px 25px rgba(0,0,0,.7);
}

body {
background-color: #006193;
}

.optionsTable{
width: 100%;
}

.optionsTd {
width: 50%
}
.alert {
margin-bottom: 5px;
}

.heading {
margin-top: 5px;
font-family: verdana;
color: azure;
font-weight: bold;
font-size: 110%;
}

.alertDiv {
margin-top: -10px;
}

.alert {
padding: 5px;
}

.submitBtn{
width: 50%;
}


input#shiny {
padding: 4px 20px;
/*give the background a gradient*/
background:#ffae00; /*fallback for browsers that don't support gradients*/
background: -webkit-linear-gradient(top, #ffae00, #d67600);
background: -moz-linear-gradient(top, #ffae00, #d67600);
background: -o-linear-gradient(top, #ffae00, #d67600);
background: linear-gradient(top, #ffae00, #d67600);
border:2px outset #dad9d8;
/*style the text*/
font-family:Andika, Arial, sans-serif; /*Andkia is available at http://www.google.com/webfonts/specimen/Andika*/
font-size:1.1em;
letter-spacing:0.05em;
text-transform:uppercase;
color:#fff;
text-shadow: 0px 1px 10px #000;
/*add to small curve to the corners of the button*/
-webkit-border-radius: 5px;
-moz-border-radius: 5px;
border-radius:15px;
/*give the button a drop shadow*/
-webkit-box-shadow: rgba(0, 0, 0, .55) 0 1px 6px;
-moz-box-shadow: rgba(0, 0, 0, .55) 0 1px 6px;
box-shadow: rgba(0, 0, 0, .55) 0 1px 6px;
}
/****NOW STYLE THE BUTTON'S HOVER STATE***/
input#shiny:hover, input#shiny:focus {
border:2px solid #dad9d8;
}
td {
vertical-align: top;
}

</style>

</head>
<body>
    <div class="container" style="margin: 0px;width: 100%;">
        <div class="heading">
            <label style="padding-top: 5px;">Quiz</label>
             - "<label class="setNameHeading">Cloud Questions</label>"
            <hr style="margin-top: 0px;margin-left: -20px;margin-right: -20px">
        </div>
        <!-- <p>Sample instructions to put here</p> -->

        <div class="alertDiv">
            <div class="alert alert-danger duplicateSubmit" style="display: none;">
                <strong>Error !</strong> You have already attempted the quiz. Thank you.
            </div>

            <div class="alert alert-danger validateError" style="display: none;">
                <strong>Error !</strong> Please answer all the questions.
            </div>

            <div class="alert alert-danger submitError" style="display: none;">
                <strong>Error !</strong> Some application error has occurred. Please try after sometime.
            </div>

            <div class="alert alert-danger invalidAnumber" style="display: none;">
                <strong>Error !</strong> Please enter a valid a number.
            </div>

            <div class="alert alert-success submitSuccess" style="display: none;font-size: x-large;">
                <strong>Success !</strong> Thank you for taking part in the Quiz.
            </div>
        </div>
        <form role="form" id="quizForm">
            <div class="form-group" id="aNumberInput" style="margin-bottom: 5px">
                <input class="form-control aNumber" id="inputlg" placeholder="A Number...." type="text" style="border-width: 2px;border-color: black;" />
            </div>
            <%@ include file="Day2.jsp" %>
            
            <div class="" style="text-align: center; margin-bottom: 20px">
                            <input id="shiny" type="button" value="Submit" class="submitBtn" />
                        </div>
        </form>
    </div>

    <div style="text-align: center;margin-top: 15%; display: none;" class="imageDiv">
        <img src="../images/thankyou-640x202.jpg" class="img-rounded" style="height: 70%;width: 70%;" alt="Cinque Terre">
        <p><label class="" style="font-size: 110%;color: white;">Do check you email for handout links!</label></p>
    </div>
    <div style="text-align: center;display: none;margin-top: 15%;" class="loadingDiv">
        <img src="../images/cloud_loading_256.gif" class="img-rounded" style="height: 70%;width: 70%;" alt="Cinque Terre">
    </div>

</body>
</html>

