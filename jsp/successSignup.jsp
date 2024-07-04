<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    

<!DOCTYPE html>
<html>
<head>
    <title>Nivesh</title>
    
<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
       
        <link rel="stylesheet" href="<c:url value="/resources/css/bootstrap.min.css"/>"> 
       <link rel="stylesheet" href="<c:url value="/resources/css/layout.css"/>"> 
       <script type="text/javascript" src="<c:url value="/resources/js/jquery-2.1.4.min.js"/>"></script>
        <script type="text/javascript" src="<c:url value="/resources/js/bootstrap.min.js"/>"></script>
        
        
      <style style="text/css">
			.example1 {
			 height: 30px;	
 			overflow: hidden;
 			position: relative;
			}
		.example1 h4 {
		 position: absolute;
		 width: 100%;
		 height: 100%;
		 margin: 0;
		 line-height: 30px;
		 text-align: center;
		 /* Starting position */
		 -moz-transform:translateX(100%);
		 -webkit-transform:translateX(100%);	
		 transform:translateX(100%);
		 /* Apply animation to this element */	
		 -moz-animation: example1 15s linear infinite;
		 -webkit-animation: example1 15s linear infinite;
		 animation: example1 15s linear infinite;
		}
		/* Move it (define the animation) */
		@-moz-keyframes example1 {
		 0%   { -moz-transform: translateX(100%); }
		 100% { -moz-transform: translateX(-100%); }
		}
		@-webkit-keyframes example1 {
		 0%   { -webkit-transform: translateX(100%); }
		 100% { -webkit-transform: translateX(-100%); }
		}
		@keyframes example1 {
		 0%   { 
		 -moz-transform: translateX(100%); /* Firefox bug fix */
		 -webkit-transform: translateX(100%); /* Firefox bug fix */
		 transform: translateX(100%); 		
		 }
		 100% { 
		 -moz-transform: translateX(-100%); /* Firefox bug fix */
		 -webkit-transform: translateX(-100%); /* Firefox bug fix */
		 transform: translateX(-100%); 
		 }
		}
</style>        
        
</head>
<body ng-app="myApp">
<div class="container-fluid">
<div class="row" style="background-image:url(<c:url value="/resources/images/banner.jpg"/>); background-repeat: no-repeat;background-size:cover;">
<div class="col-xs-12 col-sm-6 col-md-8 col-lg-8">
<div id="logo">
      <h1><a href="#" style="text-decoration: none;color:white;font-weight:bolder;">Nivesh</a></h1>
      <p style="color:white;"><strong>We help you to make your future better </strong></p>
    </div>
</div>
<div class="col-xs-12 col-sm-6 col-md-4 col-lg-4">

     <form name="form" id="form" class="form-horizontal" enctype="multipart/form-data" method="POST" action="${pageContext.request.contextPath}/login">
                   <div class="col-xs-12 col-sm-6 col-md-8 col-lg-8 pull-right">
                    <div class="input-group">
                        <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                        <input id="user" type="text" class="form-control" name="userName" value="" placeholder="UserID" required>                                        
                    </div></br>

                    <div class="input-group">
                        <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                        <input id="password" type="password" class="form-control" name="password" placeholder="Password" required>
                    </div></br>                                                                  

                    <div class="form-group">
                        <!-- Button -->
                        <div class="col-sm-12 controls">
                            <button type="submit" class="btn btn-primary btn-sm pull-right"><i class="glyphicon glyphicon-log-in"></i> Sign in</button>
                            <button type="button" class="btn btn-primary btn-sm pull-left" data-toggle="modal" href="#myModal" ><i class="glyphicon glyphicon-list-alt"></i> Sign up</button>                          
                        </div>
                    </div>
				</div>
    </form>
    
</div>

