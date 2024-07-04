<!DOCTYPE html>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>

<head>
<meta charset="utf-8">
<title>Equityjudge</title>

<link rel="stylesheet"
	href="<c:url value="/resources/header/css/font-awesome.min.css"/>"
	type="text/css" media="all" />

<link href="<c:url value="/resources/css/bootstrap.min.css"/>"
	rel="stylesheet" type="text/css" />
	
	
<style>
.wrapper-page {
	width: 100% px;
	margin: 7.5% auto;
}

/* 17.5 Error-pages */
.ex-page-content h1 {
	font-size: 68px;
	line-height: 150px;
	font-weight: 700;
	color: red;
	text-shadow: rgba(61, 61, 61, 0.3) 1px 1px, rgba(61, 61, 61, 0.2) 2px
		2px, rgba(61, 61, 61, 0.3) 3px 3px;
}

body {
	background: #f5f5f5;
	margin: 0;
	-webkit-text-size-adjust: 100%;
	font-family: 'Nunito', sans-serif;
}
</style>

</head>
<body>


	<div class="wrapper-page">
		<div class="ex-page-content text-center">
			<h1>OOPS !!!</h1>
			<h2 class="font-light">Something Went Wrong Please try after some time..</h2>
			<br>
			<p>
				Why not try refreshing your page? or you can contact us here <a
					href="<c:url value="/contact_us"/>">contact us</a>
			</p>

			<a class="btn btn-primary waves-effect waves-light"
				href="<c:url value="/login_home"/>"><i class="fa 
fa-home"></i>
				Go Home</a>
		</div>

	</div>


</body>
</html>