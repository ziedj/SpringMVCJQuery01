<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<script src="<c:url value="/resources/core/jquery.1.10.2.min.js" />"></script>
<script
	src="<c:url value="/resources/core/jquery.autocomplete.min.js" />"></script>
<link href="<c:url value="/resources/core/main.css" />" rel="stylesheet">
</head>
<body>
	<h2>Spring MVC + jQuery + Autocomplete example</h2>


	<div title="AJAX" style="border: 1px solid black; border-color: blue;">

		<div>
			<form method="post" id="testForm" action="ajaxJsonTest">
				<input type="text" name="name"> <input type="text"
					name="firstName"> <input type="submit" value="AJAX">
			</form>
		</div>
		<div>
			Text envoye :
			<output id="ttt" name="xxx"></output>

		</div>

		<div>
			Name :
			<output id="nameId"></output>
			First Name :
			<output id="firstNameId"></output>
		</div>

		<script>
			// Attach a submit handler to the form
			$("#testForm")
					.submit(
							function(event) {
								// Stop form from submitting normally
								event.preventDefault();
								// Get some values from elements on the page:
								var $form = $(this);
								var name = $form.find("input[name='name']")
										.val();
								var firstName = $form.find(
										"input[name='firstName']").val();
								var url = $form.attr("action");
								// Send the data using post
								var posting = $.post(url, {
									name : name,
									firstName : firstName
								});
								// Put the results in a div
								posting
										.done(function(data) {
											//$("#ttt").value = data;
											//document.getElementById("ttt").value = data;
											//var htm = '<h1 >send data=' + data + '</h1>';
											//var obj = $.parseJSON(data);
											//alert("Data Loaded: " + data.name + " " + data.firstName);
											document.getElementById("nameId").value = data.name;
											document
													.getElementById("firstNameId").value = data.firstName;
											//$("#result").html(htm);
										});
							});
		</script>
	</div>
</body>
</html>