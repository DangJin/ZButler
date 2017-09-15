<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<!-- Meta, title, CSS, favicons, etc. -->
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	
	<title>店铺分类修改 | ${sessionScope.netName.setValue}</title>

	<!-- Bootstrap -->
	<link href="./vendors/bootstrap/dist/css/bootstrap.min.css"
		rel="stylesheet">
	<!-- Font Awesome -->
	<link href="./vendors/font-awesome/css/font-awesome.min.css"
		rel="stylesheet">
	<!-- NProgress -->
	<link href="./vendors/nprogress/nprogress.css" rel="stylesheet">
	<!-- jQuery custom content scroller -->
    <link href="./vendors/malihu-custom-scrollbar-plugin/jquery.mCustomScrollbar.min.css" rel="stylesheet"/>
	<!-- Dropzone.js -->
	<link href="./vendors/dropzone/dist/min/dropzone.min.css" rel="stylesheet">
	<!-- iCheck -->
	<link href="./vendors/iCheck/skins/flat/green.css" rel="stylesheet">
	<!-- bootstrap-wysiwyg -->
	<link href="./vendors/google-code-prettify/bin/prettify.min.css"
		rel="stylesheet">
	<!-- Select2 -->
	<link href="./vendors/select2/dist/css/select2.min.css" rel="stylesheet">
	<!-- Switchery -->
	<link href="./vendors/switchery/dist/switchery.min.css" rel="stylesheet">
	<!-- starrr -->
	<link href="./vendors/starrr/dist/starrr.css" rel="stylesheet">
	<!-- bootstrap-daterangepicker -->
	<link href="./vendors/bootstrap-daterangepicker/daterangepicker.css"
		rel="stylesheet">
	
	<!-- Custom Theme Style -->
	<link href="./build/css/custom.min.css" rel="stylesheet">
	<style>
		.dropzone{
			min-height: 194px;
			width: 194px;
		}
	</style>
</head>

<body class="nav-md">
	<div class="container body">
		<div class="main_container">
			<jsp:include page="left.jsp" />

			<!-- top navigation -->
			<jsp:include page="header.jsp" />
			<!-- /top navigation -->

			<!-- page content -->
			<div class="right_col" role="main">
				<div class="">
					<div class="page-title">
						<div class="title_left">
							<h3>店铺分类管理</h3>
						</div>
					</div>
					<div class="clearfix"></div>
					<div class="row">
						<div class="col-md-12 col-xs-12">
							<div class="x_panel">
								<div class="x_title">
									<h2>
										修改分类
									</h2>
									<ul class="nav navbar-right panel_toolbox">
										<li><a class="collapse-link"><i
												class="fa fa-chevron-up"></i></a></li>
