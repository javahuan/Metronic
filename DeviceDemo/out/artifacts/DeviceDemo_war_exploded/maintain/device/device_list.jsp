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
				设备信息 <small>管理设备信息表</small>
			</h3>
			<div class="page-bar">
				<ul class="page-breadcrumb">
					<li>
						<i class="fa fa-home"></i>
						<a href="index.html">Home</a>
						<i class="fa fa-angle-right"></i>
					</li>
					<li>
						<a href="#">Data Tables</a>
						<i class="fa fa-angle-right"></i>
					</li>
					<li>
						<a href="#">Basic Datatables</a>
					</li>
				</ul>
				<div class="page-toolbar">
					<div class="btn-group pull-right">
						<button type="button" class="btn btn-fit-height grey-salt dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-delay="1000" data-close-others="true">
							Actions <i class="fa fa-angle-down"></i>
						</button>
						<ul class="dropdown-menu pull-right" role="menu">
							<li>
								<a href="#">Action</a>
							</li>
							<li>
								<a href="#">Another action</a>
							</li>
							<li>
								<a href="#">Something else here</a>
							</li>
							<li class="divider">
							</li>
							<li>
								<a href="#">Separated link</a>
							</li>
						</ul>
					</div>
				</div>
			</div>
			<!-- END PAGE HEADER-->
			<!-- BEGIN PAGE CONTENT-->
			<!--页面开始============================================================================================-->
			<input type="hidden" id="page_id" name="page_id" value="device_list">
			<div class="row">
				<div class="col-md-6">
					<button type="button" class="btn btn-primary" id="add_button" name="add_button">添加</button>
                    <button type="button" class="btn btn-primary" id="query_button" name="query_button">查询</button>
					<button type="button" class="btn btn-primary" id="export_button" name="export_button">导出</button>
					<button type="button" class="btn btn-primary" id="word_print_button" name="word_print_button">Word打印</button>
					<button type="button" class="btn btn-primary" id="table_print_button" name="table_print_button">Table打印</button>
					<button type="button" class="btn btn-primary" id="statistic_button" name="statistic_button">统计</button>
				</div>
			</div>

			<div class="row">
				<div class="col-md-6">
					<div class="portlet-body form" id="record_query_setup" name="record_query_setup">
						<form class="form-horizontal" role="form">
							<div class="form-body">
								<div class="form-group">
									<label class="col-md-3 control-label">ID</label>
									<div class="col-md-9">
										<input type="text" class="form-control" id="id" name="id" placeholder="Enter text">
									</div>
								</div>
								<div class="form-group">
									<label class="col-md-3 control-label">记录编号</label>
									<div class="col-md-9">
										<input type="text" class="form-control" id="device_id" name="device_id" placeholder="Enter text">
									</div>
								</div>

								<div class="form-group">
									<label class="col-md-3 control-label">记录类型</label>
									<div class="col-md-9">
										<input type="text" class="form-control" id="device_name" name="device_name" placeholder="Enter text">
									</div>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>

			<div class="row">
                <div class="col-md-8">


					<button type="button" class="btn btn-primary" id="datatable_button" name="datatable_button">切换到DataTable</button>
					<button type="button" class="btn btn-primary" id="table_button" name="table_button">切换到自定义Table</button>
					<button type="button" class="btn btn-primary" id="bar_button" name="bar_button">切换到自定义大横条</button>
				</div>
            </div>

			<div class="row" id="datatable_tab">
				<div class="col-md-6">

					<table class="table table-striped table-bordered table-hover datatable" id="record_list">
						<thead>
						<tr>
							<th class="table-checkbox"> <input type="checkbox" class="group-checkable" data-set="#record_list .checkboxes" /> </th>
							<th>记录ID</th>
							<th>类型</th>
							<th>速度</th>
							<th>捕捉时间</th>
							<th>操作</th>
						</tr>
						</thead>
					</table>
				</div>
			</div>

			<div class="row display-none" id="bar_tab">
				<div class="col-md-6">
					<!-- Nested media object -->
					<div id="record_bar_div" name="record_bar_div">
					</div>
					<!--end media-->
				</div>
            </div>

			<div class="row display-none" id="table_tab">
				<div class="col-md-6">
					<!-- BEGIN SAMPLE TABLE PORTLET-->
					<div class="portlet box blue">
						<div class="portlet-title">
							<div class="caption">
								<i class="fa fa-comments"></i>设备数据表
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
								<table class="table table-bordered table-hover">
									<thead>
									<tr>
										<th>
											id
										</th>
										<th>记录ID
										</th>
										<th>
											记录类型
										</th>
										<th>
											操作
										</th>
									</tr>
									</thead>
									<tbody id="record_table_content_div" name="record_table_content_div">
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
<%@include file="device_modify_div.jsp"%>
<%@include file="device_add_div.jsp"%>
<%@include file="device_download_div.jsp"%>


