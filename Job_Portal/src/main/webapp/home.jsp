<%@page import="com.entity.Jobs"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.dao.JobDao"%>


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User: Home</title>
<%@include file="all_component/all_css.jsp"%>
</head>
<body style="background-color: #f7f7f7;">

	<c:if test="${empty userobj }">
		<c:redirect url="login.jsp">
		</c:redirect>
	</c:if>

	<%@include file="all_component/navbar.jsp"%>
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<h2 class="text-center text-primary">All Jobs</h2>
				</div></div></div>
	
				<%
				JobDao dao = new JobDao(DBConnect.getConn());
				List<Jobs> list = dao.GetAllJobsForUser();
				for (Jobs j : list) {
				%>
				<div class="card mt-2">
					<div class="card-body">
						<div class="text-center text-primary">

							<i class="fas fa-clipboard fa-2x"></i>

						</div>
						<h6><%=j.getTitle()%></h6>
						

						<br>
						
						<br>

						<div class="form-row">
							<div class="form-group col-md-3">
								<input type="text" class="form-control form-control-sm"
									value="Location: <%=j.getLocation()%>" readonly>
							</div>
							<div class="form-group col-md-3">
								<input type="text" class="form-control form-control-sm"
									value="Category:: <%=j.getCategory()%>" readonly>
							</div>

						</div>
						<h6>
							Publish Date:
							<%=j.getPdate().toString()%>
						</h6>
						<div class="text-center">
							<a href="one_view.jsp?id=<%=j.getId()%>"
								class="btn btn-success text-white">View More</a>

						</div>
					</div>

				</div>
				<%
				}
				%>
			





</body>
</html>