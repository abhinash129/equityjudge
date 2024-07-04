<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
</head>
<body ng-app="myApp">
	<div class="wrapper">
		<div class="container">
			<div class="page-header">
				<h2>Portfolio Demo</h2>
			</div>

			<div>
				<h3>Welcome to Equityjudge Portfolio Tracker Demo.</h3>
			</div>

			<div>
				<p style="color: green; font-size: large;">&#10148; Now very
					easy to track portfolio with Equityjudge portfolio tracker.
				<ul>
					<li>Easy to add multiple company stock at a time.</li>
					<li>Then also checking for gain and loss easy for selected
						company.</li>
					<li>And you can also sell stock as if need.</li>
					<li>And also check history of your portfolio tracking</li>
					<li>.....and also very much information about stock.</li>
				</ul>
			</div>
			<div style="font-size: medium; color: blue;">
				&#10154; If you are interested then become member of Equityjudge.<br>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<small>&#10162; For that
					<b>Login</b> or <b>Register</b>.
				</small>
			</div>
			<hr>

			<div class="container">
				<div class="row">
				<h4><u><b>1.My Porfolio Track</b></u></h4>
					<div class="col-md-5">
							<div class="panel panel-back noti-box" style="margin-top: 40px">
								<div class="text-box">
									<p class="main-text">Welcome to My Portfolio</p>
									<p class="text-muted">
										<i class="glyphicon glyphicon glyphicon-plus"></i> 
										Here you can see your  stock details.
									</p>
									<p class="text-muted">
										And for adding stock please click on <b>Add Stock</b> button.
									</p>
									<hr>
									<p class="text-muted">
										<span class="text-muted color-bottom-txt"><i
											class="fa fa-edit"></i> Here you can add stock of any company and we are giving you the all details related to stocks. </span>
											<br>
											<span class="text-muted color-bottom-txt"><i
											class="fa fa-edit"></i> After adding stock you can see the all details about this particular stocks. </span>
									</p>
								</div>
							</div>
					</div>
					<div class="col-md-7">
					<img class="img-responsive" src="${pageContext.request.contextPath}/resources/dist/img/portfolioDemo/MyPortfolio.png">
					</div>
				</div>
				
				<div class="row">
				<h4><u><b>2.Add Stocks Track</b></u></h4>
<div class="col-md-7">
					<img class="img-responsive" src="${pageContext.request.contextPath}/resources/dist/img/portfolioDemo/AddStock.png">
					</div>
					<div class="col-md-5">
							<div class="panel panel-back noti-box" style="margin-top: 40px">
								<div class="text-box">
									<p class="main-text">Welcome to My Portfolio</p>
									<p class="text-muted">
										<i class="glyphicon glyphicon glyphicon-plus"></i> 
										Here you can add any company stock.
									</p>
									<p class="text-muted">
										For that first search any company name and simply press add(+) button.<br>
										After that fill the details about your selected stocks and press Buy button.
									</p>
									<hr>
									<p class="text-muted">
										<span class="text-muted color-bottom-txt"><i
											class="fa fa-edit"></i> Here you can search any company for adding stocks. </span>
									</p>
								</div>
							</div>
					</div>
				</div>
				<br>
				
								<div class="row">
				<h4><u><b>3.Sell Stock Track</b></u></h4>
					<div class="col-md-5">
							<div class="panel panel-back noti-box" style="margin-top: 40px">
								<div class="text-box">
									<p class="main-text">Welcome to My Portfolio</p>
									<p class="text-muted">
										<i class="glyphicon glyphicon glyphicon-plus"></i> 
										Here you can sell your stock.
									</p>
									<p class="text-muted">
										And for selling click on Sell button and fill the details.
									</p>
									<hr>
									<p class="text-muted">
										<span class="text-muted color-bottom-txt"><i
											class="fa fa-edit"></i> Here you can sell your stock easily. </span>
											<br>
											<span class="text-muted color-bottom-txt"><i
											class="fa fa-edit"></i> Here fill the selling details of particular stock and Sell. </span>
									</p>
								</div>
							</div>
					</div>
					<div class="col-md-7">
					<img class="img-responsive" src="${pageContext.request.contextPath}/resources/dist/img/portfolioDemo/SellPortfolio.png">
					</div>
				</div>
				<br>
								<div class="row">
				<h4><u><b>4.History of Track Stock</b></u></h4>
<div class="col-md-7">
					<img class="img-responsive" src="${pageContext.request.contextPath}/resources/dist/img/portfolioDemo/History.png">
					</div>
					<div class="col-md-5">
							<div class="panel panel-back noti-box" style="margin-top: 40px">
								<div class="text-box">
									<p class="main-text">Welcome to My Portfolio</p>
									<p class="text-muted">
										<i class="glyphicon glyphicon glyphicon-plus"></i> 
										Here you can see the history of selling stocks.
									</p>
									<p class="text-muted">
										That is for seen the history of selling stocks and details about that.							
											</p>
								</div>
							</div>
					</div>
				</div>
				
			</div>
			<!-- container1 -->
		</div>
	</div>
</body>
</html>