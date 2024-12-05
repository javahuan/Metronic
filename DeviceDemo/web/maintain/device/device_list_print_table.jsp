<%@ page language="java" contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en">
<!--<![endif]-->
<!-- BEGIN HEAD -->
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<head>
	<meta charset="utf-8"/>
	<title>管理系统</title>
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta content="width=device-width, initial-scale=1.0" name="viewport"/>
	<meta http-equiv="Content-type" content="text/html; charset=utf-8">
	<meta content="" name="description"/>
	<meta content="" name="author"/>
	<!-- BEGIN GLOBAL MANDATORY STYLES -->
	<%@include file="../../home/frame/frame_style.jsp"%>
	<link rel="stylesheet" type="text/css" href="dataTables.bootstrap.css" />
<%--	<link rel="stylesheet" type="text/css" href="bootstrap.min.css"/>--%>
</head>
<!-- END HEAD -->
<!-- BEGIN BODY -->
<body class="page-header-fixed page-quick-sidebar-over-content ">

<!-- BEGIN HEADER -->
<%@include file="../../home/frame/frame_header.jsp"%>
<!-- END HEADER -->

<div class="clearfix">
</div>

<!-- BEGIN CONTAINER -->
<div class="page-container">
	<!-- BEGIN SIDEBAR -->
	<%@include file="../../home/frame/frame_left_sidebar.jsp"%>
	<!-- END SIDEBAR -->

	<!-- BEGIN CONTENT -->
	<div class="page-content-wrapper">
		<div class="page-content">
			<%@include file="../../home/frame/frame_page_header.jsp"%>

			<!-- BEGIN PAGE HEADER-->
			<h3 class="page-title">
				记录信息 <small>记录信息表</small>
			</h3>
			<!-- END PAGE HEADER-->
			<!-- BEGIN PAGE CONTENT-->
			<!--页面开始============================================================================================-->
			<input type="hidden" id="page_id" name="page_id" value="device_list_print_table">
			<div class="row">
				<div class="col-md-6">
					<!-- BEGIN SAMPLE TABLE PORTLET-->
					<div class="portlet">
						<div class="portlet-title">
							<div class="caption">
								<i class="fa fa-bell-o"></i>记录表
							</div>
							<div class="tools">
								<a href="javascript:;" class="collapse">
								</a>
								<a href="#portlet-config" data-toggle="modal" class="config">
								</a>
								<a href="javascript:;" class="reload">
								</a>
								<a href="javascript:;" class="remove">
								</a>
							</div>
						</div>
						<div class="portlet-body">
							<div class="table-scrollable">
								<table class="table table-striped table-bordered table-advance table-hover">
									<thead>
									<tr>
										<th>
											<i class="fa fa-briefcase"></i> 记录ID
										</th>
										<th class="hidden-xs">
											<i class="fa fa-user"></i> 记录类型
										</th>
										<th>
											<i class="fa fa-shopping-cart"></i> 记录时间
										</th>
										<th>
										</th>
									</tr>
									</thead>
									<tbody id="record_table_div" name="record_table_div">
									<tr>
										<td class="highlight">
											<div class="success">
											</div>
											<a href="javascript:;">
												RedBull </a>
										</td>
										<td class="hidden-xs">
											Mike Nilson
										</td>
										<td>
											2560.60$
										</td>
									</tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>
					<!-- END SAMPLE TABLE PORTLET-->
				</div>
			</div>
			<!-- END PAGE CONTENT-->
		</div>
	</div>
    <!--页面结束============================================================================================-->

    <!-- END CONTENT -->

	<!-- BEGIN QUICK SIDEBAR -->
	<%@include file="../../home/frame/frame_right_sidebar.jsp"%>
	<!-- END QUICK SIDEBAR -->
</div>
<!-- END CONTAINER -->

<!-- BEGIN FOOTER -->
<%@include file="../../home/frame/frame_footer.jsp"%>
<!-- END FOOTER -->

<%@include file="../../home/frame/frame_javascript.jsp"%>

<script type="text/javascript" src="../../assets/js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="jquery.dataTables.min.js"></script>

</body>
<!-- END BODY -->
</html>


