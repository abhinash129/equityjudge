<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html ng-app="myApp">
<head>
<script type="text/javascript"
	src="<c:url value="/resources/angular/controller/portfolio_controller.js"/>"></script>
<script type="text/javascript"
	src="<c:url value="/resources/angular/service/portfolio_service.js"/>"></script>

<style>

	
table, th, td {
	border: 1px solid red;
	border-collapse: collapse;
}

th, td {
	padding: 5px;
}
</style>

</head>
<body ng-controller="PortfolioController">
	<div class="wrapper">
		<div class="page-header"
			style="margin-top: -5px; margin-left: 20px; margin-bottom: -10px">
			<h3>My Portfolio History</h3>
		</div>
			<div class="col-sm-12 col-md-12 col-md-offset-10 col-sm-offset-8" style="margin-top: -25px">
			<ul class="nav nav-pills">
				<li role="presentation" class="active"><a href="<c:url value="/companydatas/portfoliohome"/>"> <i
						class="fa fa-reply" aria-hidden="true"></i> Go to MyPortfolio
				</a></li>
			</ul>
		</div>
		<!-- Main content -->
		<div class="content">


			<c:if test="${not empty sell_data }">
				<div class="box box-default">
					<div class="box-header with-border">
						<h3 class="box-title">Capital Gain & Loss</h3>
					</div>
					<div class="box-body table-responsive">
						<table class="table table-bordered">
							<thead>
								<tr style="background-color: #f0ecec;">
									<th>Short Term Capital Gain</th>
									<th>Short Term Capital Loss</th>
									<th>Long Term Capital Gain</th>
									<th>Long Term Capital Loss</th>

								</tr>
							</thead>
							<tbody>

								<c:forEach items="${capital}" var="data">

									<tr style="font-size: medium; color: navy; font-weight: bold;">
										<td class="success"><c:out
												value="${data.capitalshortterm_gain}" /></td>
										<td class="danger"><c:out
												value="${data.capitalshortterm_loss}" /></td>
										<td class="success"><c:out
												value="${data.capitallongterm_gain}" /></td>
										<td class="danger"><c:out
												value="${data.capitallongterm_loss}" /></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
				
				
				<c:forEach items="${sell_data }" var="data">
					<c:if test="${data.long_short_term == 'SHORT'}">
					<font ng-init="shortTermdataAvlbl()"></font>
					</c:if>
					
					<c:if test="${data.long_short_term == 'LONG'}">
					<font ng-init="longTermdataAvlbl()"></font>
					</c:if>
				</c:forEach>
				
				
				
				<div class="box box-default" ng-show="shortterm">
					<div class="box-header with-border">
						<h3 class="box-title">Short Term Sell</h3>
					</div>
					<div class="box-body table-responsive">
						<table class="table table-bordered">
							<thead>
								<tr style="background-color: #f0ecec;">
									<th>Company name</th>
									<th>Acquisition date</th>
									<th>Acquisition cost</th>
									<th>Sell Date</th>
									<th>Sell Value</th>
									<th>No of share</th>
									<th>Gain/Loss</th>
								</tr>
							</thead>
							<tbody>
								<c:set var="countShort" value="0" scope="page" />
								<c:forEach items="${sell_data }" var="data">
									<c:if test="${data.long_short_term == 'SHORT'}">
										<c:set var="countShort" value="${countShort+data.profit}"
											scope="page" ></c:set>
										<c:if test="${data.profit < 0 }">
											<tr class="danger">
												<td><c:out value="${data.company_name}" /></td>
												<td>
												<fmt:formatDate type="both" dateStyle="medium" pattern="dd-MM-yyyy" value="${data.acquisition_date}"/>
												</td>
												<td><c:out value="${data.acquisition_cost}" /></td>
												<td><fmt:formatDate type="both" dateStyle="medium" pattern="dd-MM-yyyy" value="${data.sell_date}"/></td>
												<td><c:out value="${data.sell_price}" /></td>
												<td><c:out value="${data.quantity}" /></td>
												<td><c:out value="${data.profit}" /></td>
											</tr>
										</c:if>
										<c:if test="${data.profit >= 0 }">
											<tr>
												<td><c:out value="${data.company_name}" /></td>
												<td><fmt:formatDate type="both" dateStyle="medium" pattern="dd-MM-yyyy" value="${data.acquisition_date}"/></td>
												<td><c:out value="${data.acquisition_cost}" /></td>
												<td><fmt:formatDate type="both" dateStyle="medium" pattern="dd-MM-yyyy" value="${data.sell_date}"/></td>
												<td><c:out value="${data.sell_price}" /></td>
												<td><c:out value="${data.quantity}" /></td>
												<td><c:out value="${data.profit}" /></td>
											</tr>
										</c:if>
									</c:if>

								</c:forEach>
								<tr align="right"
									style="font-size: medium; color: navy; font-weight: bold;">
									<td colspan="6">Short Term Total</td>
									<td>
									<fmt:formatNumber type="number" 
            maxFractionDigits="2" value="${countShort}" />
								</td>
								</tr>

							</tbody>

						</table>
					</div>
				</div>


				<div class="box box-default" ng-show="longterm">
					<div class="box-header with-border">
						<h3 class="box-title">Long Term Sell</h3>
					</div>
					<div class="box-body">
						<table class="table table-bordered table-hover">
							<thead>
								<tr style="background-color: #f0ecec;">
									<th>Company name</th>
									<th>Acquisition date</th>
									<th>Acquisition cost</th>
									<th>Sell Date</th>
									<th>Sell Value</th>
									<th>No of share</th>
									<th>Gain/Loss</th>
								</tr>
							</thead>
							<tbody>
								<c:set var="countLong" value="0" scope="page" />
								<c:forEach items="${sell_data }" var="data">
									<c:if test="${data.long_short_term == 'LONG'}">
										<c:set var="countLong" value="${countLong +data.profit}"
											scope="page" />
										<c:if test="${data.profit < 0}">
											<tr class="danger">
												<td><c:out value="${data.company_name}" /></td>
												<td><fmt:formatDate type="both" dateStyle="medium" pattern="dd-MM-yyyy" value="${data.acquisition_date}"/></td>
												<td><c:out value="${data.acquisition_cost}" /></td>
												<td><fmt:formatDate type="both" dateStyle="medium" pattern="dd-MM-yyyy" value="${data.sell_date}"/></td>
												<td><c:out value="${data.sell_price}" /></td>
												<td><c:out value="${data.quantity}" /></td>
												<td><c:out value="${data.profit}" /></td>
											</tr>
										</c:if>
										<c:if test="${data.profit >= 0}">
											<tr>
												<td><c:out value="${data.company_name}" /></td>
												<td><fmt:formatDate type="both" dateStyle="medium" pattern="dd-MM-yyyy" value="${data.acquisition_date}"/></td>
												<td><c:out value="${data.acquisition_cost}" /></td>
												<td><fmt:formatDate type="both" dateStyle="medium" pattern="dd-MM-yyyy" value="${data.sell_date}"/></td>
												<td><c:out value="${data.sell_price}" /></td>
												<td><c:out value="${data.quantity}" /></td>
												<td><c:out value="${data.profit}" /></td>
											</tr>
										</c:if>

									</c:if>

								</c:forEach>
								<tr align="right"
									style="font-size: medium; color: navy; font-weight: bold;">
									<td colspan="6">Long Term Total</td>
									<td>
									<fmt:formatNumber type="number" 
            maxFractionDigits="2" value="${countLong}" />

								</tr>

							</tbody>

						</table>
					</div>
				</div>


			</c:if>
			<c:if test="${empty sell_data }">
				<div class="box box-default">
					<div class="box-header with-border">
						<div class="box-body" align="center">
							<h3 style="color: blue;">No Sell History Found !!!!</h3>
						</div>
					</div>
				</div>
			</c:if>

		</div>


		<!-- /.box-body -->

		<!-- /.box -->
	</div>

	<!-- <div class="row"><div class="col-sm-5">