</div>
<div class="row" style="padding:0px;">
<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" style="padding:0px;">
<div class="example1">
<h4>${news}</h4>
</div>
</div>
</div>
<div class="row" >
<div class="col-xs-3 col-sm-3 col-md-3 col-lg-3" style="min-height:480px;border:2px solid #EC971F;border-radius:5px;">


                            <div class="input-group col-xs-12 col-sm-12 col-md-12 col-lg-12" style="margin:20px 0px;">
                                <input type="text" class="  search-query form-control" placeholder="Company Name-Company Code" />
                                <span class="input-group-btn">
                                    <button class="btn btn-warning" type="button">
                                        <span class=" glyphicon glyphicon-search"></span>
                                    </button>
                                </span>
                            </div>
                        <div class="input-group col-xs-12 col-sm-12 col-md-12 col-lg-12" style="margin:20px 0px;">
                                
                            <label>label1</label>
                            <input type="text" class="  search-query form-control"  />
                                
                            </div>
    <div class="input-group col-xs-12 col-sm-12 col-md-12 col-lg-12" style="margin:20px 0px;">
        <label>label2</label>
                                <input type="text" class="  search-query form-control"  />
                                
                            </div>
    <div class="input-group col-xs-12 col-sm-12 col-md-12 col-lg-12" style="margin:20px 0px;">
        <label>label3</label>                        
        <input type="text" class="  search-query form-control"  />
                                
                            </div>


</div>
<div class="col-xs-9 col-sm-9 col-md-9 col-lg-9" style="min-height:480px;border:2px solid #EC971F;border-radius:5px,background-size:cover;">
 <style="min-height:480px;border:2px solid #EC971F;border-radius:5px;background: url(<c:url value="/resources/images/home.jpg"/>);background-size:cover;" >
<h2>Your registration successfully done</h2>
<h4>userID:${uname}</h4>
<h4>Password:${pwd}</h4>
</div>
</div>
<div class="row" style="background-color:#286090;height:50px; ">

   <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4" >
   
   </div>                         
     <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4" >
   
   </div>
   <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4" >
   <span>Copyright &copy; 2014 - All Rights Reserved - <a href="#">Domain Name</a></span>
   </div>                   

</div>

</div>



 






<div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
       
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          
        
        <div class="modal-body" style="border:none;padding:0px;">
          
    <div class="col-xs-12 col-sm-12 col-md-12 ">
		<form role="form">
			<h2 style="color:#000000;">Please Sign Up <small>It's free and always will be.</small></h2>
			<hr class="colorgraph">
			<div class="row">
				<div class="col-xs-12 col-sm-6 col-md-6">
					<div class="form-group">
                        <input type="text" name="first_name" id="first_name" class="form-control input-lg" placeholder="First Name" tabindex="1" required>
					</div>
				</div>
				<div class="col-xs-12 col-sm-6 col-md-6">
					<div class="form-group">
						<input type="text" name="last_name" id="last_name" class="form-control input-lg" placeholder="Last Name" tabindex="2" required>
					</div>
				</div>
			<div class="row">
				<div class="col-xs-12 col-sm-6 col-md-6">
					<div class="form-group">
						<input type="text" name="userName" id="user_name" class="form-control input-lg" placeholder="User ID" tabindex="5" required>
					</div>
				</div>
				<div class="col-xs-12 col-sm-6 col-md-6">
					<div class="form-group">
						<input type="text" name="phoneNo" id="phone_number" class="form-control input-lg" placeholder="Phone Number" tabindex="6" required>
					</div>
				</div>
			</div>
			<div class="form-group">
				<input type="email" name="email" id="email" class="form-control input-lg" placeholder="Email Address" tabindex="4" required>
			</div>
			<div class="row">
				<div class="col-xs-12 col-sm-6 col-md-6">
					<div class="form-group">
						<input type="password" name="password" id="password" class="form-control input-lg" placeholder="Password" tabindex="5" required>
					</div>
				</div>
				<div class="col-xs-12 col-sm-6 col-md-6">
					<div class="form-group">
						<input type="password" name="password_confirmation" id="password_confirmation" class="form-control input-lg" placeholder="Confirm Password" tabindex="6" required>
					</div>
				</div>
			</div>
			
			
			<hr class="colorgraph">
			<div class="row">
				<div class="col-xs-12 col-md-6 pull-right"><input type="submit" value="Register" class="btn btn-primary btn-block btn-lg" tabindex="7"></div>
				
			</div>
		</form>
	</div>
</div>


        <div class="modal-footer">
          
        </div>
      </div>
      
    </div>
  </div>
</body>
</html>