<!-- 										<li class="dropdown"><a href="#" class="dropdown-toggle"
											data-toggle="dropdown" role="button" aria-expanded="false"><i
												class="fa fa-wrench"></i></a>
											<ul class="dropdown-menu" role="menu">
												<li><a href="#">Settings 1</a></li>
												<li><a href="#">Settings 2</a></li>
											</ul></li> -->
										<li><a class="close-link"><i class="fa fa-close"></i></a>
										</li>
									</ul>
									<div class="clearfix"></div>
								</div>
								<div class="x_content">
									<br />
									<div class="col-md-8">
										<form action="cateLine_update" class="form-horizontal form-label-left">
											<div class="">
												<div class="form-group">
													<label class="control-label col-md-3 col-sm-3 col-xs-12">名&nbsp;&nbsp;&nbsp;&nbsp;称</label>
													<div class="col-md-6 col-sm-9 col-xs-12">
														<input type="text" class="form-control" name="calName" value="${root.calName}" placeholder="请输入分类名称">
													</div>
												</div>
												
												<div class="form-group">
													<label class="control-label col-md-3 col-sm-3 col-xs-12">权&nbsp;&nbsp;&nbsp;&nbsp;重</label>
													<div class="col-md-6 col-sm-9 col-xs-12">
														<input type="text" class="form-control" name="calAuth" value="${root.calAuth}" placeholder="请输入权重值（数值越大权重越高）">
													</div>
												</div>
												
												<div class="form-group">
													<label class="control-label col-md-3 col-sm-3 col-xs-12">父分类</label>
													<div class="col-md-6 col-sm-9 col-xs-12">
														<select class="form-control" name="calPid" id="busCateId">
															<c:forEach var="roots" items="${roots}">
																<c:if test="${roots.calId == root.calPid}">
																	<option value="${roots.calId}" selected="selected">${roots.calName}</option>
																</c:if>
																<c:if test="${roots.calId != root.calPid}">
																	<option value="${roots.calId}">${roots.calName}</option>
																</c:if>
															</c:forEach>
														</select>
													</div>
												</div>
												
												<div class="form-group">
													<label class="control-label col-md-3 col-sm-3 col-xs-12">启&nbsp;&nbsp;&nbsp;&nbsp;用</label>
													<div class="col-md-9 col-sm-9 col-xs-12">
														<div class="radio">
															<label> 
																<c:if test="${root.calStatus == 1}">
																	<input type="radio" class="flat" checked name="calStatus" value="1"> 启用
			                          								<input type="radio" class="flat" name="calStatus" value="-1"> 不启用
																</c:if>
																<c:if test="${root.calStatus == -1}">
																	<input type="radio" class="flat" name="calStatus" value="1"> 启用
			                          								<input type="radio" class="flat" checked name="calStatus" value="-1"> 不启用
																</c:if>
															</label>
														</div>
													</div>
												</div>
											</div>
											
											<div class="ln_solid"></div>
											<div class="form-group">
												<div class="col-md-6 col-sm-9 col-xs-12 col-md-offset-3">
													<input type="hidden" name="calId" value="${root.calId}"/>
													<button type="submit" class="btn btn-success" style="float:right;margin-right:0;">提交</button>
												</div>
											</div>
										</form>
									</div>
									<!-- <div class="col-md-4">
										<label class="control-label col-md-3 col-sm-3 col-xs-12">图&nbsp;&nbsp;&nbsp;&nbsp;标</label>
										<div class="col-md-9">
											<form id="fileupload-form">
											     <input id="fileupload" type="file" name="file" >
											     <img style="width:100%" alt="" id="theImg" src=""/> 
											</form>
											<form action="#" id="fileupload-form" method="post" class="dropzone" enctype="multipart/form-data"></form>
						                    <br />
						                    <br />
										</div>
					                    
									</div> -->
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- /page content -->

			<!-- footer content -->
			<footer>
				<jsp:include page="footer.jsp" />
			</footer>
			<!-- /footer content -->
		</div>
	</div>

	<!-- jQuery -->
	<script src="./vendors/jquery/dist/jquery.min.js"></script>
	<!-- Bootstrap -->
	<script src="./vendors/bootstrap/dist/js/bootstrap.min.js"></script>
	<!-- FastClick -->
	<script src="./vendors/fastclick/lib/fastclick.js"></script>
	<!-- NProgress -->
	<script src="./vendors/nprogress/nprogress.js"></script>
	<!-- jQuery custom content scroller -->
	<script src="./vendors/malihu-custom-scrollbar-plugin/jquery.mCustomScrollbar.concat.min.js"></script>
	<!-- Dropzone.js -->
    <script src="./vendors/dropzone/dist/min/dropzone.min.js"></script>
	<!-- bootstrap-progressbar -->
	<script
		src="./vendors/bootstrap-progressbar/bootstrap-progressbar.min.js"></script>
	<!-- iCheck -->
	<script src="./vendors/iCheck/icheck.min.js"></script>
	<!-- bootstrap-daterangepicker -->
	<script src="./vendors/moment/min/moment.min.js"></script>
	<script src="./vendors/bootstrap-daterangepicker/daterangepicker.js"></script>
	<!-- bootstrap-wysiwyg -->
	<script src="./vendors/bootstrap-wysiwyg/js/bootstrap-wysiwyg.min.js"></script>
	<script src="./vendors/jquery.hotkeys/jquery.hotkeys.js"></script>
	<script src="./vendors/google-code-prettify/src/prettify.js"></script>
	<!-- jQuery Tags Input -->
	<script src="./vendors/jquery.tagsinput/src/jquery.tagsinput.js"></script>
	<!-- Switchery -->
	<script src="./vendors/switchery/dist/switchery.min.js"></script>
	<!-- Select2 -->
	<script src="./vendors/select2/dist/js/select2.full.min.js"></script>
	<!-- Parsley -->
	<script src="./vendors/parsleyjs/dist/parsley.min.js"></script>
	<!-- Autosize -->
	<script src="./vendors/autosize/dist/autosize.min.js"></script>
	<!-- jQuery autocomplete -->
	<script
		src="./vendors/devbridge-autocomplete/dist/jquery.autocomplete.min.js"></script>
	<!-- starrr -->
	<script src="./vendors/starrr/dist/starrr.js"></script>
	<!-- Custom Theme Scripts -->
	<script src="./build/js/custom.min.js"></script>
	<script type="text/javascript"
		src="http://api.map.baidu.com/api?v=2.0&ak=cVhx3uWyeevirtDxTzlz0GofE0qWHbR9"></script>
		
	<script type="text/javascript">
		//绑定了`submit`事件。    
	    $('#fileupload-form').on('submit',(function(e) {
	    alert("asdfad");
	        e.preventDefault();
	        //序列化表单   
	       var serializeData = $(this).serialize();
	
	       // var formData = new FormData(this);
	       $.ajax({
	            type:'POST',
	            url: '<%=basePath%>saveImg',
	            dataType: 'json',
	            data: serializeData,            
	            // data: formData,
	
	            //attention!!!   
	            contentType: false,      
	            cache: false,             
	            processData:false,      
	
	            beforeSubmit: function() {
	                    //上传图片之前的处理   
	            },
	            uploadProgress: function (event, position, total, percentComplete){ 
	                //在这里控制进度条   
	            },
	            success:function(){
	
	            },
	            error:function(data){
	                alert('上传图片出错');
	            }
	        });
	    }));
	
	    //绑定文件选择事件，一选择了图片，就让`form`提交。   
	
	    $("#fileupload").on("change", function() {
	    	
	        if (this.files && this.files[0]) {
		       var reader = new FileReader();            
		       reader.onload = function (e) {
		            $('#theImg').attr('src', e.target.result);
		        }
		       reader.readAsDataURL(this.files[0]);
		   }
		   $(this).parent().submit();
		  
	    });
	</script>
</body>
</html>
