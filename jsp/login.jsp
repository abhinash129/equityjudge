<%@page import="com.nivesh.command.signup.SignupCommand"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">

<!-- Global site tag (gtag.js) - Google Analytics -->
<script async src="https://www.googletagmanager.com/gtag/js?id=UA-118264010-1"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'UA-118264010-1');
</script>
 
<script type="text/javascript"
	src="<c:url value="/resources/angular/controller/graphController.js"/>"></script>
<script type="text/javascript"
	src="<c:url value="/resources/angular/service/graphService.js"/>"></script>
<script type="text/javascript"
	src="<c:url value="/resources/angular/service/watchlist_Service.js"/>"></script>

<link href="<c:url value="/resources/css/graph.css"/>" rel="stylesheet">
<script src="<c:url value="/resources/js/graph.js" />"></script>

<script type="text/javascript"
	src="<c:url value="/resources/angular/controller/autoCompleteController.js"/>"></script>
<script type="text/javascript"
	src="<c:url value="/resources/angular/service/autoCompleteService.js"/>"></script>


<link href="<c:url value="/resources/dist/autocomplete/jquery-ui.css"/>"
	rel="stylesheet">
<script
	src="<c:url value="/resources/dist/autocomplete/jquery-ui.js" />"></script>
<script type="text/javascript">
	function blinker() {
		$('.blinking').fadeOut(500);
		$('.blinking').fadeIn(500);
	}
	setInterval(blinker, 1000);
</script>


<style type="text/css">
.panel.with-nav-tabs .nav-tabs {
	border-bottom: none;
}

.nv-legend {
	transform: translate(-80px);
}
</style>

