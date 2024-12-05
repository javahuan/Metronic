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
<!-- END HEADER -->
<%@include file="../../home/frame/frame_header.jsp"%>
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
			<!-- BEGIN PAGE HEADER-->
			<h3 class="page-title">
				记录信息 <small>车辆捕捉信息记录表</small>
			</h3>
			<!-- END PAGE HEADER-->
			<!-- BEGIN PAGE CONTENT-->
			<!--页面开始============================================================================================-->
			<input type="hidden" id="page_id" name="page_id" value="device_list_print_word">
			<div class="row">
				<table>
				<tr>
					<th width=63 valign=top style='width:46.8pt;border:solid black 1pt;
						border-top:none;mso-border-top-alt:solid black .5pt ;mso-border-alt:solid black .5pt;
						padding:0cm 5.4pt 0cm 5.4pt'>
						<p class=MsoNormal><span lang=EI-S>记录ID</span></p>
					</th>
					<th width=105 valign=top style='width:78.6pt ;border-top:none;border-left:
						none;border-bottom:solid black 1.0pt ;border-right:solid black 1.0pt;
						mso-border-top-alt:solid black .5pt ;mso-border-left-alt:solid black .5pt;
						mso-border-alt:solid black .5pt;padding:0cm 5.4pt 0cm 5.4pt'>
						<p class=MsoNormal><span lang=EI-US>记录类型</span></p>
					</th>
					<th width=132 valign=top style='width:98.8pt ;border-top:none;border-left:
						none;border-bottom:solid black 1.0pt ;border-right:solid black 1.0pt;
						mso-border-top-alt:solid black .5pt ;mso-border-left-alt:solid black .5pt;
						mso-border-alt:solid black .5pt;padding:0cm 5.4pt 0cm 5.4pt'>
						<p class=MsoNormal><span lang=EI-US>速度</span></p>
					</th>
					<th width=123 valign=top style='width:92.8pt ;border-top:none;border-left:
						none;border-bottom:solid black 1.0pt ;border-right:solid black 1.0pt;
						mso-border-top-alt:solid black .5pt ;mso-border-left-alt:solid black .5pt;
						mso-border-alt:solid black .5pt;padding:0cm 5.4pt 0cm 5.4pt'>
						<p class=MsoNormal><span lang=EI-US>记录时间</span></p>
					</th>
					<th width=142 valign=top style='width:105.8pt ;border-top:none;border-left:
						none;border-bottom:solid black 1.0pt ;border-right:solid black 1.0pt;
						mso-border-top-alt:solid black .5pt ;mso-border-left-alt:solid black .5pt;
						mso-border-alt:solid black .5pt;padding:0cm 5.4pt 0cm 5.4pt'>
						<p class=MsoNormal><span lang=EI-US>检查</span></p>
					</th>
				</tr>
				</table>
				<div id="list_line_div" name="list_line_div" >
					<!-- BEGIN SAMPLE TABLE PORTLET-->
					<tr style='mso-yfti-irow:1'>
<%--				旧的--%>
						<td width=63 valign=top style='width:47.3pt;border:solid black 1pt;
						border-top:none;mso-border-top-alt:solid black .5pt ;mso-border-alt:solid black .5pt;
						padding:0cm 5.4pt 0cm 5.4pt'>
						<p class=MsoNormal><span lang=EI-US></span></p>
						</td>
						<td width=105 valign=top style='width:78.6pt ;border-top:none;border-left:
						none;border-bottom:solid black 1.0pt ;border-right:solid black 1.0pt;
						mso-border-top-alt:solid black .5pt ;mso-border-left-alt:solid black .5pt;
						mso-border-alt:solid black .5pt;padding:0cm 5.4pt 0cm 5.4pt'>
						<p class=MsoNormal><span lang=EI-US></span></p>
					    </td>
                        <td width=132 valign=top style='width:78.6pt ;border-top:none;border-left:
						none;border-bottom:solid black 1.0pt ;border-right:solid black 1.0pt;
						mso-border-top-alt:solid black .5pt ;mso-border-left-alt:solid black .5pt;
						mso-border-alt:solid black .5pt;padding:0cm 5.4pt 0cm 5.4pt'>
                            <p class=MsoNormal><span lang=EI-US></span></p>
                        </td>
						<td width=123 valign=top style='width:78.6pt ;border-top:none;border-left:
						none;border-bottom:solid black 1.0pt ;border-right:solid black 1.0pt;
						mso-border-top-alt:solid black .5pt ;mso-border-left-alt:solid black .5pt;
						mso-border-alt:solid black .5pt;padding:0cm 5.4pt 0cm 5.4pt'>
							<p class=MsoNormal><span lang=EI-US></span></p>
						</td>
						<td width=142 valign=top style='width:78.6pt ;border-top:none;border-left:
						none;border-bottom:solid black 1.0pt ;border-right:solid black 1.0pt;
						mso-border-top-alt:solid black .5pt ;mso-border-left-alt:solid black .5pt;
						mso-border-alt:solid black .5pt;padding:0cm 5.4pt 0cm 5.4pt'>
							<p class=MsoNormal><span lang=EI-US></span></p>
						</td>
					</tr>
				</div>
					<!-- END SAMPLE TABLE PORTLET-->

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


