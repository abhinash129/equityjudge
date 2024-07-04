<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>
<script type="text/javascript"
	src="<c:url value="/resources/angular/controller/patternReportController.js"/>"></script>

<script type="text/javascript"
	src="<c:url value="/resources/angular/service/patternReportService.js"/>"></script>



<script type="text/javascript"
	src="<c:url value="/resources/angular/controller/graphController.js"/>"></script>
<script type="text/javascript"
	src="<c:url value="/resources/angular/service/graphService.js"/>"></script>

<script type="text/javascript"
	src="<c:url value="/resources/angular/service/watchlist_Service.js"/>"></script>

<script src="<c:url value="/resources/dist/ticker/js/endlessRiver.js"/>"></script>
<link rel="stylesheet"
	href="<c:url value="/resources/dist/ticker/css/endlessRiver.css"/>" />


<link href="<c:url value="/resources/css/graph.css"/>" rel="stylesheet">
<script src="<c:url value="/resources/js/graph.js" />"></script>


<link rel="stylesheet"
	href="<c:url value="/resources/css/stickyNotes.css"/>" />

<style type="text/css">
.panel.with-nav-tabs .nav-tabs {
	border-bottom: none;
}
</style>
</head>
<body ng-app="myApp" ng-controller="GraphController"
	data-ng-init="passCompanyNameMain('${Model.FirstCompny }')">


	<div class="row">
		<div class="col-sm-12 col-md-12">
			<ul id="myCompany">
				<c:forEach items="${Model.LiveBSE }" var="liveBSE">
					<li>&#10148; <font color="blue">${liveBSE.companyName }:</font>
						${liveBSE.current_Value } <small><c:if
								test="${liveBSE.chang_points <=0 }">
								<font color="red">[&#9660;${liveBSE.chang_points }(${liveBSE.change_per }%)]</font>
							</c:if> <c:if test="${liveBSE.chang_points >0 }">
								<font color="green">[&#9650;${liveBSE.chang_points }(${liveBSE.change_per }%)]</font>
							</c:if></small>
					</li>
				</c:forEach>
			</ul>
		</div>
	</div>


	<div class="wrapper">

		<div class="page-header"
			style="margin-top: 10px; margin-left: 20px; margin-bottom: 20px; margin-right: 15px">
			<font size="6px">Dashboard</font> <font id="ul" size="2px"
				style="font-weight: bold;"> <font id="li">
					<p style="padding-top: 10px; padding-left: 15px;">
						<font color="blue"> <a
							href="${pageContext.request.contextPath}/graphpattern/graph/selectCompny?companyName=${Model.BSESensexValue.companyName}">${Model.BSESensexValue.companyName }</a>:

						</font> ${Model.BSESensexValue.current_Value } <small><c:if
								test="${Model.BSESensexValue.chang_points <=0 }">
								<font color="red">[&#9660;${Model.BSESensexValue.chang_points }(${Model.BSESensexValue.change_per }%)]</font>
							</c:if> <c:if test="${Model.BSESensexValue.chang_points >0 }">
								<font color="green">[&#9650;${Model.BSESensexValue.chang_points }(${Model.BSESensexValue.change_per }%)]</font>
							</c:if></small>
					</p>
			</font>
			</font>

		</div>


		<div class="container">


			<c:if test="${not empty Model.successProfileUpdate}">
				<div class="row" id="hideMe">
					<div class="col-sm-12 col-md-12" align="center">
						<h3 style="color: green;">${Model.successProfileUpdate}</h3>
					</div>
				</div>
			</c:if>


			<section class="content">
				<div class="well well-sm">
					<div class="row">
						<div class="col-sm-12 col-md-12">
							<a
								href="${pageContext.request.contextPath}/companydatas/portfoliohome"
								class="small-box-footer pull-right"
								style="margin-top: 0px; margin-bottom: 10px"> Go to
								Portfolio <i class="fa fa-arrow-circle-right"></i>
							</a> <a
								href="${pageContext.request.contextPath}/companydata/companydatasearch"
								class="small-box-footer pull-left"
								style="margin-top: 0px; margin-bottom: 10px"> Add Stock <i
								class="fa fa-plus"></i>
							</a>
						</div>
						<div class="col-sm-4 col-md-2">
							<!-- small box -->
							<div class="small-box bg-gray" style="min-height: 130px">
								<div class="inner" align="center">
									<h4 style="margin-top: 0px">
										My <br>Networth
									</h4>
									<p
										style="color: blue; font-weight: bolder; margin-top: 5px; font-size: large;">
										<c:if test="${not empty networth }">
						${networth} 
										</c:if>
										<c:if test="${empty networth }">
							0 
										</c:if>
										&nbsp; <i class="fa fa-inr"></i>
									</p>
								</div>
							</div>
						</div>




						<div class="col-sm-4 col-md-2">
							<!-- small box -->
							<div class="small-box bg-gray" style="min-height: 130px">
								<div class="inner" align="center">
									<h4 style="margin-top: 0px">
										My <br>Investment
									</h4>
									<p
										style="color: blue; font-weight: bolder; margin-top: 5px; font-size: large;">
										<c:if test="${not empty investment }">
										${investment }
										
										</c:if>
										<c:if test="${empty investment }">
							0
										</c:if>
										&nbsp; <i class="fa fa-inr"></i>
									</p>
								</div>
							</div>
						</div>





						<div class="col-sm-4 col-md-2">
							<!-- small box -->
							<div class="small-box bg-gray" style="min-height: 130px">
								<div class="inner">
									<h4 style="margin-top: 0px" align="center">Overall
										Gain/Loss</h4>

									<p style="font-weight: bolder;">
										<c:if test="${not empty overallGainLoss }">
											<c:if test="${overallGainLoss<0}">
												<font color="red"> ${overallGainLoss }
													[${overallGainLossPer }%]</font>
											</c:if>

											<c:if test="${overallGainLoss>=0}">

												<font color="green"> <c:if
														test="${overallGainLoss==0.0}">
														<p align="center" style="font-weight: bolder;">
															${overallGainLoss } [0%]</p>
													</c:if> <c:if test="${overallGainLoss!=0.0}">
													 +${overallGainLoss }
													[${overallGainLossPer }%]
													</c:if>
												</font>
											</c:if>
										</c:if>
										<c:if test="${empty overallGainLoss }">
											<font color="blue"> 0 </font>
										</c:if>
									</p>
								</div>
							</div>
						</div>


						<div class="col-sm-6 col-md-3">
							<!-- small box -->
							<div class="small-box bg-gray" style="min-height: 130px">
								<div class="inner">
									<h4 style="margin-top: 0px" align="center">Max Gainer</h4>
									<p style="color: green; font-weight: bold;" align="center">${top_gainer_company}
										<i class="fa fa-chevron-circle-up" aria-hidden="true"></i>
									</p>
									<p style="color: green; font-weight: bold;" align="center">
										${top_gainer_company_value}
										<c:if test="${not empty top_gainer_company_variation }">
						[${top_gainer_company_variation}(${top_gainer_company_per}%)]
						</c:if>
									</p>
								</div>
							</div>
						</div>

						<div class="col-sm-6 col-md-3">
							<!-- small box -->
							<div class="small-box bg-gray" style="min-height: 130px">
								<div class="inner">
									<h4 style="margin-top: 0px" align="center">Max Looser</h4>
									<p style="color: red; font-weight: bolder;" align="center">${top_losser_company}
										<i class="fa fa-chevron-circle-down" aria-hidden="true"></i>
									</p>
									<p style="color: red; font-weight: bolder;" align="center">
										${top_losser_company_value}
										<c:if test="${not empty top_losser_company_variation }">
											<font color="red" size="2px" style="font-weight: bold;">[${top_losser_company_variation}(${top_losser_company_per}%)]</font>
										</c:if>
									</p>
								</div>
							</div>
						</div>
					</div>
				</div>


<%--     staring the highlights here     --%>



				 <div class="row">
					<div class="col-sm-12 col-md-12">
					
							<div class="row">
								<p align="justify" style="color: gray; font-size: 15px">
									<i class="glyphicon glyphicon-hand-right"></i> &nbsp;&nbsp;
									Highlights are generated through algorithmic calculations.
								</p>
							</div>

						



					 <div class="panel with-nav-tabs panel-default">
								<div class="panel-heading" align="center">
									<font size="4" style="font-weight: bolder;"
										ng-show="checkDate('${Model.buyList[0].audit_date_time}')">
										Highlights(<fmt:formatDate type="both" dateStyle="medium"
															timeStyle="short" pattern="dd-MM-yyyy"
															value="${Model.buyList[0].audit_date_time}" />) </font> <font size="4" style="font-weight: bolder;"
										ng-hide="checkDate('${Model.buyList[0].audit_date_time}')">
										Highlights<fmt:formatDate type="both" dateStyle="medium"
															timeStyle="short" pattern="dd-MM-yyyy"
															value="${Model.gainerLooserTurnOver.Gainer[0].auditDateTime }" /> </font>
<!-- 															 value="" -->
								</div>
								<div class="panel-heading">
									<ul class="nav nav-tabs responsive">
										<li class="active"><a href="#strongbuy" data-toggle="tab">STRONG
												BUY </a></li>
										<li><a href="#buy" data-toggle="tab">BUY</a></li>
									</ul>
								</div>

								<div class="panel-body" style="min-height: 270px">
									<div class="tab-content">

										<div class="tab-pane fade in active" id="strongbuy">
											<div class="table-responsive clearfix">

												<table class="table table-hover">
													<thead>
														<tr>
															<th><a href="#"><span>CompanyName</span></a></th>
															<th><a href="#"><span>Suggestion</span></a></th>

<th><a href="#" ><span>Current_Price</span></a></th>
															
															
														</tr>
													</thead>
													<tbody>
														<c:forEach items="${Model.strongBuyList }"
															var="dailyHighLight">
															<tr>
																<td><a
																	href="${pageContext.request.contextPath}/graphpattern/graph/selectCompny?companyName=${dailyHighLight.companyName }">${dailyHighLight.companyName }</a></td>
																<td class="text-left"><span
																	class="label label-success">${dailyHighLight.suggestion }
																	<td><a
															href="${pageContext.request.contextPath}/graphpattern/graph/selectCompny?companyName=${latest.companyName }">${latest.companyName }</a></td>
													<td><a href="#"
											ng-click="sortType = 'CLOSE_PRICE'; sortReverse = !sortReverse">
												CURRENT_PRICE <span
												ng-show="sortType == 'CLOSE_PRICE' && !sortReverse"
												class="fa fa-caret-down">{dailyHighLight.current_Value}</span>
												<span
												ng-show="sortType == 'CLOSE_PRICE' && sortReverse"
												class="fa fa-caret-up"></span>
													
																</span></td>

															</tr>
														</c:forEach>
													</tbody>
												</table>
											</div>
										</div>

										<div class="tab-pane fade" id="buy">
											<div class="table-responsive clearfix">
													<h5 align="right"
													style="margin-top: 0px; margin-bottom: -5px; color: gray; font-weight: bold;">
													<u>${Model.Gainer[0].auditDateTime }</u>
												</h5> 
												<table class="table table-hover">
													<thead>
														<tr>
															<th><span>CompanyName</span></th>
															<th style="text-align: start;">Suggestion</th>
															<th> <span>Current_Price</span>
															<!-- <th><span>Variation</span></th>
															<th><span>% Var.</span></th> -->
														</tr>
													</thead>
													<tbody>
														<c:forEach items="${Model.buyList}" var="buyList">
															<tr>
																<td><a
																	href="${pageContext.request.contextPath}/graphpattern/graph/selectCompny?companyName=${buyList.companyName }">${buyList.companyName }</a></td>
																<td class="text-center"><span
																	class="label label-success">${buyList.suggestion}
																	
																	
																</span></td>
																<td><a
															href="${pageContext.request.contextPath}/graphpattern/graph/selectCompny?companyName=${latest.companyName }">${latest.companyName }</a></td>
													<td><a href="#"
											ng-click="sortType = 'CLOSE_PRICE'; sortReverse = !sortReverse">
												CURRENT_PRICE <span
												ng-show="sortType == 'CLOSE_PRICE' && !sortReverse"
												class="fa fa-caret-down">{dailyHighLight.current_Value}</span>
												<span
												ng-show="sortType == 'CLOSE_PRICE' && sortReverse"
												class="fa fa-caret-up"></span>
																
																<!-- <td style="color: green;" align="center">+${gainer.chang_points}</td>
																<td style="color: green;" align="center">+${gainer.change_per}</td> -->
													
													
															</tr>
													
																									
													
													
													
													
														
														</c:forEach>
													</tbody>
												</table>
											</div>

										</div> 


										 



									</div>

								</div>
							</div>

						</div> 



				<%-- 						<div class="col-sm-12 col-md-12">
										<div class="box">
								<div id="myCarousel" class="carousel slide" data-ride="carousel">
									<ol class="carousel-indicators">
										<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
										<li data-target="#myCarousel" data-slide-to="1"></li>
									</ol>
									<div class="carousel-inner">
										<div class="item active">
											<div class="box-header with-border" align="center">
												<h3 class="box-title">
													<a href="#" style="color: green;"><b>THREE MONTHS
															ALGORITHMIC EFFICACY</b> </a> <a class="left carousel-control"
														href="#myCarousel" data-slide="prev"> <span
														class="glyphicon glyphicon-chevron-left"></span> <span
														class="sr-only">Previous</span>
													</a> <a class="right carousel-control" href="#myCarousel"
														data-slide="next"> <span
														class="glyphicon glyphicon-chevron-right"></span> <span
														class="sr-only">Next</span>
													</a>
												</h3>
											</div>
											<div class="box-body">
												<div class="table-responsive">
													<table class="table no-margin">
														<thead>
															<tr>
																<th>Company Name</th>
																<th>Suggestion</th>
																<th>Detected Date</th>
																<th>Detected Price</th>
																<th>Current Price</th>
																<th>%Change</th>
															</tr>
														</thead>
														<tbody>
															 <tr>
	<tr>
	   <td>Deep Diamond India Ltd</td>
	   <td>STRONG BUY</td>
	   <td>19-04-2022</td>
	   <td>17.19</td>
	   <td>49.95</td>
	   <td style="color:rgb(0,179,0)"><b>+ 190.58</b></td>
	</tr>
	
	 <tr>
	   <td>KAPASHI COMMERCIALS LTD</td>
	   <td>STRONG BUY</td>
	   <td>20-04-2022</td>
	   <td>64.25</td>
	   <td>132.05</td>
	   <td style="color:rgb(0,179,0)"><b>+ 105.53</b></td>
	</tr>
	

	<tr>
          <td>SYSCHEM (INDIA) LTD</td>
          <td>BUY</td>
          <td>26-04-2022</td> 
          <td>14.39</td>
          <td>27.65 </td>
          <td style="color:rgb(0,179,0)"><b>+  92.15</b></td>
    </tr>

     <tr>
	   <td>MARATHON NEXTGEN REALTY LTD</td>
	   <td>BUY</td>
	   <td>20-04-2022</td> 	
	   <td>122.4</td> 
	   <td>231.7</td>
	   <td style="color:rgb(0,179,0)"><b>+ 89.30</b></td>
	</tr>

	 <tr>
	   <td>Kirloskar Electric Company Ltd</td>
	   <td>BUY</td>
	   <td>25-04-2022</td> 	
	   <td>28.25</td> 
	   <td>39.7</td>
	   <td style="color:rgb(0,179,0)"><b>+ 40.53</b></td>
	</tr>

	   
														</tbody>
													</table>
												</div>
											</div>
										</div>   --%>

						<div class="col-sm-12 col-md-6">
							<div class="row">
								<p align="justify" style="color: gray; font-size: 15px">
									<i class="glyphicon glyphicon-hand-right"></i> &nbsp;&nbsp;
									Newly Listed Stocks in BSE.
								</p>
							</div>
							<div class="box">
								<div class="box-header with-border" align="center">
									<h3 class="box-title">Recently Joined Stocks</h3>
								</div>
								<!-- /.box-header -->
								<div class="box-body">
									<div class="table-responsive">
										<table class="table no-margin">
											<thead>
												<tr height="10px">
													<th><a href="#"><span>CompanyName</span></a></th>
													<th><a href="#" class="desc"><span> Quoted
																Date</span></a></th>
													<th><a href="#" class="desc"><span> Current
																Price </span></a></th>
												</tr>
											</thead>
											<tbody>
												<c:forEach items="${Model.newlyaddedcompanylist}"
													var="latest">

													<tr height="50px">
														<td><a
															href="${pageContext.request.contextPath}/graphpattern/graph/selectCompny?companyName=${latest.companyName }">${latest.companyName }</a></td>
														<td style="color: black;" align="center"><fmt:formatDate
																type="date" pattern="dd-MM-yyyy"
																value="${latest.auditDateTime}" /></td>
														<td style="color: black;" align="center">${latest.current_Value}</td>

													</tr>
												</c:forEach>
											</tbody>
										</table>
									</div>
									<!-- /.table-responsive -->
								</div>
								<!-- /.box-body -->
							</div>

						</div>
					</div>
				</div>



				<div class="row">
					<div class="col-sm-12 col-md-12">

						<div class="col-md-10 col-md-offset-1">
							<div class="row">
								<p align="justify" style="color: gray; font-size: 15px">
									<i class="glyphicon glyphicon-hand-right"></i> &nbsp;&nbsp;
									Today's Market movement.
								</p>
							</div>
							<div class="panel with-nav-tabs panel-default">
								<div class="panel-heading">
									<ul class="nav nav-tabs responsive">
										<li class="active"><a href="#gainer" data-toggle="tab">Top
												Gainer </a></li>
										<li><a href="#loser" data-toggle="tab">Top Loser</a></li>
										<li><a href="#turnover" data-toggle="tab">Top
												TurnOver</a></li>
									</ul>
								</div>

								<div class="panel-body">
									<div class="tab-content">
										<div class="tab-pane fade in active" id="gainer">
											<div class="table-responsive clearfix">
												<h5 align="right"
													style="margin-top: 0px; margin-bottom: -5px; color: gray; font-weight: bold;">
													<u> <fmt:formatDate type="both" dateStyle="medium"
															timeStyle="short" pattern="dd-MM-yyyy hh:mm a"
															value="${Model.gainerLooserTurnOver.Gainer[0].auditDateTime }" />
													</u>
												</h5>
												<table class="table table-hover">
													<thead>
														<tr>
															<th><span>CompanyName</span></th>
															<th><span>Price</span></th>
															<th><span>Variation</span></th>
															<th><span>% Var.</span></th>
														</tr>
													</thead>
													<tbody>
														<c:forEach items="${Model.gainerLooserTurnOver.Gainer}"
															var="gainer">
															<tr>
																<td><a
																	href="${pageContext.request.contextPath}/graphpattern/graph/selectCompny?companyName=${gainer.companyName }">${gainer.companyName }</a></td>
																<td style="color: black;" align="left">${gainer.current_Value}</td>
																<td style="color: green;" align="left">+${gainer.chang_points}</td>
																<td style="color: green;" align="left">+${gainer.change_per}</td>
															</tr>
														</c:forEach>
													</tbody>
												</table>
											</div>
										</div>

										<div class="tab-pane fade" id="loser">
											<div class="table-responsive clearfix">
												<h5 align="right"
													style="margin-top: 0px; margin-bottom: -5px; color: gray; font-weight: bold;">
													<u><fmt:formatDate type="both" dateStyle="medium"
															timeStyle="short" pattern="dd-MM-yyyy hh:mm a"
															value="${Model.gainerLooserTurnOver.Gainer[0].auditDateTime }" /></u>
												</h5>
												<table class="table table-hover">
													<thead>
														<tr>
															<th><span>CompanyName</span></th>
															<th><span>Price</span></th>
															<th><span>Variation</span></th>
															<th><span>% Var.</span></th>
														</tr>
													</thead>
													<tbody>
														<c:forEach items="${Model.gainerLooserTurnOver.Loser}"
															var="loser">
															<tr>
																<td><a
																	href="${pageContext.request.contextPath}/graphpattern/graph/selectCompny?companyName=${loser.companyName }">${loser.companyName }</a></td>
																<td style="color: black;" align="left">${loser.current_Value}</td>
																<td style="color: red;" align="left">${loser.chang_points}</td>
																<td style="color: red;" align="left">${loser.change_per}</td>
															</tr>
														</c:forEach>
													</tbody>
												</table>
											</div>
										</div>

										<div class="tab-pane fade" id="turnover">
											<div class="table-responsive clearfix">
												<h5 align="right"
													style="margin-top: 0px; margin-bottom: -5px; color: gray; font-weight: bold;">
													<u><fmt:formatDate type="both" dateStyle="medium"
															timeStyle="short" pattern="dd-MM-yyyy hh:mm a"
															value="${Model.gainerLooserTurnOver.Gainer[0].auditDateTime }" /></u>
												</h5>
												<table class="table table-hover">
													<thead>
														<tr>
															<th><span>CompanyName</span></th>
															<th><span>Price</span></th>
															<th><span>TurnOver(Cr.)</span></th>
															<th><span>Volume</span></th>
														</tr>
													</thead>
													<tbody>
														<c:forEach items="${Model.gainerLooserTurnOver.TurnOver}"
															var="turnover">
															<tr>
																<td><a
																	href="${pageContext.request.contextPath}/graphpattern/graph/selectCompny?companyName=${turnover.companyName }">${turnover.companyName }</a></td>
																<td style="color: black;" align="left">${turnover.current_Value}</td>
																<td style="color: black;" align="left">${turnover.turnOver}</td>
																<td style="color: black;" align="left">${turnover.volume}</td>
															</tr>
														</c:forEach>
													</tbody>
												</table>
											</div>
										</div>

									</div>
								</div>
							</div>
						</div>






					</div>
				</div>



			</section>

		</div>
		<!-- /.container -->

	</div>
	<!-- /.wrapper -->
</body>
</html>