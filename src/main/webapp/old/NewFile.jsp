<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="com.library.test.HelloServlet"%>
<!DOCTYPE html>
<% %>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<h1>hi</h1>
	<form action="HelloServlet" method="get" name="hi">
		<input type="text"><br>
		<button>Press</button>
		<div style="margin-left:30px" onclick="location.href='index2.jsp';" class="card 1">
                                <div class="card_image"> <img src="https://i.redd.it/b3esnz5ra34y.jpg" /> </div>
                                <div class="card_title title-white">
                                    <p style="padding-right: 0;">Pay Fine</p>
                                </div>
                            </div>
	</form>
</body>
</html>