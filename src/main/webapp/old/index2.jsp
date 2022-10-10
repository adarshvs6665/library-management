<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.library.test.HelloServlet"%>
<!DOCTYPE html>
<html>

	<head>
	<meta charset="UTF-8">
	<title>Client Details</title>
	<link href="css/form.css" rel="stylesheet" type="text/css">
	<script src="js/validation.js"></script>
	<style>
	.zf-templateWrapper {
		height : 600px;
	}
	.zf-medium {
		font-size : 35px;
	}
	</style>
	
	</head>

<body class="zf-backgroundBg">
	<!-- Change or deletion of the name attributes in the input tag will lead to empty values on record submission-->
	<div class="zf-templateWidth">
		<form action='HelloServlet' name='form' method='POST' id='form'>

			<input type="hidden" name="zf_referrer_name" value=""> <input
				type="hidden" name="zf_redirect_url" value=""> <input
				type="hidden" name="zc_gad" value="">

			<div class="zf-templateWrapper">

				<ul class="zf-tempHeadBdr">
					<li class="zf-tempHeadContBdr">
						<h2 class="zf-frmTitle">
							<em>Client Details</em>
						</h2>
						<p class="zf-frmDesc">Enter the details of all incoming
							clients.</p>
						<div class="zf-clearBoth"></div>
					</li>
				</ul>

				<div class="zf-subContWrap zf-leftAlign">
					<ul>
						<!---------Single Line Starts Here---------->
						
<br><br><br>
							<li class="zf-tempFrmWrapper zf-medium"><h1><a>Librarian</a></h1></li>
							<li class="zf-tempFrmWrapper zf-medium"><h1><a>Student</a></h1></li>
							<li class="zf-tempFrmWrapper zf-medium"><h1><a>Admin</a></h1></li>
						


						<!---------Multiple Line Ends Here---------->
					</ul>
				</div>
				<!---------template Container Starts Here---------->
				<ul>
					<!-- 
					<li class="zf-fmFooter"><button class="zf-submitColor">Submit</button></li>
					
					 -->
					 
				</ul>
			</div>

		</form>
	</div>
	<script type="text/javascript">
		var zf_DateRegex = new RegExp(
				"^(([0][1-9])|([1-2][0-9])|([3][0-1]))[-](Jan|Feb|Mar|Apr|May|Jun|Jul|Aug|Sep|Oct|Nov|Dec|JAN|FEB|MAR|APR|MAY|JUN|JUL|AUG|SEP|OCT|NOV|DEC)[-](?:(?:19|20)[0-9]{2})$");
		var zf_MandArray = [ "SingleLine", "SingleLine1", "Dropdown", "Radio",
				"Address_AddressLine1", "Address_AddressLine2", "Address_City",
				"Address_Region", "Address_ZipCode", "Address_Country",
				"Website", "Number", "Number1", "Date" ];
		var zf_FieldArray = [ "SingleLine", "SingleLine1", "SingleLine2",
				"Dropdown", "Radio", "Email", "PhoneNumber_countrycode",
				"Address_AddressLine1", "Address_AddressLine2", "Address_City",
				"Address_Region", "Address_ZipCode", "Address_Country",
				"Website", "FileUpload", "Number", "Number1", "Date",
				"MultiLine" ];
		var isSalesIQIntegrationEnabled = false;
		var salesIQFieldsArray = [];
	</script>
</body>

</html>