<div class="dataTables_info" id="example2_info" role="status" aria-live="polite">Showing 1 to 10 of 57 entries</div></div>
<div class="col-sm-7">
<div class="dataTables_paginate paging_simple_numbers" id="example2_paginate" style="margin-top:0px;"><ul class="pagination"><li class="paginate_button previous disabled" id="example2_previous" ><a href="#" aria-controls="example2" data-dt-idx="0" tabindex="0">Previous</a></li><li class="paginate_button active"><a href="#" aria-controls="example2" data-dt-idx="1" tabindex="0">1</a></li><li class="paginate_button "><a href="#" aria-controls="example2" data-dt-idx="2" tabindex="0">2</a></li><li class="paginate_button "><a href="#" aria-controls="example2" data-dt-idx="3" tabindex="0">3</a></li><li class="paginate_button "><a href="#" aria-controls="example2" data-dt-idx="4" tabindex="0">4</a></li><li class="paginate_button "><a href="#" aria-controls="example2" data-dt-idx="5" tabindex="0">5</a></li><li class="paginate_button "><a href="#" aria-controls="example2" data-dt-idx="6" tabindex="0">6</a></li><li class="paginate_button next" id="example2_next"><a href="#" aria-controls="example2" data-dt-idx="7" tabindex="0">Next</a></li></ul></div></div>
</div>              
   -->
	<!-- /.content -->
	</div>
	<!-- /.content-wrapper -->
</body>
</html>