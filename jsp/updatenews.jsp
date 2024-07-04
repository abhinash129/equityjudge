<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<body ng-app="myApp">
	<div class="wrapper">
		<!-- Content Header (Page header) -->

	<div class="page-header" style="margin-top: -5px; margin-left: 20px; margin-bottom: -10px">
				<h3>Update News Feed</h3>
			</div>
		<!-- Main content -->
		<section class="content">

			<form:form class="form-horizontal" method="POST"
				action="${pageContext.request.contextPath}/news/update"
				modelAttribute="updateform">

				<div class="row">
					<div class="col-md-9">
						<div class="box">
							<div class="box-header">
								<h3 class="box-title">List of News Details</h3>
							</div>
							<div class="box-body">
								<h4 align="center" style="color: green;">${result}</h4>
								<table id="example1"
									class="table table-bordered table-hover table-responsive">
									<tr align="center">
										<th>Subject</th>
										<th>Text</th>
										<th>Delete</th>
									</tr>
									<c:forEach items="${subject}" var="news">
										<tr>
											<td><input type="text" class="form-control"
												id="inputSuccess" name="subject" value="${news.subject} " />
											</td>
											<td><input type="text" class="form-control"
												id="inputSuccess" name="text1" value="${news.text}" /></td>
											<td width="10px"><a
												href="${pageContext.request.contextPath}/news/delete?id=${news.id}" class="confirmation"><img
													src="<c:url value="/resources/dist/img/delete.png"/>"
													class="img-responsive"> </a></td>
<script type="text/javascript">
    $('.confirmation').on('click', function () {
        return confirm('Are you sure?');
    });
</script>
										</tr>
									</c:forEach>
								</table>
								<br>
								<button type="submit" class="btn btn-primary pull-right">UPDATE</button>
							</div>
							<!-- /.box-body -->
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

