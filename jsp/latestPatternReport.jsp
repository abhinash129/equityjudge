
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html ng-app="myApp">
<head>
<script type="text/javascript"
	src="<c:url value="/resources/angular/controller/patternReportController.js"/>"></script>

<script type="text/javascript"
	src="<c:url value="/resources/angular/service/patternReportService.js"/>"></script>

<script type="text/javascript">
function blinker() {
    $('.blink_me').fadeOut(500);
    $('.blink_me').fadeIn(250);
}
setInterval(blinker, 1500);
</script>
<style>
.button {
  display: inline-block;
  border-radius: 4px;
  background-color: green;
  border: none;
  color: #FFFFFF;
  text-align: center;
  padding: 5px;
  width: 150px;
  transition: all 0.5s;
  cursor: pointer;
  margin: 0px;
}

.button span {
  cursor: pointer;
  display: inline-block;
  position: relative;
  transition: 0.5s;
}

.button span:after {
  content: '\00bb';
  position: absolute;
  opacity: 0;
  top: 0;
  right: -20px;
  transition: 0.5s;
}

.button:hover span {
  padding-right: 25px;
}

.button:hover span:after {
  opacity: 1;
  right: 0;
}
</style>
</head>
<body ng-controller="ReportController"
	data-ng-init="LoadSuggestionReport()">
	<div class="wrapper">
		<!-- Content Header (Page header) -->
		<!-- Main content -->
		<section class="content">
			<div class="row">
				<div class="col-xs-12">
					<div class="box">
						<div class="box-header">
							<div class="col-md-9">
								<h3 class="box-title" style="font-weight: bolder; margin-left: 14cm;">Latest
									Algorithmic Prediction</h3>
								<br/><br/>
							
									<span 
										style="color: red; font-size: large; font-weight: bolder;">&#8667; Short
											term Investor &#47; Traders can make judicious use of these <span class="blink_me"
											style="color: green; font-weight: bold;">ALGORITHMIC SUGGESTION</span>
									</span>
									<br/>
									<span
										style="color: red; font-size: large; font-weight: bolder;">&#8667; Trade &#47; Investment
											should be in high volume shares to get <span class="blink_me"
											style="color: green; font-weight: bold;">Better result</span>
									</span>
								
							</div>
							<div class="col-md-3" align="right">
								<h4>
									<u>${formingDate }</u>
								</h4>
								<sup  class="blinking" style="width=10px;height:6px;background:red;border:1px;border-radius:4px;color: white; ">&nbsp New &nbsp</sup>
								<button  class="button" style="vertical-align:middle"
								onclick="window.location.href='<c:url value="/graphpattern/preferreport"/>'">
											<span>Filtered List
									</span></button>
							</div>

						</div>
						<!-- /.box-header -->
						<form>
							<div class="form-group col-md-4">
								<div class="input-group">
									<div class="input-group-addon">
										<i class="fa fa-search"></i>
									</div>
									<input type="text" class="form-control"
										placeholder="Search Company Name" ng-model="searchCompany">
								</div>
							</div>
						</form>

						<div class="box-body">
							<table id="example2" class="table table-bordered table-hover">
								<thead>
									<tr>
										<td><a href="#"
											ng-click="sortType = 'Sr_No'; sortReverse = !sortReverse">
												Sr_No <span ng-show="sortType == 'Sr_No' && !sortReverse"
												class="fa fa-caret-down"></span> <span
												ng-show="sortType == 'Sr_No' && sortReverse"
												class="fa fa-caret-up"></span>
										</a></td>
										<td><a href="#"
											ng-click="sortType = 'COMPANYNAME'; sortReverse = !sortReverse">
												COMPANYNAME <span
												ng-show="sortType == 'COMPANYNAME' && !sortReverse"
												class="fa fa-caret-down"></span> <span
												ng-show="sortType == 'COMPANYNAME' && sortReverse"
												class="fa fa-caret-up"></span>
										</a></td>
										<td><a href="#"
											ng-click="sortType = 'PATTERN_NAME'; sortReverse = !sortReverse">
												PATTERN_NAME <span
												ng-show="sortType == 'PATTERN_NAME' && !sortReverse"
												class="fa fa-caret-down"></span> <span
												ng-show="sortType == 'PATTERN_NAME' && sortReverse"
												class="fa fa-caret-up"></span>
										</a></td>
										<td><a href="#"
											ng-click="sortType = 'SUGGESTION'; sortReverse = !sortReverse">
												SUGGESTION <span
												ng-show="sortType == 'SUGGESTION' && !sortReverse"
												class="fa fa-caret-down"></span> <span
												ng-show="sortType == 'SUGGESTION' && sortReverse"
												class="fa fa-caret-up"></span>
										</a></td>
										<td><a href="#"
											ng-click="sortType = 'CLOSE_PRICE'; sortReverse = !sortReverse">
												CURRENT_PRICE <span
												ng-show="sortType == 'CLOSE_PRICE' && !sortReverse"
												class="fa fa-caret-down"></span> <span
												ng-show="sortType == 'CLOSE_PRICE' && sortReverse"
												class="fa fa-caret-up"></span>
										</a></td>
									</tr>
								</thead>

								<tbody>
									<tr
										ng-repeat="roll in latestReportData | orderBy:sortType:sortReverse | filter:searchCompany">
										<td>{{ roll.Sr_No }}</td>
										<td><a
											href="${pageContext.request.contextPath}/graphpattern/graph/selectCompny?companyName={{ roll.COMPANYNAME }}"><font
												color="black">{{ roll.COMPANYNAME }}</font></td>
										<td>{{ roll.PATTERN_NAME }}</td>
										<td>{{ roll.SUGGESTION }}</td>
										<td>{{ roll.CLOSE_PRICE }}</td>
									</tr>
								</tbody>
							</table>
						</div>
						<!-- /.box-body -->
					</div>
					<!-- /.box -->
				</div>
				<!-- /.col -->
			</div>
			<!-- /.row -->


			<!-- 

			<div class="row">
				<div class="col-sm-5">
					<div class="dataTables_info" id="example2_info" role="status"
						aria-live="polite">Showing 1 to 10 of 57 entries</div>
				</div>
				<div class="col-sm-7">
					<div class="dataTables_paginate paging_simple_numbers"
						id="example2_paginate" style="margin-top: 0px;">
						<ul class="pagination">
							<li class="paginate_button previous disabled"
								id="example2_previous"><a href="#"
								aria-controls="example2" data-dt-idx="0" tabindex="0">Previous</a></li>
							<li class="paginate_button active"><a href="#"
								aria-controls="example2" data-dt-idx="1" tabindex="0">1</a></li>
							<li class="paginate_button "><a href="#"
								aria-controls="example2" data-dt-idx="2" tabindex="0">2</a></li>
							<li class="paginate_button "><a href="#"
								aria-controls="example2" data-dt-idx="3" tabindex="0">3</a></li>
							<li class="paginate_button "><a href="#"
								aria-controls="example2" data-dt-idx="4" tabindex="0">4</a></li>
							<li class="paginate_button "><a href="#"
								aria-controls="example2" data-dt-idx="5" tabindex="0">5</a></li>
							<li class="paginate_button "><a href="#"
								aria-controls="example2" data-dt-idx="6" tabindex="0">6</a></li>
							<li class="paginate_button next" id="example2_next"><a
								href="#" aria-controls="example2" data-dt-idx="7" tabindex="0">Next</a></li>
						</ul>
					</div>
				</div>
			</div>

 -->


		</section>
		<!-- /.content -->
	</div>
	<!-- /.wrapper -->
</body>
</html>







