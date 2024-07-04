<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<title>Insert title here</title>
</head>
<body>
<br>
<div class="container" style="border:1px solid rgb(235, 235, 224);box-shadow:rgba(0,0,0,0.298039) 0px 0px 5px;z-index:2;background-color:rgb(235, 235, 224);border-radius:4px">
<br><h4 class="modal-title" style="text-align:center">

 ${duration} Month's Algorithmic Efficacy For  <fmt:formatDate type="both" dateStyle="medium" pattern="dd-MM-yyyy" value="${crrDateto10daybackDate}" /> To <fmt:formatDate type="both" dateStyle="medium" pattern="dd-MM-yyyy" value="${userSearchDate}" />      

</h4><br>
<c:forEach items="${efficacylist}" var="entry">
<c:if test="${entry.key == 'bse'}">
<div class="table-responsive" align="center">
	<table class="table table-bordered table-hover table-condensed" style="border:1px solid rgb(204,204,204);box-shadow:rgba(0,0,0,0.298039) 0px 0px 10px;z-index:2;width:60%;align:center;background-color:white">
	<tr>
	   <th rowspan="2" style="color:blue;text-align:center;vertical-align:middle;font-size:18px"><a href="${pageContext.request.contextPath}/graphpattern/graph/selectCompny?companyName=BSE SENSEX ">BSE SENSEX</a></th>
<%-- 	   <c:forEach items="${entry.value}" var="bseValue"> --%>
	   <th>Price on <fmt:formatDate type="both" dateStyle="medium" pattern="dd-MM-yyyy" value="${backDate}" /> </th>
<%-- 	   </c:forEach> --%>
	   <th>Current Price</th>
	   <th>%Change</th>
	 </tr>
	 
	<tr>
	
	
	<c:forEach items="${entry.value}" var="bseValue">
	<td><b>${bseValue.bseBackPrice}</b></td>
	<td><b>${bseValue.bsePrice}</b></td>
	<td><b><c:if test="${bseValue.bseacPer<0}">
											<font color="red"> <fmt:formatNumber type="number" minFractionDigits="2" maxFractionDigits="2" value="${bseValue.bseacPer }" />
												</font>
										</c:if>

										<c:if test="${bseValue.bseacPer>=0}">
											<font color="green">+ <fmt:formatNumber type="number" minFractionDigits="2" maxFractionDigits="2" value="${bseValue.bseacPer }" />
												</font>
										</c:if></b></td>
	</c:forEach>
	
	</tr>
	
	</table>
	</div>
	</c:if>
	
	
	
	<c:if test="${entry.key == 'list'}">
	<div class="table-responsive" align="center">
	<table class="table table-bordered table-hover table-condensed" style="background-color:white;width:90%;align:center;border:1px solid rgb(204,204,204);box-shadow:rgba(0,0,0,0.298039) 0px 0px 10px;z-index:2;">
	<caption style="text-align:center"><h4 style="color:black">Top 10 Companies List Displayed On ${todayDate}</h4></caption>
	<thead>
	<tr>
       <th>SI.No.</th>	
	   <th>Company Name</th>
	   <th>Pattern Name</th>
	   <th>Suggestion</th>
	   <th>Detected Date</th>
	   <th>Detected Price</th>
	   <th>Current Price</th>
	   <th>%Change</th>
	 </tr>
	 </thead>
	 <tbody>
	 
	<c:forEach items="${entry.value}" var="listValue" varStatus="counter">
	 <tr>
	   <td align="center">${counter.count }</td>
	   <td><a href="${pageContext.request.contextPath}/graphpattern/graph/selectCompny?companyName=${listValue.companyname}">${listValue.companyname}</a></td>
	   <td>${listValue.pattern_name}</td>
	   <td>${listValue.suggestion}</td>
	   <td><fmt:formatDate type="both" dateStyle="medium" pattern="dd-MM-yyyy" value="${listValue.forming_date}" /></td>
	    <td>${listValue.backPrice}</td>
	     <td>${listValue.todayClosePrice}</td>
	   <td style="color:rgb(0,179,0)"><b>+  <fmt:formatNumber type="number" minFractionDigits="2" maxFractionDigits="2" value="${listValue.acPer}" /></b></td>
	</tr>
	</c:forEach>

	</tbody>
	</table>
	</div>
	</c:if>
	</c:forEach>
	</div>
</body>
</html>