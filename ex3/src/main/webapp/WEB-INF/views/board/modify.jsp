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
						<form role="form" action="/board/modify" method="post">
							<input type="hidden" name="pageNum" value='<c:out value="${cri.pageNum }"/>'>
							<input type="hidden" name="amount" value='<c:out value="${cri.amount }"/>'>
							<input type="hidden" name="keyword" value="<c:out value="${cri.keyword }"/>">
							<input type="hidden" name="type" value="<c:out value="${cri.type }"/>">
							<div class="form-group">
								<label>bno</label> <input class="form-control" name="bno" value='<c:out value="${board.bno }"/>' readonly/>
							</div>
							<div class="form-group">
								<label>Title</label>
								<input class="form-control" name="title" value='<c:out value="${board.title }"/>' />
							</div>
							<div class="form-group">
								<label>Text area</label>
								<textarea class="form-control" rows="3" name="content"><c:out value="${board.content }" /></textarea>
							</div>
							<div class="form-group">
								<label>Writer</label><input class="form-control" name="writer" value='<c:out value="${board.writer }"/>' readonly/>
							</div>
							<div class="form-group">
								<label>RagDate</label><input class="form-control" name="regDate" value='<fmt:formatDate pattern='yyyy/MM/dd' value="${board.regDate }"/>' readonly/>
							</div>
							<div class="form-group">
								<label>UpdateDate</label><input class="form-control" name="updateDate" value='<fmt:formatDate pattern='yyyy/MM/dd' value="${board.updateDate}"/>' readonly/>
							</div>
						</form>
						<button type="submit" data-oper="modify" class="btn btn-default">Modify</button>
						<button type="submit" data-oper="remove" class="btn btn-danger">Remove</button>
						<button type="submit" data-oper="list" class="btn btn-submit">List</button>
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
		
		var formObj = $("form");
		
		$('button').on("click",function(e){
			
			e.preventDefault();
			
			var operation = $(this).data('oper');
			
			console.log(operation);
			
			if(operation === 'remove'){
				formObj.attr("action","/board/remove");
			}else if(operation === 'list'){
				formObj.attr("action","/board/list").attr("method","get");
				var pageNumTag = $("input[name='pageNum']").clone();
				var amountTag = $("input[name='amount']").clone();
				var keywordTag = $("input[name='keyword']").clone();
				var typeTag = $("input[name='type']").clone();
				formObj.empty();
				formObj.append(pageNumTag);
				formObj.append(amountTag);
				formObj.append(keywordTag);
				formObj.append(typeTag);
			}
			
			formObj.submit();
			
		})
	
	})
</script>
