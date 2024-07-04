<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<html>
<body ng-app="myApp">
	<div class="wrapper">
		<!-- Content Header (Page header) -->
<div class="page-header" style="margin-top: -5px; margin-left: 20px; margin-bottom: -10px">
				<h3>News Feed</h3>
			</div>
		<!-- Main content -->
		<section class="content">

			<form:form class="form-horizontal" method="POST"
				action="${pageContext.request.contextPath}/news/insertnews"
				modelAttribute="newsinsertform">


				<div class="box box-default col-md-9">
					<div class="box-header with-border">
						<h3 class="box-title">News</h3>
					</div>
					<!-- /.box-header -->
					<div class="box-body">
					<h4 align="center" style="color: green;">${subject}</h4>
					<div></div>
						<div class="row">
							<div class="col-md-8">
								<div class="col-md-2">
									<label>Subject</label>
								</div>
								<div class="col-md-6">
									<div class="form-group">
										<input type="text" class="form-control" name="subject" />
									</div>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-md-8">
								<div class="col-md-2">
									<label>Text</label>
								</div>
								<div class="col-md-6">
									<div class="form-group">
										<input type="text" class="form-control" name="text1" />
									</div>
								</div>
							</div>
						</div>
						<div style="margin-left: 300px">
						<button type="submit" class="btn btn-primary">Insert</button>
						</div>
					</div>
					<!-- /.box-body -->
				</div>
				<!-- /.box -->
			</form:form>



		</section>
		<!-- /.content -->
	</div>
	<!-- /.content-wrapper -->
</body>
</html>

