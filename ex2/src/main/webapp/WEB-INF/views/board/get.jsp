<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<c:import url="../includes/header.jsp"></c:import>
<body>
	<div id="page-wrapper">
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">Board Read</h1>
			</div>
			<!-- /.col-lg-12 -->
		</div>
		<!-- /.row -->
		<div class="row">
			<div class="col-lg-12">
				<div class="panel panel-default">
					<div class="panel-heading">Board Read Page</div>
					<!-- /.panel-heading -->
					<div class="panel-body">
						<form role="form" action="/board/register" method="post">
							<div class="form-group">
								<label>bno</label> <input class="form-control" name="bno" value='<c:out value="${board.bno }"/>' readonly />
							</div>
							<div class="form-group">
								<label>Title</label>
								<input class="form-control" name="title" value='<c:out value="${board.title }"/>' readonly />
							</div>
							<div class="form-group">
								<label>Text area</label>
								<textarea class="form-control" rows="3" name="content" readonly /><c:out value="${board.content }" /></textarea>
							</div>
							<div class="form-group">
								<label>Writer</label><input class="form-control" name="writer" value='<c:out value="${board.writer }"/>' readonly />
							</div>
						</form>
						<button type="button" data-oper="modify" class="btn btn-default" onclick="location.href='/board/modify?bno=<c:out value="${board.bno}"/>'">Modify</button>
						<button type="button" data-oper="list" class="btn btn-info" onclick="location.href='/board/list'">List</button>
					</div>
					<!-- /.row -->
				</div>
				<!-- /#page-wrapper -->
			</div>
			<!-- /#wrapper -->
		</div>
	</div>
	<c:import url="../includes/footer.jsp"></c:import>
</body>
</html>
