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
				<h1 class="page-header">Board Tables</h1>
			</div>
			<!-- /.col-lg-12 -->
		</div>
		<!-- /.row -->
		<div class="row">
			<div class="col-lg-12">
				<div class="panel panel-default">
					<div class="panel-heading">Board List Page
						<button id="regBtn" type="button" class="btn btn-xs pull-right">Register New Board</button>
					</div>
					
					<!-- /.panel-heading -->
					<div class="panel-body">
						<table width="100%"
							class="table table-striped table-bordered table-hover"
							id="dataTables-example">
							<thead>
								<tr>
									<th>#번호</th>
									<th>제목</th>
									<th>내용</th>
									<th>작성자</th>
									<th>작성일</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${list }" var="board">
									<tr>
										<td><c:out value="${board.bno }"></c:out></td>
										<td><a href='/board/get?bno=<c:out value="${board.bno }"/>'>
										<c:out value="${board.title }"></c:out>
										</td>
										<td><c:out value="${board.content }"></c:out></td>
										<td><fmt:formatDate pattern="yyyy-MM-dd"
												value="${board.regdate }"></fmt:formatDate></td>
										<td><fmt:formatDate pattern="yyyy-MM-dd"
												value="${board.updatedate }"></fmt:formatDate></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>

						<!-- Modal -->
						<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
							aria-labelledby="myModalLabel" aria-hidden="true">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal"
											aria-hidden="true">&times;</button>
										<h4 class="modal-title" id="myModalLabel">Modal title</h4>
									</div>
									<div class="modal-body">Lorem ipsum dolor sit amet,
										consectetur adipisicing elit, sed do eiusmod tempor incididunt
										ut labore et dolore magna aliqua. Ut enim ad minim veniam,
										quis nostrud exercitation ullamco laboris nisi ut aliquip ex
										ea commodo consequat. Duis aute irure dolor in reprehenderit
										in voluptate velit esse cillum dolore eu fugiat nulla
										pariatur. Excepteur sint occaecat cupidatat non proident, sunt
										in culpa qui officia deserunt mollit anim id est laborum.</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-default"
											data-dismiss="modal">Close</button>
										<button type="button" class="btn btn-primary">Save
											changes</button>
									</div>
								</div>
								<!-- /.modal-content -->
							</div>
							<!-- /.modal-dialog -->
						</div>
						<!-- /.modal -->


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
	$(document).ready(function() {
		
		var result = '<c:out value="${result}"/>';
		
		checkModal(result);
		
		history.replaceState({},null,null);
		
		function checkModal(){
			
			if(result === '' || history.state){
				return;
			}
			if(parseInt(result) > 0 ){
				$(".modal-body").html("게시글 " + parseInt(result) + "번 등록되었습니다.");
			}
			$("#myModal").modal("show");
		}
		
		$("#regBtn").on("click",function(){
			self.location = "/board/register";
		})
	})
</script>
