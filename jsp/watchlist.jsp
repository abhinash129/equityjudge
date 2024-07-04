<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html ng-app="myApp">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<style type="text/css">
#main-menu ul {
	margin: -8px auto;
	padding: 0px;
	position: relative;
}
}
</style>

<link href="<c:url value="/resources/dist/autocomplete/jquery-ui.css"/>"
	rel="stylesheet">
<script
	src="<c:url value="/resources/dist/autocomplete/jquery-ui.js" />"></script>
<script type="text/javascript"
	src="<c:url value="/resources/angular/controller/watchlist_Controller.js"/>"></script>
<script type="text/javascript"
	src="<c:url value="/resources/angular/service/watchlist_Service.js"/>"></script>
<link rel="stylesheet"
	href="<c:url value="/resources/css/stickyNotes.css"/>" />

</head>
<body>
	<div class="wrapper">
		<!-- Content Header (Page header) -->
		<!-- Main content -->
		<section class="content" ng-controller="WatchListController">
			<c:if test="${not empty Updationstatus}">
				<div class="row" id="hideMe">
					<div class="col-md-12" align="center">
						<h3 style="color: green;">${Updationstatus}</h3>
					</div>
				</div>
			</c:if>
			<div class="page-header" style="margin-top: -5px; margin-left: 15px;">
				<font size="6px">My Watchlist</font> <font id="ul" size="2px"
					style="font-weight: bold;"> <font id="li">
						<p style="padding-top: 10px; padding-left: 15px">
							<font color="blue"> <a
								href="${pageContext.request.contextPath}/graphpattern/graph/selectCompny?companyName=${BSESensexValue.companyName}">${BSESensexValue.companyName }</a>:
							</font> ${BSESensexValue.current_Value } <small><c:if
									test="${BSESensexValue.chang_points <=0 }">
									<font color="red">[&#9660;${BSESensexValue.chang_points }(${BSESensexValue.change_per }%)]</font>
								</c:if> <c:if test="${BSESensexValue.chang_points >0 }">
									<font color="green">[&#9650;${BSESensexValue.chang_points }(${BSESensexValue.change_per }%)]</font>
								</c:if></small>
						</p>
				</font>
				</font>
			</div>



			<div class="row" ng-show="addWatchlistFlag">
				<div class="box box-default col-md-11 col-sm-12"
					style="background-color: beige;">
					<div class="box-body" style="margin-top: 5px; margin-bottom: -10px">
						<div class="form-group col-sm-4 col-md-3"
							style="margin: 10px -100px 0px 0px">
							<label style="font-style: italic; color: navy; font-size: large;">Search
								Company:</label>
						</div>
						<div class="form-group col-sm-4 col-md-6">
							<input type="text" id="automplete-3" name="companyName"
								placeholder="Enter Company  Name" class="form-controll input-lg"
								ng-model="CommancompanyName" ng-change="search()" /> &nbsp;
						</div>
					</div>
				</div>
			</div>









			<div class="row">

				<div class="box box-default col-md-11">

					<div class="box-header with-border">
						<div class="row">
						<div class="col-md-6">
							<span style="color: green" class="glyphicon glyphicon-stop"></span> Day
							Gainer &nbsp;&nbsp;&nbsp;<span style="color: red" class="glyphicon glyphicon-stop"></span> Day
							Losser
							</div>
							<div class="col-md-6" align="right">
								<button type="button" class="btn btn-success"
									ng-click="addWatchlist()">Add Stock</button>
							</div>
						</div>

					</div>

					<div class="box-body">
						<c:if test="${not empty WatchList }">
							<form:form class="form-horizontal" method="POST">
								<div class="row">


									<div class="col-md-12 table-responsive">
										<table class="table table-bordered">
											<thead>
												<tr>
													<th>Sl.No</th>
													<th width="25%">Company Name</th>
													<th width="9%">Initiated_Date</th>
													<th>Live Price</th>
													<th>Previous ClosePrice</th>
													<th>IntraDay High / Low</th>
													<th>Day Gain / Loss</th>
													<th>Algorithmic Suggestion</th>
													<th width="9%">Detected On</th>
													<th>Delete</th>
												</tr>
											</thead>
											<tbody>

												<c:forEach items="${WatchList}" var="watchlist"
													varStatus="counter">

													<c:if test="${watchlist.change_in_value<0}">
														<tr class="danger">
															<td>${ counter.count}</td>
															<td><a
																href="${pageContext.request.contextPath}/graphpattern/graph/selectCompny?companyName=${watchlist.company_name}"><c:out
																		value="${watchlist.company_name}" /></a></td>
															<td><fmt:formatDate dateStyle="medium"
																	pattern="dd-MM-yyyy"
																	value="${watchlist.initiated_date}" /></td>
															<td><c:out value="${watchlist.liveprice}" /></td>
															<td><c:out value="${watchlist.previous_closeprice}" /></td>
															<td><c:out value="${watchlist.intraday_High}" /> /
																<c:out value="${watchlist.intraday_Low}" /></td>
															<c:if test="${watchlist.change_in_value>=0}">
																<td><c:out value="${watchlist.change_in_value}" /><font
																	color="green">[&#9650;(${watchlist.percentage_Change}%)]</font></td>
															</c:if>
															<c:if test="${watchlist.change_in_value<0}">
																<td><c:out value="${watchlist.change_in_value}" /><font
																	color="red">[&#9660;(${watchlist.percentage_Change}%)]</font></td>
															</c:if>

															<td><c:out value="${watchlist.suggestion}" /></td>

															<td><fmt:formatDate dateStyle="medium"
																	pattern="dd-MM-yyyy"
																	value="${watchlist.suggestion_Date}" /></td>

															<td><a href=""
																ng-click="deleteStock('${watchlist.company_code}')">
																	<img
																	src="<c:url value="/resources/dist/img/delete.png"/>"
																	class="img-responsive" />
															</a></td>
														</tr>
													</c:if>
													<c:if test="${watchlist.change_in_value>=0}">
														<tr class="success">
															<td>${ counter.count}</td>
															<td><a
																href="${pageContext.request.contextPath}/graphpattern/graph/selectCompny?companyName=${watchlist.company_name}"><c:out
																		value="${watchlist.company_name}" /></a></td>
															<td><fmt:formatDate dateStyle="medium"
																	pattern="dd-MM-yyyy"
																	value="${watchlist.initiated_date}" /></td>
															<td><c:out value="${watchlist.liveprice}" /></td>
															<td><c:out value="${watchlist.previous_closeprice}" /></td>
															<td><c:out value="${watchlist.intraday_High}" /> /
																<c:out value="${watchlist.intraday_Low}" /></td>
															<c:if test="${watchlist.change_in_value>=0}">
																<td><c:out value="${watchlist.change_in_value}" /><font
																	color="green">[&#9650;(${watchlist.percentage_Change}%)]</font></td>
															</c:if>
															<c:if test="${watchlist.change_in_value<0}">
																<td><c:out value="${watchlist.change_in_value}" /><font
																	color="red">[&#9660;(${watchlist.percentage_Change}%)]</font></td>
															</c:if>

															<td><c:out value="${watchlist.suggestion}" /></td>

															<td><fmt:formatDate dateStyle="medium"
																	pattern="dd-MM-yyyy"
																	value="${watchlist.suggestion_Date}" /></td>

															<td><a href=""
																ng-click="deleteStock('${watchlist.company_code}')">
																	<img
																	src="<c:url value="/resources/dist/img/delete.png"/>"
																	class="img-responsive" />
															</a></td>
														</tr>
													</c:if>
												</c:forEach>
											</tbody>
										</table>
									</div>
								</div>
							</form:form>
						</c:if>
						<c:if test="${empty WatchList }">
							<div class="box-body" align="center">
								<h3 style="color: blue;">NO RECORD FOUND !!!!</h3>
							</div>
						</c:if>

					</div>
				</div>

			</div>


		</section>
		<!-- /.content -->
	</div>
	<!-- /.content-wrapper -->
</body>
</html>