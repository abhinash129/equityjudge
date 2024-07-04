<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html ng-app="myApp">
<head>
<link href="<c:url value="/resources/css/graph.css"/>" rel="stylesheet">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
</head>
<body>
	<!-- Content Wrapper. Contains page content -->
	<div class="wrapper">
		<!-- Content Header (Page header) -->
		<div class="page-header"
			style="margin-top: -5px; margin-left: 20px; margin-bottom: -10px">
			<h3>MARKET-STATS</h3>
		</div>
		<section class="content">
		<h3 style="color: blue; margin-left: 20px; font-weight: bolder;">${Map.Headings}</h3>
		<div class="row">
		<div class="col-sm-9 col-md-9">
			<table class="table table-bordered table-hover">
				<thead>
					<tr>
						<th>Company Name</th>
						<th>Price(Rs.)</th>
						<th>Change (%)</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${Map.GainerORLoser}" var="data">
						<tr>
							<td><a
								href="${pageContext.request.contextPath}/graphpattern/graph/selectCompny?companyName=${data.companyName }"><c:out
										value="${data.companyName}" /></a></td>
							<td><c:out value="${data.closePrice}" /></td>

								<c:if test="${data.percentageVariation <=0}">
								<td style="color: red;">&#9660; <c:out
										value="${data.percentageVariation}%" /></td>
							</c:if>
							<c:if test="${data.percentageVariation >0 }">
								<td style="color: green;">&#9650; <c:out
										value="${data.percentageVariation}%" /></td>
							</c:if>
							

						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<div class="highlightbox col-sm-3 col-md-3">
			<form:form method="POST" name="form"
				action="${pageContext.request.contextPath}/graphpattern/gainerAndLoserdisplay"
				modelAttribute="gainerAndLosserCommand">
				<h1
					style="font-size: 20px; font-weight: bold; margin-top: 5px; text-shadow: 1px 1px 3px rgba(0, 0, 0, 0.3);">MARKET
					STATS</h1>
				<div class="col-md-12">
					<form:select  path="durationRange" class='form-control'>
        <c:forEach items="${variation}" var="var">
            <form:option value="${var.logicalvalue}" label="${var.displayname}">${var.displayname}</form:option>
        </c:forEach>
    </form:select>
				</div>

				<div class="col-md-12" style="margin-top: 10px">
					<form:select  path="priceRange" class='form-control'>
        <c:forEach items="${price}" var="var">
            <form:option value="${var.logicalvalue}" label="${var.displayname}">${var.displayname}</form:option>
        </c:forEach>
    </form:select>
				</div>


				<div class="col-md-9" style="margin-top: 10px">
					<form:select  path="indexRange" class='form-control'>
        <c:forEach items="${indexrange}" var="var">
            <form:option value="${var.logicalvalue}" label="${var.displayname}">${var.displayname}</form:option>
        </c:forEach>
    </form:select>
				</div>
				<div class='col-md-3' style="margin-top: 8px; margin-bottom: 10px">
					<button type="submit" class="btn btn-primary pull-right">GO</button>
				</div>
			</form:form>
		</div>
		</div>
		</section>
	</div>
</body>
</html>