</head>
<body ng-app="myApp" ng-controller="GraphController"
	data-ng-init="passCompanyNameMain('${FirstCompny.companyName }','${FirstCompny.companyCode }','${FirstCompny.companyId }')">
	<div class="row" style="background-color: #ECF0F1;"
		ng-controller="AutoCompleteController">
		<div class="col-sm-12 col-md-12"
			style="margin-top: 5px; margin-bottom: -10px; margin-left: -10px"
			align="left">
			<form
				action="${pageContext.request.contextPath}/graphpattern/graph/detailsList"
				method="post" novalidate name="form">
				<div class="form-group col-sm-5 col-md-3">
					<input type="hidden" name="companyName1"
						ng-model="CommancompanyName" required> <input type="text"
						id="automplete-2" name="companyName" placeholder="Search company"
						class="form-control input-sm" ng-model="CommancompanyName"
						ng-change="search2()">
				</div>
				<div class="col-sm-1 col-md-1">
					<button ng-disabled="form.$invalid" type="submit"
						class="btn btn-primary btn-sm">Search</button>
				</div>
			</form>
		</div>
	</div>

	<div class="row" style="margin-top: 0px; margin-bottom: 0px">
		<div class="col-sm-12 col-md-12">
			<marquee scrollamount="8"
				style="margin-top: 0px; font-size: medium;  color: black;">
					<span style="font-size: 16px; color:white; font-size: medium;" class="blinking">
				<sup style="height: 10px; background: green; border: 1px; border-radius: 3px">
						!! Happy New Year 2023 !!</sup></span>
						<span style="font-family: Dekko; font-size: 20px; color: #cc7000; font-weight: bold;">&nbsp;&nbsp;&nbsp; 
				Trust </span>
				<span style="Alegreya;font-size: 22px; color: #d62929;"><b>EQUITYJUDGE</b></span>. 
				<span style="font-family: Dekko; font-size: 20px; color: #cc7000; font-weight: bold;">Computers and algorithm do not</span> 
				<span style="Alegreya;font-size: 22px; color: #d62929; font-weight: bolder;">cheat</span> 
				<span style="font-family: Dekko; font-size: 20px; color: #cc7000; font-weight: bold;"> and do not</span>
				 <span style="Alegreya;font-size: 22px; color: #d62929; font-weight: bolder;">lies......</span>
				&nbsp;&nbsp;  
				${news}
				</marquee>

			<ul id="myCompany">
				<c:forEach items="${LiveBSE }" var="liveBSE">
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

		<div class="col-sm-12 col-md-12" align="center">
			<c:if test="${not empty msg}">
				<!-- <script type="text/javascript">
				alert('${msg }');
			</script> -->
				<p align="center" style="color: red; font-size: x-large;">${msg }</p>
				<p align="center" style="color: green; font-size: x-large;">
					For Subscribe click here... <a
						href="<c:url value="/subscription"/>"><u>Customer Area</u></a>
			</c:if>
			<c:if test="${not empty msgg}">
				<p align="center" style="color: green; font-size: large;">
					<b>${msgg }</b>
				</p>
			</c:if>
			<c:if test="${not empty userUNSuccessResult}">
				<p align="center" style="color: red; font-size: large;">
					<b>${userUNSuccessResult}</b>
				</p>
			</c:if>
		</div>


		<div class="container">
				<div class="col-lg-12">
					<div class="box box-default">
						<div class="box-header with-border">
							<h3 class="box-title"> We are Offer to learn courses on alphalearningschool.com</h3>
						</div>
							</div>
						<div class="box-body">
							<div class="row" align="justify">
								<div class="col-lg-4">
									<h3 align="center" style="font-family: cursive; color: olive;">
										
									</h3><sup class="blinking" style="height: 12px; background: red; border: 2px; border-radius: 8px; color: white; display: inline; opacity: 0.509424;">&nbsp; New &nbsp;</sup>
									<div align="center">
										<img style="width: 1020px; height: 300px" src="<c:url value="/resources/images/ads.png"/>" />
									</div></div>
									<br>
									<p style="color: navy;">
										&nbsp;&nbsp;&nbsp; <i class="fa fa-tag" aria-hidden="true"></i>
										Equityjudge offers to learn e-learnings from alpha.
									</p>
								</div>
							</div>
							</div>
							</div>
							
								
		
							
						<div class="container">			

			<div class="row">
				<h3
					style="color: brown; font-weight: bolder; font-family: sans-serif;">
					<i class="glyphicon glyphicon"></i> Welcome to Equityjudge
				</h3>
			</div>

			<div class="row col-sm-12 col-md-12">

				<p align="justify" style="color: gray; font-size: 15px">
					<i class="glyphicon glyphicon-hand-right"></i>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Equityjudge is a product aimed
					at serving the general investing community who are not expert in
					taking decision with regard to equity investing.The Effort can be
					described as "EQUITY INVESTMENT MADE EASY" in nut shell .The
					investor can arrive at investment decision by using this platform
					which will be well informed , sound and even better than the expert
					advice. The suggestions made on the platform are devoid of
					emotions, sentiments and any element of vested interest.
				</p>
			</div>
			<br>
			<div class="row">
				<div class="col-sm-12 col-md-12">
					<div class="col-sm-6 col-md-8">
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
	   <td>Yuranus Infrastructure Ltd</td>
	   <td>STRONG BUY</td>
	   <td>21-11-2022</td>
	   <td>6.34</td>
	   <td>9.95</td>
	   <td style="color:rgb(0,179,0)"><b>+ 56.94</b></td>
	</tr>
	
	 <tr>
	   <td>Mahindra CIE Automotive Limited</td>
	   <td>BUY</td>
	   <td>22-11-2022</td>
	   <td>290.5</td>
	   <td>426.0</td>
	   <td style="color:rgb(0,179,0)"><b>+ 46.64</b></td>
	</tr>
	

	<tr>
          <td>T D POWER SYSTEMS LTD.</td>
          <td>STRONG BUY</td>
          <td>25-11-2022</td> 
          <td>100.5</td>
          <td>139.95</td>
          <td style="color:rgb(0,179,0)"><b>+  39.25</b></td>
    </tr>

     <tr>
	   <td>PG ELECTROPLAST LTD.</td>
	   <td>BUY</td>
	   <td>21-11-2022</td> 	
	   <td>1001.95</td> 
	   <td>1383.6</td>
	   <td style="color:rgb(0,179,0)"><b>+ 38.09</b></td>
	</tr>

	 <tr>
	   <td>USHA MARTIN LTD.</td>
	   <td>STRONG BUY</td>
	   <td>24-11-2022</td> 	
	   <td>134.75</td> 
	   <td>176.5</td>
	   <td style="color:rgb(0,179,0)"><b>+ 30.98</b></td>
	</tr>


													</tbody>
												</table>
											</div>
									</div>
									</div>

									<div class="item">
										<div class="box-header with-border" align="center">
											<h3 class="box-title">
												<a href="#" style="color: green;"><b>SIX MONTHS
														ALGORITHMIC EFFICACY </b></a> <a class="left carousel-control"
													href="#myCarousel" data-slide="prev"> <span
													class="glyphicon glyphicon-chevron-left"></span> <span
													class="sr-only">Previous</span></a> <a
													class="right carousel-control" href="#myCarousel"
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
	   <td>SOMA TEXTILES INDUSTRIES LTD.</td>
	   <td>STRONG BUY</td>
	   <td>26-08-2022</td>
	   <td>7.1</td>
	   <td>23.42</td>
	   <td style="color:rgb(0,179,0)"><b>+ 229.86</b></td>
	</tr>
	
	 <tr>
	   <td>SHREE PACETRONIX LTD.</td>
	   <td>STRONG BUY</td>
	   <td>25-08-2022</td>
	   <td>43.45</td>
	   <td>103.55</td>
	   <td style="color:rgb(0,179,0)"><b>+ 138.32</b></td>
	</tr>
	

	<tr>
          <td>ENVAIR ELECTRODYNE LTD.</td>
          <td>STRONG BUY</td>
          <td>23-08-2022</td> 
          <td>32.25</td>
          <td>65.5</td>
          <td style="color:rgb(0,179,0)"><b>+ 103.10</b></td>
    </tr>

     <tr>
	   <td>Pressman Advertising Limited</td>
	   <td>BUY</td>
	   <td>26-08-2022</td> 	
	   <td>42.0</td> 
	   <td>68.3</td>
	   <td style="color:rgb(0,179,0)"><b>+ 62.62</b></td>
	</tr>

	 <tr>
	   <td>WPIL LTD.</td>
	   <td>BUY</td>
	   <td>25-08-2022</td> 	
	   <td>1174.1</td> 
	   <td>1889.0</td>
	   <td style="color:rgb(0,179,0)"><b>+ 60.89</b></td>
	</tr>
													</tbody>
												</table>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>


					</div>


					<div class="col-sm-6 col-md-4">

						<div class="box">
							<div class="box-header with-border" align="center">
								<h3 class="box-title"
									style="color: navy; font-weight: bold; margin-top: 0px;"
									align="center">
									<u>Equityjudge Offers</u>
								</h3>
							</div>
							<!-- /.box-header -->
							<div class="box-body" style="min-height: 240px">
								<ul style="font-size: medium; font-weight: bold;" type="square">
									<li>Suggestions generated by algorithms based on pattern
										recognition techniques.</li>
									<li>Estimated success rate of our prediction is 80-100%.</li>
									<li>Records of Portfolio for the subscriber is supported
										up to capital gain calculation.</li>
									<li>Suggestion can be used for buy/sell/hold decision even
										by experts.</li>
									<li>Every day new highlights are generating after market
										hours.</li>
									<li>Suggestion are generated daily on all listed stock.</li>
								</ul>
							</div>
						</div>
					</div>
					<!-- <div class ="col-sm-4 col-md-2-->

				</div>
			</div>


			<div class="row col-sm-12 col-md-12">
				<hr>
				<p align="justify" style="color: gray; font-size: 15px">
					<i class="glyphicon glyphicon-hand-right"></i>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; We believe this platform will
					fill the vital gap in the available options to the investors. It
					operates purely on in-house developed computer algorithms. These
					are predictive algorithms developed on pattern recognition
					techniques.
				</p>
				
				<%-- <marquee scrollamount="15" direction="down" behavior="alternate">
			<marquee scrollamount="15" direction="right">
			<img src="<c:url value="/resources/images/bull.gif"/>"/></marquee>
			</marquee> --%>
			
			<%-- <hr>
				<script async
					src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
				<!-- Below Header -->
				<ins class="adsbygoogle" style="display: block"
					data-ad-client="ca-pub-2771723368908519" data-ad-slot="6802850383"
					data-ad-format="auto"></ins>
				<script>
					(adsbygoogle = window.adsbygoogle || []).push({});
				</script>
				<hr /> --%>
				
				<div class="container">
				<div class="col-lg-12">
					<div class="box box-default">
						<div class="box-header with-border">
							<h3 class="box-title"> We are Offer to learn courses on alphalearningschool.com</h3>
						</div>
							</div>
						<div class="box-body">
							<div class="row" align="justify">
								<div class="col-lg-4">
									<h3 align="center" style="font-family: cursive; color: olive;">
										
									</h3><sup class="blinking" style="height: 12px; background: red; border: 2px; border-radius: 8px; color: white; display: inline; opacity: 0.509424;">&nbsp; New &nbsp;</sup>
									<div align="center">
										<img style="width: 1020px; height: 300px" src="<c:url value="/resources/images/ads.png"/>" />
									</div></div>
									<br>
									<p style="color: navy;">
										&nbsp;&nbsp;&nbsp; <i class="fa fa-tag" aria-hidden="true"></i>
										Equityjudge offers to learn e-learnings from alpha.
									</p>
								</div>
							</div>
							</div>
							</div>
							&nbsp
							&nbsp
							
				

			</div>
			<div class="row">
				<div class="col-sm-12 col-md-12">
					<div class="col-md-6">
						<div class="panel with-nav-tabs panel-default">
							<div class="panel-heading">
								<ul class="nav nav-tabs responsive">
									<li class="active"><a href="#gainer" data-toggle="tab">Top
											Gainer </a></li>
									<li><a href="#loser" data-toggle="tab">Top Loser</a></li>
									<li><a href="#turnover" data-toggle="tab">Top TurnOver</a></li>
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
														value="${Model.Gainer[0].auditDateTime }" />
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
													<c:forEach items="${Model.Gainer}" var="gainer">
														<tr>
															<td><a
																href="${pageContext.request.contextPath}/graphpattern/graph/selectCompnyDemo?companyName=${gainer.companyName }">${gainer.companyName }</a></td>
															<td style="color: black;" align="center">${gainer.current_Value}</td>
															<td style="color: green;" align="center">+${gainer.chang_points}</td>
															<td style="color: green;" align="center">+${gainer.change_per}</td>
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
														value="${Model.Gainer[0].auditDateTime }" /></u>
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
													<c:forEach items="${Model.Loser}" var="loser">
														<tr>
															<td><a
																href="${pageContext.request.contextPath}/graphpattern/graph/selectCompnyDemo?companyName=${loser.companyName }">${loser.companyName }</a></td>
															<td style="color: black;" align="center">${loser.current_Value}</td>
															<td style="color: red;" align="center">${loser.chang_points}</td>
															<td style="color: red;" align="center">${loser.change_per}</td>
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
														value="${Model.Gainer[0].auditDateTime }" /></u>
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
													<c:forEach items="${Model.TurnOver}" var="turnover">
														<tr>
															<td><a
																href="${pageContext.request.contextPath}/graphpattern/graph/selectCompnyDemo?companyName=${turnover.companyName }">${turnover.companyName }</a></td>
															<td style="color: black;" align="center">${turnover.current_Value}</td>
															<td style="color: black;" align="center">${turnover.turnOver}</td>
															<td style="color: black;" align="center">${turnover.volume}</td>
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



				<div class="col-md-6"
						style="border: 2px solid grey; border-radius: 5px; width: 450px; margin-left: 70px">
						<h4 align="center" style="margin-bottom: -15px">
							<i class="fa fa-line-chart fa-3X" aria-hidden="true"></i> MARKET
							INDICES
						</h4>
						<hr>
						<h5 style="margin-bottom: -15px; margin-top: -15px">
							<font color="blue"><a
								href="${pageContext.request.contextPath}/graphpattern/graph/selectCompnyDemo?companyName=${CompnyLiveBO.companyName }">${CompnyLiveBO.companyName}</a></font>
							: ${CompnyLiveBO.current_Value }
							<c:if test="${CompnyLiveBO.chang_points <=0 }">
								<font color="red">[&#9660;${CompnyLiveBO.chang_points }(${CompnyLiveBO.change_per }%)]</font>
							</c:if>
							<c:if test="${CompnyLiveBO.chang_points >0 }">
								<font color="green">[&#9650;${CompnyLiveBO.chang_points }(${CompnyLiveBO.change_per }%)]</font>
							</c:if>
						</h5>
						<hr style="margin-bottom: 0px;">

						<div class="panel panel-default col-sm-12 col-md-12">
							<div class="col-sm-12 col-md-12"
								style="height: 248px; width: 80%;">
								<nvd3 options="options" data="data"
									class="with-3d-shadow with-transitions" />

							</div>
							<div class="col-sm-12 col-md-12">
								<table class="table table-responsive">
									<tr>

										<td style="font-size: 12px;" ng-repeat="option in optionss"><input
											ng-change="changetoma()" ng-disabled="mv" type="checkbox"
											ng-model="option.value">{{option.name}}</td>

										<td>
											<button type="button" ng-click="passCompanyNameMain(-3)"
												class="btn btn-xs">GO</button>
										</td>

									</tr>

								</table>
							</div>
						</div>

					</div>









				</div>
			</div>

		</div>
	</div>
</body>
</html>
