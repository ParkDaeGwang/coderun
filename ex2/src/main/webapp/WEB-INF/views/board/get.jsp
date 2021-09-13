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
						<div class="form-group">
							<label>bno</label> <input class="form-control" name="bno" value='<c:out value="${board.bno }"/>' readonly />
						</div>
						<div class="form-group">
							<label>Title</label>
							<input class="form-control" name="title" value='<c:out value="${board.title }"/>' readonly />
						</div>
						<div class="form-group">
							<label>Text area</label>
							<textarea class="form-control" rows="3" name="content" readonly><c:out value="${board.content }" /></textarea>
						</div>
						<div class="form-group">
							<label>Writer</label><input class="form-control" name="writer" value='<c:out value="${board.writer }"/>' readonly />
						</div>
						<button type="button" data-oper="modify" class="btn btn-default">Modify</button>
						<button type="button" data-oper="list" class="btn btn-info">List</button>
						
						<form id="operForm" method="get">
							<input type="hidden" id="bno" name="bno" value="<c:out value="${board.bno}"/>">
						</form>
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

<script type="text/javascript">
	$(document).ready(function(){
		
		var operForm = $("#operForm");
		
		$("button[data-oper='modify']").on("click",function(e){
			
			operForm.attr("action","/board/modify").submit();
			
		});
		
		$("button[data-oper='list']").on("click",function(e){
			
			operForm.find("#bno").remove();
			operForm.attr("action","/board/list").submit();
			
		});
	})
</script>
