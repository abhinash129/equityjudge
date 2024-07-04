<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>

<head></head>
<body>

	<div>
								<!-- Comment Section  -->
								  	<div>
								  	<form name="form" id="form" class="" role="form" method="POST"
								     action="${pageContext.request.contextPath}/dashboard/comment"
								      id="">
									    <input type="hidden" name="sc_code" value="${FirstCompny.companyCode}"/>
										<textarea rows="4" cols="50" id="" name="comment" class="" 
                                         placeholder="Post your comments here"></textarea>
                                       <!--   <button type="submit" 
												class="btn btn-primary">GO</button> -->
                                         <button class="" type="submit">Post</button>
									</form>
									</div>
									<div>
										<h3>Comments:</h3><hr><br/>
										<h5><b>Rakesh </b>  July 19,2017</h5>
										<p>Axis securities launches voice-based mobile trading that is powered by TCS BaNCS Digital. Cheers.</p>
										<h5><a href=""><b>Reply</b></a> &nbsp; <a href=""><b>Edit</b></a></h5><hr>
										
									   <h5><b>Ramesh </b>  July 19,2017</h5>
										<p>Axis securities launches voice-based mobile trading that is powered by TCS BaNCS Digital. Cheers.</p>
										<h5><a href=""><b>Reply</b></a>&nbsp; <a href=""><b>Edit</b></a></h5><hr>
									</div>
								</div>
						
											
				
</body>
</html>