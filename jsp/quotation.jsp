<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html ng-app="myApp">
<head>
<style>
.myButton {
	-moz-box-shadow:inset 0px 1px 0px 0px #bbdaf7;
	-webkit-box-shadow:inset 0px 1px 0px 0px #bbdaf7;
	box-shadow:inset 0px 1px 0px 0px #bbdaf7;
	background:-webkit-gradient(linear, left top, left bottom, color-stop(0.05, #79bbff), color-stop(1, #378de5));
	background:-moz-linear-gradient(top, #79bbff 5%, #378de5 100%);
	background:-webkit-linear-gradient(top, #79bbff 5%, #378de5 100%);
	background:-o-linear-gradient(top, #79bbff 5%, #378de5 100%);
	background:-ms-linear-gradient(top, #79bbff 5%, #378de5 100%);
	background:linear-gradient(to bottom, #79bbff 5%, #378de5 100%);
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#79bbff', endColorstr='#378de5',GradientType=0);
	background-color:#79bbff;
	-moz-border-radius:6px;
	-webkit-border-radius:6px;
	border-radius:6px;
	border:1px solid #84bbf3;
	display:inline-block;
	cursor:pointer;
	color:#ffffff;
	font-family:Arial;
	font-size:15px;
	font-weight:bold;
	padding:6px 24px;
	text-decoration:none;
	text-shadow:0px 1px 0px #528ecc;
}
.myButton:hover {
	background:-webkit-gradient(linear, left top, left bottom, color-stop(0.05, #378de5), color-stop(1, #79bbff));
	background:-moz-linear-gradient(top, #378de5 5%, #79bbff 100%);
	background:-webkit-linear-gradient(top, #378de5 5%, #79bbff 100%);
	background:-o-linear-gradient(top, #378de5 5%, #79bbff 100%);
	background:-ms-linear-gradient(top, #378de5 5%, #79bbff 100%);
	background:linear-gradient(to bottom, #378de5 5%, #79bbff 100%);
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#378de5', endColorstr='#79bbff',GradientType=0);
	background-color:#378de5;
}
.myButton:active {
	position:relative;
	top:1px;
}
textarea.comment{
border: 2px solid #765942;
	border-radius: 10px;
	height: 60px;
	width: auto;
}

</style>
<script type="text/javascript"
	src="<c:url value="/resources/angular/controller/quotationController.js"/>"></script>
<script type="text/javascript"
	src="<c:url value="/resources/angular/service/graphService.js"/>"></script>
<script type="text/javascript"
	src="<c:url value="/resources/angular/service/watchlist_Service.js"/>"></script>
<style type="text/css">
.nv-legend {
	transform: translate(-150px, 370px);
}

.datepicker {
	z-index: 1151 !important;
}
</style>

<script src="<c:url value="/resources/dist/ticker/js/endlessRiver.js"/>"></script>
<link rel="stylesheet"
	href="<c:url value="/resources/dist/ticker/css/endlessRiver.css"/>" />
<link href="<c:url value="/resources/css/graph.css"/>" rel="stylesheet">
<script src="<c:url value="/resources/js/graph.js" />"></script>

<script type="text/javascript">
	function showhide(id) {
		var e = document.getElementById(id);
		e.style.display = (e.style.display == 'block') ? 'none' : 'block';
	}
	
	function validateComment() {
		  var x = document.commentform.comment.value;

		  if ((x.charAt(0)==' '&&x.charAt(1)==' ')&&x.charAt(2)==' ') {
		    alert('input valid comments');
		    return false;
		  }
		  else{
			  return true;
		  }
		}
</script>
<link rel="stylesheet"
	href="<c:url value="/resources/css/stickyNotes.css"/>" />

</head>
<body ng-controller="QuotationController"
	data-ng-init="passCompanyName('${FirstCompny.companyName }','${FirstCompny.companyCode }','${FirstCompny.companyId }')">

	<div>
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

	<div class="wrapper">
		<div class="page-header"
			style="margin-top: 10px; margin-left: 20px; margin-bottom: 20px; margin-right: 15px">
			<font size="6px">Quotation on 31-Jan-2018</font> <font id="ul" size="2px"
				style="font-weight: bold;"> <font id="li">
					<p style="padding-top: 10px; padding-left: 15px;">
						<font color="blue"> <a
							href="${pageContext.request.contextPath}/graphpattern/graph/selectCompny11?companyName=${BSESensexValue.companyName}">${BSESensexValue.companyName }</a>:
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

		<div class="row">
			<div class="col-sm-12 col-md-12">

				<div class="col-sm-12 col-md-12">

					<div class="row">
						<div id="sticky_navigation_wrapper" style="margin-bottom: 10px">
							<div class="demo_container" id="sticky_navigation">
								<div class="col-sm-12 col-md-12" style="margin-top: 7px">
									<div class="col-sm-12 col-md-12">
										<form
											action="${pageContext.request.contextPath}/graphpattern/graph/details11"
											method="post" name="searchform">
											<div class="col-sm-11 col-md-8" style="margin-bottom: 10px">
												<input type="hidden" name="companyName1"
													ng-model="companyName" required>
												<input type="text" id="automplete-1" name="companyName"
													placeholder="Search company" class="form-control"
													ng-keydown="checkKeyDown($event)"
													ng-keyup="checkKeyUp($event)" ng-model="companyName"
													ng-change="search()" required>
											</div>
											<div class="col-sm-1 col-md-1" style="margin-left: -25px;">
												<button type="submit" ng-disabled="searchform.$invalid"
													class="btn btn-primary">GO</button>
											</div>
										</form>
									</div>

									<!-- <div class="col-sm-7 col-md-5 pull-right">
										<div class="col-sm-6 col-md-6 pull-right">
											<button type="button" class="btn btn-info dropdown-toggle"
												ng-click="addWatchList(labelName,sc_code)"
												ng-disabled="bseflag">Add to watchlist</button>
										</div>
										<div class="col-sm-6 col-md-6 pull-right">
											<button type="submit" class="btn btn-info dropdown-toggle"
												href="#emailChange" data-toggle="modal"
												ng-disabled="bseflag">Add to MyPortfolio</button>
										</div>
									</div> -->
								</div>
							  </div>
						</div>
					</div>

				<c:if test='${FirstCompny.companyName!="BSE SENSEX"}'>
				
				
					<div class="row">
						<div class="col-sm-12 col-md-12">
							<div class="box">
								<div class="box-header">
									<!-- for suggestion url -->
									<h3>
										<a href="#"
											style="text-decoration: none; color: red; font-weight: bolder; font-size: 75%;">{{labelName}} </a>
										<font size="2px" style="font-weight: bold;" ng-hide="load">{{sc_id}}</font>
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <img ng-show="load"
											src="<c:url value="/resources/images/load1.gif"/>">
											<button  onclick="document.commentform.comment.focus();" class="myButton">
											<b>Your comments</b></button>
									</h3>
								</div>
								<div class="box-body">
									<div class="panel panel-default col-sm-12 col-md-12">
									 <div class="table-responsive" ng-hide="nodata">
												<table class="table table-striped table-bordered table-hover">
													<tbody align="center" style="font-size: medium;"
														ng-show="others">
														<tr>
														 <td>Current Price (Rs.)
																<span style="font-weight: bold; font-size:medium;color:blue;">{{ClosePrice}}</span>
															</td>
														</tr>
													</tbody>
												</table>
										</div>
									
									</div>
								</div>

								<div class="box-body">

									<div class="panel panel-default col-sm-12 col-md-12">
										<div class="panel-heading">
											BSE Quotes
											<div class="pull-right">
												<span style="font-weight: bold; font-size: large;color:red;">31- Jan - 2018 </span>
											</div>
										</div>
										<div class="panel-body">
											<div class="table-responsive" ng-hide="nodata">
												<table
													class="table table-striped table-bordered table-hover">
													<tbody align="center" style="font-size: medium;"
														ng-show="others">
														<tr>
															<!-- <td>Current Price (Rs.)
																<p style="font-weight: bold; font-size: large;">{{ClosePrice}}</p>
															</td> -->
															<td>Open (Rs.)
																<p style="font-weight: bold; font-size: large;"> ${quotationData.open_price}</p>
															</td>
															<td>High (Rs.)
																<p style="font-weight: bold; font-size: large;">${quotationData.high_price}</p>
															</td>
															<td>Low (Rs.)
																<p style="font-weight: bold; font-size: large;">  ${quotationData.low_price}</p>
															</td>
															<td>Close (Rs.)
																<p style="font-weight: bold; font-size: large;">  ${quotationData.close_price}</p>
															</td>
														</tr>
														<%-- <tr>
															<td>% Change
																<p
																	style="color: green; font-weight: bold; font-size: large;"
																	ng-show="positive">
																	<img src="<c:url value="/resources/images/up.png"/>">&nbsp;&nbsp;&nbsp;&nbsp;{{Variation}}
																</p>
																<p
																	style="color: red; font-weight: bold; font-size: large;"
																	ng-show="nagative">
																	<img src="<c:url value="/resources/images/down.png"/>">&nbsp;&nbsp;&nbsp;&nbsp;{{Variation}}
																</p>
															</td>
															<td>Volume
																<p style="font-weight: bold; font-size: large;">{{Volume}}</p>
															</td>
															<td>Value (Rs.)
																<p style="font-weight: bold; font-size: large;">{{Value}}</p>
															</td>
															<td>52Week H/L
																<p style="font-weight: bold; font-size: large;">{{High}}/{{Low}}</p>
															</td>
														</tr> --%>
													</tbody>
													<%-- <tbody align="center" style="font-size: medium;"
														ng-show="BSE">
														<tr>
															<td>Price (Rs.)
																<p style="font-weight: bold; font-size: large;">{{ClosePrice}}</p>
															</td>
															<td>% Change
																<p
																	style="color: green; font-weight: bold; font-size: large;"
																	ng-show="positive">
																	<img src="<c:url value="/resources/images/up.png"/>">&nbsp;&nbsp;&nbsp;&nbsp;{{Variation}}
																</p>
																<p
																	style="color: red; font-weight: bold; font-size: large;"
																	ng-show="nagative">
																	<img src="<c:url value="/resources/images/down.png"/>">&nbsp;&nbsp;&nbsp;&nbsp;{{Variation}}
																</p>
															</td>
															<td>52Week High
																<p style="font-weight: bold; font-size: large;">{{High}}</p>
															</td>
															<td>52Week Low
																<p style="font-weight: bold; font-size: large;">{{Low}}</p>
															</td>
														</tr>
													</tbody> --%>
												</table>
											</div>
											<div align="center" ng-show="nodata">
												<h4>No Data Available</h4>
											</div>
										</div>
									</div>


									<!-- Comment Section  -->
   													

									<div  class="panel panel-default col-sm-12 col-md-12" >
									
										<div >
											<form name="commentform" id="form" class="" role="form" method="POST"
												action="${pageContext.request.contextPath}/dashboard/comment" id="">

												<input type="hidden" name="url"
													value="graphpattern/graph/selectCompny11?companyName=${FirstCompny.companyName}"/>
												<input type="hidden" name="sc_code" value="${FirstCompny.companyCode}" /> <br />
												<br />
												<textarea rows="4" cols="55" id="comment" name="comment" class="comment"  minlength="20"  
												   placeholder="Comments should be related to fundamentals of the company..."  required></textarea>

												<button class="" type="submit" onclick="return validateComment();"  style="border-style:solid;  color: blue; font-family: cursive; font-weight: bold;">Post</button>
											</form>
										</div>
										<a href="javascript:showhide('comments')"><b style="font-style: oblique;">view comments</b></a>
										<div id="comments" style="display: none">
											
											
											<br />

											<c:forEach items="${commentList}" var="var">

												<h5>
													<b>${ var.login_id }</b> &nbsp;&nbsp;<font color="blue">
														${var.audit_date_time}</font>
												</h5>
												<p>${var.comment}</p>

												<a href="javascript:showhide('${var.comment_id}')"><b>Reply</b></a>
												<hr>
												<!--  reply-Box-->

												<div id="${var.comment_id}"
													style="padding-left: 50px; display: none">

													<c:forEach items="${var.replyList}" var="var1">

														<h5>
															<b>${ var1.login_id }</b> &nbsp;&nbsp;<font color="blue">
																${var1.audit_date_time}</font>
														</h5>
														<p>${var1.reply}</p>
														<hr>

													</c:forEach>

													<form name="form" id="form" class="" role="form"
														method="POST"
														action="${pageContext.request.contextPath}/dashboard/reply">
														<input type="hidden" name="url"
															value="graphpattern/graph/selectCompny11?companyName=${FirstCompny.companyName}" />
														<input type="hidden" name="comment_id"
															value="${var.comment_id}" />

														<textarea rows="2" class="reply" cols="30" name="reply" minlength="20"
															 placeholder="Reply here" required></textarea>
														<button class="" type="submit" style="border-style:solid;  color: blue; font-family: cursive; font-weight: bold;">Reply</button>
														
													</form>
													<hr>
												</div>
											</c:forEach>

										</div>
									</div>

								</div>

								<!-- /.box-body -->
							</div>

							<!-- /.box -->
						</div>

					</div>
					</c:if>

				</div>


 				<div class="col-sm-3 col-md-3">



				</div>

			</div>
		</div>

	</div>
	<!-- /.wrapper -->





	<div class="modal fade" id="emailChange" role="dialog"
		style="margin-top: 8%">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">Add to Portfolio</h4>
				</div>
				<div class="modal-body">
					<p style="color: green;" ng-hide="addStockLoad" align="center">{{addStockSuccess}}</p>
					<p style="color: red;" ng-hide="addStockLoad" align="center">{{addStockFail}}</p>
					<div ng-show="addStockLoad"
						style="color: green; font-size: medium;" align="center">
						Please wait.. <img
							src="<c:url value="/resources/images/load.gif"/>" height="50px"
							width="50px">
					</div>

					<form name='form' role='form' action="#" novalidate
						ng-show="addStock">
						<div class="row" align="left">
							<div class="form-group col-sm-12 col-md-12">
								<label class="col-sm-3 col-md-3 control-lable" for="file"
									style="margin-top: 7px">Company</label> <label
									class="col-sm-3 col-md-3 control-lable" for="file"
									style="margin-top: 7px">Buy_Date</label> <label
									class="col-sm-3 col-md-3 control-lable" for="file"
									style="margin-top: 7px">Buy Value</label> <label
									class="col-sm-3 col-md-3 control-lable" for="file"
									style="margin-top: 7px">No.of Shares</label>
									
									
									
									 <!-- <label
									class="col-sm-3 col-md-3 control-lable" for="file"
									style="margin-top: 7px">Portfolio ID</label> -->
									
							</div>
						</div>

						<div class="row">
							<div class="form-group col-sm-12 col-md-12">
								<div class="col-sm-3 col-md-3" style="">
									<input type="text" value="{{labelName}}" name="company"
										class=" form-control input-sm" readonly /> <input
										type="hidden" value="{{sc_code}}" name="sc_code"
										class=" form-control input-sm" ng-model="sc_code" />
								</div>
								<div class="col-sm-3 col-md-3" style="">
									<div class="input-group input-append date" id="datePicker">
										<input type="text" name="buydate" ng-model="buydate"
											class="form-control input-sm" placeholder="Date(dd-mm-yyyy)"
											required> <span class="input-group-addon add-on"><span
											class="glyphicon glyphicon-calendar"></span></span>
									</div>
								</div>

								<div class="col-sm-3 col-md-3" style="">
									<input type="text" name="price" ng-model="buyprice"
										ng-pattern="/^(([1-9][0-9]*)|(([0-9]*)\.([0-9]*)))$/"
										ng-maxlength="8" class="form-control input-sm"
										placeholder="Enter stock price" required>
								</div>

								<div class="col-sm-2 col-md-2" style="">
									<input type="text" style="width: 100px" name="shares"
										ng-model="shares" ng-pattern="/^[1-9][0-9]*$/"
										ng-maxlength="6" class="form-control input-sm"
										placeholder="Enter quantity" required>
								</div>
								
								
							</div>
						</div>

						<div class="row">
							<div class="form-group col-sm-12 col-md-12">

								<div class="col-sm-3 col-md-3"></div>

								<div class="col-sm-3 col-md-3">
									<div class="form-group"
										ng-class="{ 'has-error' : form.buydate.$invalid && (form.buydate.$dirty || submitted)}">
										<div style="color: red;" ng-show="form.buydate.$error.required" class="help-block">
											Buy Date is required.</div>
									</div>
								</div>

								<div class="col-sm-3 col-md-3">
									<div class="form-group"
										ng-class="{ 'has-error' : form.price.$invalid && (form.price.$dirty || submitted)}">
										<span style="color: red;" ng-show="form.price.$error.required"
											class="help-block">Price is required.</span> <span
											style="color: red" ng-show="form.price.$error.maxlength"
											class="help-block">Length less than 8</span> <span
											style="color: red;"
											ng-show="form.price.$invalid && form.price.$error.pattern"
											class="help-block">Only positive Digit is allow & pre
											zero is not allow & After point value required...... </span>
									</div>
								</div>


								<div class="col-sm-3 col-md-3">
									<div class="form-group"
										ng-class="{ 'has-error' : form.shares.$invalid && (form.shares.$dirty || submitted)}">
										<div style="color: red;" ng-show="form.shares.$error.required"
											class="help-block">Quantity is required.</div>
										<span style="color: red"
											ng-show="form.shares.$error.maxlength" class="help-block">Length
											less than 5</span> <span style="color: red;"
											ng-show="form.shares.$invalid && form.shares.$error.pattern"
											class="help-block">Only positive Digit is allow & pre
											zero is not allow </span>
									</div>
								</div>
							</div>
						</div>
						
						<div><label
									class="col-sm-3 col-md-3 control-lable" for="file"
									style="margin-top: 1px">Portfolio_ID</label><br/> 
								<div>
								<select style="width:200px; margin-left: -205px; margin-top: 0.5cm;"
								 name="pf_id"  ng-model="pf_id" id="pf_id" required>
								                      <option value="" disabled="disabled">---Please select---</option> 
                                                      <c:forEach items="${portfolioIDList}" var="data">
                                                      <option value="${data.pf_id}">${data.pf_id}</option>
                                                        </c:forEach>
											
											</select>
								</div></div>
								
								
						<br/>
</br>						<div class="row">
							<div class="col-sm-8 col-md-8" style="color: blue;">
								Note : Please Enter the total buy value inclusive all brokerage
								and tax.
								<div class="help-tip" style="right: 44px">
									<p>
										Example : One Stock Price : 100 rs., <br>Quantity : 2,<br>
										Tax : 14rs., <br>Your Buy Value is : 214 rs.
									</p>
								</div>
							</div>
							
							
							
							
							<div class="col-sm-4 col-md-4" style="margin-left: 0px">
								<button type="button" class="btn btn-primary pull-right"
									ng-disabled="form.$invalid" ng-click="addStockPortfolio();">Add Stock</button>
							</div>
						</div>
					</form>

				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>


</body>
</html>
