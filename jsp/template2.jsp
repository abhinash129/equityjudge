<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ include file="headerincludescript.jsp"%>
<html>
<head>
<style type="text/css">
html {
	height: 100%;
}

body {
	height: 100%;
	position: relative;
}

#footer {
	height: 50px;
	width: 100%;
	bottom: 0px;
	left: 0px;
	background: #B5EAFE;
	position: relative;
}
</style>
</head>
<body>
	<tiles:insertAttribute name="header2" />
	<tiles:insertAttribute name="body" />
	<div id="footer">
		<tiles:insertAttribute name="footer" />
	</div>


</body>
</html>
