<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"> -->
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=0">
<title>Admin</title>

<link href="../css/bootstrap.min.css" rel="stylesheet">
<script	src="../js/jquery-2.2.3.min.js"></script>
<script	src="../js/bootstrap.min.js"></script>

<style type="text/css">
.bs-example {
	margin: 20px;
}

select, h3, input, label, button, a {
	font-family: verdana;
}

.radio-inline {
font-size: 20px
}

.question {
font-size: 20px
}

.qNumber {
font-size: 25px;
color: black;
}

.radio {
//width: 50%;
//float: left;
}

.btn {
//width: 150px;
}

body {
background-color: #006193;
}

.optionRadio {
width: 30px;
height: 30px;
}

.optionText {
padding-left: 20px;
font-size: 35px;
}

.optionsTable{
width: 100%;
}

.optionsTd {
width: 30%
}

.btn-primary {
background-color: #3ABE00;
width: auto;
}

.content {

    background-color: lightgray;
    padding: 10px;
    border-radius: 10px;
}

.heading {
font-size: 150%;
}

</style>
<script type="text/javascript">

	$(document).ready(function() {
		
		var currentSet = $('#hiddenSetName').val();
		switch (currentSet) {
			case 'SET 1':
				$('.SET1').attr('checked', 'checked');
				break;
			case 'SET 2':
				$('.SET2').attr('checked', 'checked');
				break;
			case 'SET 3':
				$('.SET3').attr('checked', 'checked');
				break;
			}

		$('.updateSet').click(function() {
			$('.alert').hide();
			var setSelected = $('.optionsDiv').find('input:checked').val();
			$.ajax({
	            url: '/updateSet',
	            type: 'POST',
	            data: {'setName' : setSelected},
	            success: function (result) {
	            	handleSuccess(result);
	            },
	            error : function(result) {
	            	handleError(result);
	            }
	        });
		});
		
		$('.clearResponses').click(function() {
			if (confirm('Are you sure you want to archive all old responses ?')) {
				$('.alert').hide();
				$.ajax({
		            url: '/clearResponses',
		            type: 'GET',
		            success: function (result) {
		            	if (result == 'success') {
		        			$('.clearResponseSuccess').fadeIn(1000);
		        		}
		        		if (result == 'error') {
		        			$('.submitError').fadeIn(1000);
		        		}
		            },
		            error : function(result) {
		            	handleError(result);
		            }
		        });
			}
		});
	});



	function handleSuccess(result) {
		if (result == 'success') {
			$('.submitSuccess').fadeIn(1000);
		}
		if (result == 'error') {
			$('.submitError').fadeIn(1000);
		}
	}

	function handleError(result) {
		$('.submitError').fadeIn(1000);
	}

</script>
</head>
<body>


	
	<div class="container" style="margin: 0px;width: 100%;">
		
		<div style="text-align: center;margin-top: 10px;margin-bottom: 10px;border-radius: 10px;font-family: monospace;">
		<label style="font-size: 150%;font-family: verdana;color: blanchedalmond;">Admin</label>
		</div>
		
		<!-- <p>Sample instructions to put here</p> -->
<div class="content">
		<div class="alertDiv">
			<div class="alert alert-danger duplicateSubmit"
				style="display: none;">
				<strong>Error !</strong> You have already attempted the quiz. Thank
				you.
			</div>
			
			<div class="alert alert-danger validateError"
				style="display: none;">
				<strong>Error !</strong> Please answer all the questions.
			</div>

			<div class="alert alert-danger submitError" style="display: none;">
				<strong>Error !</strong> Some application error has occurred. Please
				try after sometime.
			</div>

			<div class="alert alert-success submitSuccess" style="display: none;" >
				<strong>Success !</strong> Set updated successfully.
			</div>
			
			<div class="alert alert-success clearResponseSuccess" style="display: none;" >
				<strong>Success !</strong> Old responses archived successfully.
			</div>
		</div>

		<form role="form" id="quizForm">
		<input type="hidden" value="${set}" id="hiddenSetName" />
				<div>
				
				<label class="heading">Update Active Set</label>
			<div class="optionsDiv">
			
			<div class="radio">
  					<label><input class="SET1" type="radio" name="optradio" value="SET 1">Cloud Questions</label>
				</div>
				<div class="radio">
  					<label><input class="SET2" type="radio" name="optradio" value="SET 2">FIL Cloud Journey</label>
				</div>
				<div class="radio">
  					<label><input class="SET3" type="radio" name="optradio" value="SET 3">Beginning Your Cloud Journey</label>
				</div>
			</div>
			<button type="button" 
							class="btn btn-primary updateSet"
							style="margin-bottom: 20px;">Update</button>
			</div>
			
			<div>
			<label class="heading">Clear Old Responses</label>
			<br>
			<button type="button" 
							class="btn btn-primary clearResponses"
							style="">Clear Responses</button>
			</div>
	</form>
	
	</div>
	</div>

</body>
</html>

