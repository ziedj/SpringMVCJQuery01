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
			<form method="post" id="testForm" action="ajaxTest">
				<input type="text" name="inputText"> <input type="submit"
					value="AJAX">
			</form>
		</div>
		<div>
			Text envoye :
			<output id="ttt" name="xxx"></output>

		</div>

		<div id="result"></div>

		<script>
			// Attach a submit handler to the form
			$("#testForm").submit(
					function(event) {
						// Stop form from submitting normally
						event.preventDefault();
						// Get some values from elements on the page:
						var $form = $(this), term = $form.find(
								"input[name='inputText']").val(), url = $form
								.attr("action");
						// Send the data using post
						var posting = $.post(url, {
							inputText : term
						});
						// Put the results in a div
						posting.done(function(data) {
							//$("#ttt").value = data;
							document.getElementById("ttt").value = data;
							var htm = '<h1 >send data=' + data + '</h1>';
							//alert( "Data Loaded: " + data );
							$("#result").html(htm);
						});
					});
		</script>
	</div>

	<div>
		<form action="ajaxJsonTest">
			<input type="submit" value="JSON">
		</form>

	</div>

</body>
</html>