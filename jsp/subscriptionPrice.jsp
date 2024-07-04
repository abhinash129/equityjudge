<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<body ng-app="myApp">
	<div class="wrapper">
		<!-- Content Header (Page header) -->

	<div class="page-header" style="margin-top: -5px; margin-left: 20px; margin-bottom: -10px">
				<h3>Subscription Pricing</h3>
			</div>
		<!-- Main content -->
		<section class="content">

			<form:form class="form-horizontal" method="POST"
				action="${pageContext.request.contextPath}/price/update"
				modelAttribute="">

				<div class="row">
					<div class="col-xs-9">
						<div class="box">
							<div class="box-header">
								<h3 class="box-title">
									<u>Pricing List</u>
								</h3>
							</div>
							<!-- /.box-header -->
							<div class="col-md-11" style="padding-bottom: 5px">
								<button type="submit" class="btn btn-primary pull-right">UPDATE</button>
							</div>
							<div class="box-body">
								<div class="col-md-11">
									<table class="table table-bordered table-hover">
										<tr>
											<th width="10%">Id</th>
											<th width="10%">Duration</th>
											<th width="20%">Price</th>
										</tr>
										<c:forEach items="${PriceList }" var="data">
											<tr>
												<td>${data.id }</td>
												<td>${data.duration }</td>
												<td><input type="text" class="form-control"
													name="price" value="${data.price }" /></td>
											</tr>
										</c:forEach>
									</table>
								</div>
							</div>
							<div class="box-footer">
								<button type="submit" class="btn btn-primary pull-right">UPDATE</button>
							</div>
						</div>
					</div>
				</div>
			</form:form>
		</section>
		<!-- /.content -->


	</div>
	<!-- /.content-wrapper -->
</body>
</html>

