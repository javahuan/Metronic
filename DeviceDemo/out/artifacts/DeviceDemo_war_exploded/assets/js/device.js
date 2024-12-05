var module="device";
var sub="file";
document.domain="localhost";
/*================================================================================*/
jQuery(document).ready(function() {
	Metronic.init(); // init metronic core components
	Layout.init(); // init current layout
	QuickSidebar.init(); // init quick sidebar
	Demo.init(); // init demo features
	Page.init();
});
/* ================================================================================ */
//关于页面的控件生成等操作都放在Page里
var Page = function() {
	/*----------------------------------------入口函数  开始----------------------------------------*/
	var initPageControl=function(){
		pageId=$("#page_id").val();
		if(pageId=="device_list"){
			initDeviceList();
		}
		if(pageId=="device_add"){
			initDeviceAdd();
		}
		if(pageId=="device_modify"){
			initDeviceModify();
		}
		if(pageId=="device_file"){
			initDeviceFile();
		}
		if(pageId=="device_view"){
			initDeviceView();
		}
        if(pageId=="device_list_print_word"){
            initDeviceListPrintWord();
        }
        if(pageId=="device_list_print_table"){
            initDeviceListPrintTable();
        }
        if(pageId=="device_statistic"){
            initDeviceStatistic();
        }
	};
	/*----------------------------------------入口函数  结束----------------------------------------*/
	var columnsData=undefined;
	var recordResult=undefined;
   var  chartData=[{
        "year": 2009,
        "income": 23.5,
        "expenses": 18.1
    }, {
       "year": 2010,
       "income": 26.2,
       "expenses":22.8
   },{
        "year": 2011,
       "income": 30.1,
       "expenses": 23.9
    }, {
       "year": 2012,
       "income": 29.5,
       "expenses": 25.1
   },{  "year": 2013,
       "income": 30.6,
       "expenses": 27.2,
       "dashLengthLine":5
    },{
        "year": 2014,
        "income": 34.1,
       "expenses": 29.9,
       "dashLengthColumn":5,
       "alpha": 0.2,
       "additional":"(projection)"
    }];
	/*----------------------------------------业务函数  开始----------------------------------------*/
	/*------------------------------针对各个页面的入口  开始------------------------------*/
	var initDeviceList=function(){
		initDeviceListControlEvent();
		initDeviceRecordList();
	}
	var initDeviceAdd=function(){
		initDeviceAddControlEvent();
	}
	var initDeviceModify=function(){
		initDeviceModifyControlEvent();
		initDeviceRecordView();
	}
	var initDeviceFile=function(){
		console.log("[initDeviceFile]");
		initDeviceFileControlEvent();
		initDeviceFileView();
	}
	var initDeviceView=function () {
		initDeviceViewControlEvent();
		initDeviceRecordView();
	}
    var initDeviceListPrintWord=function () {
        initDeviceListPrintWordControlEvent();
        initDeviceListPrintWordRecord();
    }
    var initDeviceListPrintTable=function () {
       // initDeviceFileControlEvent();
        initDeviceListPrintTableRecord();
    }
    var initDeviceStatistic=function () {
        //initDeviceRecordView();
        $.ajaxSettings.async=false;
        initDeviceStatisticRecord();
        //堵塞的执行完上面的语句才会执行下面的语句
        $.ajaxSettings.async=true;
        initBarChart();

    }
	/*------------------------------针对各个页面的入口 结束------------------------------*/
	var getUrlParam=function(name){
		//获取url中的参数
		var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)"); //构造一个含有目标参数的正则表达式对象
		var r = window.location.search.substr(1).match(reg);  //匹配目标参数
		if (r != null) return decodeURI(r[2]); return null; //返回参数值，如果是中文传递，就用decodeURI解决乱码，否则用unescape
	}
	var initDeviceListControlEvent=function(){
		$("#help_button").click(function() {help();});
		$('#add_button').click(function() {onAddRecord();});
		$('#datatable_button').click(function() {onDatatableTab();});
		$('#table_button').click(function() {onTableTab();});
		$('#bar_button').click(function() {onBarTab();});
		$('#record_modify_div #submit_button').click(function() {onModifyDivSubmit();});
		$('#record_add_div #submit_button').click(function() {onAddDivSubmit();});
		$('#query_button').click(function() {onQueryRecord();});
        $('#export_button').click(function() {onExportRecord();});
        $('#word_print_button').click(function() {onWordPrintRecord();});
        $('#table_print_button').click(function() {onTablePrintRecord();});
        $('#statistic_button').click(function() {onStatisticRecord();});

    }
	var initDeviceAddControlEvent=function(){
		$("#help_button").click(function() {help();});
		$('#add_button').click(function() {submitAddRecord();});
	}
	var initDeviceModifyControlEvent=function(){
		$("#help_button").click(function() {help();});
		$('#modify_button').click(function() {submitModifyRecord();});
	}
	var initDeviceViewControlEvent=function () {
		$("#help_button").click(function() {help();});
		$('#return_button').click(function() {returnBack();});

	}
	var initDeviceListPrintWordControlEvent=function () {

	}
	var initDeviceRecordView=function(){
		var id=getUrlParam("id");
		var data={};
		data.action="get_device_record";
		data.id=id;
		$.post("../../"+module+"_"+sub+"_servlet_action",data,function(json){
			console.log(JSON.stringify(json));
			if(json.result_code==0){
				var list=json.aaData;
				if(list!=undefined && list.length>0){
					for(var i=0;i<list.length;i++){
						var record=list[i];
						$("#device_id").val(record.record_id);
						$("#device_name").val(record.vehicle_type);
					}
				}
			}
		})
	}
	var initDeviceListPrintWordRecord=function () {
		var url="../../device_file_servlet_action";
		var data={"action":"get_device_record"};
		$.post(url,data,function(json){
			var html="";
			if(json.result_code==0) {
				console.log(JSON.stringify(json));
				var list = json.aaData;
				if (list != undefined && list.length > 0) {

					for (var i = 0; i < list.length; i++) {
						var record = list[i];
						html = html + "<tr style='mso-yfti-irow:1'>";
						html = html + " <td width=63 valign=top style='width:47.3pt;border:solid black 1.0pt;";
						html = html + " border-top:none;mso-border-top-alt:solid black .5pt;mso-border-alt:solid black .5pt;";
						html = html + "padding:0cm 5.4pt 0cm 5.4pt'>";
						html = html + " <p class=MsoNormal><span lang=EN-US>"+record.record_id+"</span></p>";
						html = html + " </td>";
						html = html + " <td width=105 valign=top style='width:78.6pt;border-top:none;border-left:";
						html = html + "none;border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;";
						html = html + "mso-border-top-alt:solid black .5pt;mso-border-left-alt:solid black .5pt;";
						html = html + "mso-border-alt:solid black .5pt;padding:0cm 5.4pt 0cm 5.4pt'>";
						html = html + "<p class=MsoNormal><span lang=EN-US>"+record.vehicle_type+"</span></p>";
						html = html + " </td>";
						html = html + " <td width=132 valign=top style='width:99.25pt;border-top:none;border-left:";
						html = html + "none;border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;";
						html = html + "mso-border-top-alt:solid black .5pt;mso-border-left-alt:solid black .5pt;";
						html = html + "mso-border-alt:solid black .5pt;padding:0cm 5.4pt 0cm 5.4pt'>";
						html = html + " <p class=MsoNormal><span lang=EN-US>"+record.speed+"</span></p>";
						html = html + " </td>";
						html = html + " <td width=123 valign=top style='width:92.1pt;border-top:none;border-left:";
						html = html + "none;border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;";
						html = html + "mso-border-top-alt:solid black .5pt;mso-border-left-alt:solid black .5pt;";
						html = html + "mso-border-alt:solid black .5pt;padding:0cm 5.4pt 0cm 5.4pt'>";
						html = html + " <p class=MsoNormal><span lang=EN-U5>"+record.capture_time+"</span></p>";
						html = html + " </td>";
						html = html + " <td width=142 valign=top style='width:106.35pt;border-top:none;border-left:";
						html = html + "none;border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;";
						html = html + "mso-border-top-alt:solid black .5pt;mso-border-left-alt:solid black .5pt;";
						html = html + "mso-border-alt:solid black .5pt;padding:0cm 5.4pt 0cm 5.4pt'>";
						html = html + "<p class=MsoNormal><span lang=EN-U5>"+record.checked+"</span></p>";
						html = html + " </td>";
						html = html + " </tr>";
					}
				}
			}else{
				alert("[onPrintRecord]与后端交互错误！"+json.result_smg);
			}
			$("#list_line_div").html(html);
		});
	}

	var initDeviceListPrintTableRecord=function () {
		$("#page_sidebar_wrapper").hide();
		$("#page_header").hide();
		$("#page_footer").hide();
		$("#page_content").attr("style","margin-left:0px");
		$("#page_container").attr("style","margin-top:0px");
		var url="../../device_file_servlet_action";
		var data={"action":"get_device_record"};
		$.post(url,data,function(json) {
			var html = "";
			if (json.result_code == 0) {
				console.log(JSON.stringify(json));
				var list = json.aaData;
				if(list!=undefined && list.length>0){
					for (var i = 0; i < list.length; i++) {
						var record = list[i];
						html = html + "                  <tr>";
						html = html + "						<td class=\"highlight\">";
						html = html + "						<div class=\"success\">";
						html = html + "						</div>";
						html = html + " 					<a href=\"javascript:;\">";
						html = html + "                " + record.record_id + "</a>";
						html = html + "                     </td>";
						html = html + "                    <td class=\"hidden-xs\">";
						html = html + "                   " + record.vehicle_type + "";
						html = html + "                     </td>";
						html = html + "                     <td>";
						html = html + "                     	"+record.capture_time+"";
						html = html + "                     </td>";
						html = html + "               </tr>";
					}
			}else{
					alert("[initDeviceListPrintTableRecord]与后端交互错误！"+json.result_smg);
				}
		    }
			$("#record_table_div").html(html);
	    });
	}
	var initDeviceStatisticRecord=function(){
        var url="../../device_file_servlet_action";
        var data={"action":"get_gps_receive_count_by_hour"};
        $.post(url,data,function (json) {
            var html="";
			//alert("[initDeviceStatisticRecord]！result_code="+json.result_code);
			if(json.result_code==0){
                console.log(JSON.stringify(json));
                var list=json.aaData;
                console.log(list);
                if(list != undefined && list.length>0 ){
                    changeResultDataToChartData(list ,chartData);
                    console.log(JSON.stringify(chartData));
					//alert("[initDeviceStatisticRecord]！result_code="+json.result_code);
                }
            }else{
                alert("[initDeviceStatisticRecord]与后端交互错误！"+json.result_smg);
            }
        });
    }
	var changeResultDataToChartData=function (list,chartData) {
		for(var i = 0; i < list.length; i++){
			list[i].time_interval=i;
			var json={"year":list[i].time_interval,"income":list[i].total,"expenses":list[i].total}
			chartData.push(json);
		}

	}
	var onTablePrintRecord=function(){
		window.location.href="device_list_print_table.jsp";

	}
	var onWordPrintRecord=function(){
		window.location.href="device_list_print_word.jsp";
	}
    var onStatisticRecord=function () {
        window.location.href="device_statistic.jsp";
    }
    var initBarChart=function (){
        var chart = AmCharts.makeChart("chart_1", {
            "type": "serial",
            "theme": "light",
            "pathToImages": Metronic.getGlobalPluginsPath() + "amcharts/amcharts/images/",
            "autoMargins": false,
            "marginLeft": 30,
            "marginRight": 8,
            "marginTop": 10,
            "marginBottom": 26,

            "fontFamily": 'Open Sans',
            "color":    '#888',

            "dataProvider": chartData,
            "valueAxes": [{
                "axisAlpha": 0,
                "position": "left"
            }],
            "startDuration": 1,
            "graphs": [{
                "alphaField": "alpha",
                "balloonText": "<span style='font-size:13px;'>[[title]] in [[category]]:<b>[[value]]</b> [[additional]]</span>",
                "dashLengthField": "dashLengthColumn",
                "fillAlphas": 1,
                "title": "Income",
                "type": "column",
                "valueField": "income"
            }, {
                "balloonText": "<span style='font-size:13px;'>[[title]] in [[category]]:<b>[[value]]</b> [[additional]]</span>",
                "bullet": "round",
                "dashLengthField": "dashLengthLine",
                "lineThickness": 3,
                "bulletSize": 7,
                "bulletBorderAlpha": 1,
                "bulletColor": "#FFFFFF",
                "useLineColorForBulletBorder": true,
                "bulletBorderThickness": 3,
                "fillAlphas": 0,
                "lineAlpha": 1,
                "title": "Expenses",
                "valueField": "expenses"
            }],
            "categoryField": "year",
            "categoryAxis": {
                "gridPosition": "start",
                "axisAlpha": 0,
                "tickLength": 0
            }
        });

        $('#chart_1').closest('.portlet').find('.fullscreen').click(function() {
            chart.invalidateSize();
        });

    }


	var onAddRecord=function(){
		$("#record_add_div").modal("show");
		//window.location.href="device_add.jsp";
	}
	var submitAddRecord=function(){
		var url="../../device_file_servlet_action";
		var data={};
		data.action="add_device_record";
		data.device_id=$("#device_id").val();
		data.device_name=$("#device_name").val();
		data.device_type=$("#device_type").val();
		//alert("速度是"+data.speed);
		$.post(url,data,function(json){
			if(json.result_code==0){
				alert("已经完成记录添加。");
				window.location.href="device_list.jsp";
			}
		});
	}
	var submitModifyRecord=function(){
		if(confirm("您确定要修改该记录吗？")){
			var id=getUrlParam("id");
			var url="../../device_file_servlet_action";
			var data={};
			data.action="modify_device_record";
			data.id=id;
			data.device_id=$("#device_id").val();
			data.device_name=$("#device_name").val();
			$.post(url,data,function(json){
				if(json.result_code==0){
					alert("已经完成记录修改。");
					window.location.href="device_list.jsp";
				}
			});
		}
	}

	
	var initDeviceRecordList=function(){
		getDeviceRecordList();
		getDeviceRecordDatatable();
		getDeviceRecordBar();
	}
	var initDeviceMobileRecord=function(){
		getDeviceMobileRecord();
	}
	var getDeviceRecordList=function(){
		var data={};
		data.id=$("#record_query_setup #id").val();
		data.device_id=$("#record_query_setup #device_id").val();
		data.device_name=$("#record_query_setup #device_name").val();
		$.post("../../"+module+"_"+sub+"_servlet_action?action=get_device_record",data,function(json){
			// console.log(JSON.stringify(json));
			if(json.result_code==0){
				var list=json.aaData;
				var html="";
				if(list!=undefined && list.length>0){
					for(var i=0;i<list.length;i++){
						var record=list[i];
						html=html+"                                     <tr class=\"active\">";
						html=html+"                                        <td>";
						html=html+"                                          "+i;
						html=html+"                                        </td>";
						html=html+"                                        <td>";
						html=html+"                                          "+record.record_id;
						html=html+"                                        </td>";
						html=html+"                                        <td>";
						html=html+"                                          "+record.vehicle_type;
						html=html+"                                        </td>";
						html=html+"                                         <td>";
						html=html+"                                        <a href=\"javascript:Page.onModifyRecord("+record.id+")\">【修改记录】</a><a href=\"javascript:Page.onDeleteRecord("+record.id+")\">【删除记录】</a><div>";
						html=html+"                                        </td>";
						html=html+"                                      </tr>";
					}
				}
				$("#record_table_content_div").html(html);
			}
		})
	}
	var resultList=[];
	var getDeviceRecordDatatable=function(){
		resultList=[];
		$('.datatable').dataTable( {
			"paging":true,
			"searching":false,
			"oLanguage": {
				"aria": {
					"sortAscending": ": activate to sort column ascending",
					"sortDescending": ": activate to sort column descending"
				},
				"sProcessing":   "处理中...",
				"sLengthMenu":   "_MENU_ 记录/页",
				"sZeroRecords":  "没有匹配的记录",
				"sInfo":         "显示第 _START_ 至 _END_ 项记录，共 _TOTAL_ 项",
				"sInfoEmpty":    "显示第 0 至 0 项记录，共 0 项",
				"sInfoFiltered": "(由 _MAX_ 项记录过滤)",
				"sInfoPostFix":  "",
				"sSearch":       "过滤:",
				"oPaginate": {
					"sFirst":    "首页",
					"sPrevious": "上页",
					"sNext":     "下页",
					"sLast":     "末页"
				}
			},
			"aoColumns": [{"mRender": function(data, type, full) {
					sReturn = '<input type="checkbox" class="checkboxes" value="'+full.id+'"/>';
					return sReturn;
				},"orderable": false
			},{"mRender": function(data, type, full) {
					sReturn='<div>'+full.record_id+'</div>';
					return sReturn;
				},"orderable": false
			},{"mRender": function(data, type, full) {
					sReturn='<div>'+full.vehicle_type+'</div>';
					return sReturn;
				},"orderable": false
			},{"mRender": function(data, type, full) {
					sReturn='<div>'+full.speed+'</div>';
					return sReturn;
				},"orderable": false
			},{"mRender": function(data, type, full) {
					sReturn='<div>'+full.capture_time+'</div>';
					return sReturn;
				},"orderable": false
			}, {"mRender": function (data, type, full) {
				resultList.push(full);
					sReturn = '<div><a href="javascript:Page.onModifyRecord('+full.id+')">【修改记录】</a> <a href="javascript:Page.onDeleteRecord('+full.id+')">【删除记录】</a> <a href="javascript:Page.onViewRecord('+full.id+')">【查看详情】</a></div>';
					return sReturn;
				}, "orderable": false
			}],
			"aLengthMenu": [[5,10,15,20,25,40,50,-1],[5,10,15,20,25,40,50,"所有记录"]],
			"fnDrawCallback": function(){$(".checkboxes").uniform();$(".group-checkable").uniform();},
			//"sAjaxSource": "get_record.jsp"
			"sAjaxSource": "../../"+module+"_"+sub+"_servlet_action?action=get_device_record"
		});
		$('.datatable').find('.group-checkable').change(function () {
			var set = jQuery(this).attr("data-set");
			var checked = jQuery(this).is(":checked");
			jQuery(set).each(function () {
				if (checked) {
					$(this).attr("checked", true);
					$(this).parents('tr').addClass("active");
				} else {
					$(this).attr("checked", false);
					$(this).parents('tr').removeClass("active");
				}
			});
			jQuery.uniform.update(set);
		});
		$('.datatable').on('change', 'tbody tr .checkboxes', function () {
			$(this).parents('tr').toggleClass("active");
		});

	}
	var getDeviceRecordBar = function(){
		var data={};
		data.id=$("#record_query_setup #id").val();
		data.device_id=$("#record_query_setup #device_id").val();
		data.device_name=$("#record_query_setup #device_name").val();
		$.post("../../"+module+"_"+sub+"_servlet_action?action=get_device_record",data,function(json){
			//console.log(JSON.stringify(json));
			if(json.result_code==0){
				var list=json.aaData;
				var html="";
				if(list!=undefined && list.length>0){
					for(var i=0;i<list.length;i++){
						var record=list[i];
						html=html+"                                     <!-- Nested media object -->";
						html=html+"                               <div class=\"media\">";
						html=html+"                                   <a href=\"javascript:;\" class=\"pull-left\">";
						html=html+"                                      <img alt=\"\" src=\"../../assets/admin/pages/media/blog/5.jpg\" class=\"media-object\" style=\"width:50px;height:50px;border-radius:50% !important;\">";
						html=html+"                                   </a>";
						html=html+"                                   <div class=\"media-body\">";
						html=html+"                                      <h4 class=\"media-heading\">"+record.record_id+"<span>";
						html=html+"                                        "+record.capture_time+"<a href=\"javascript:;\">";
						// html=html+"                                          Reply </a>"
						html=html+"                                        </span>";
						html=html+"                                      </h4>";
						html=html+"                                      <p>";
						html=html+"                                           记录类型："+record.vehicle_type;
						html=html+"                                      </p>";
						html=html+"                                   </div>";
						html=html+"                                </div>";
						html=html+"                                <!--end media-->";
						html=html+"                                <hr>";
					}
				}
				$("#record_bar_div").html(html);
			}
		})

    }
	var onDeleteRecord = function(id){
		if(confirm("您确定要删除这条记录吗？")){
			if(id>-1){
				var url="../../device_file_servlet_action";
				var data={};
				data.action="delete_device_record";
				data.id=id;
				$.post(url,data,function(json){
					if(json.result_code==0){
						window.location.reload();
					}
				})
			}
		}
	};
	var onModifyRecord=function(id){
		//window.location.href="device_modify.jsp?id="+id;
		for(var i=0;i<resultList.length;i++)
		{
			if(id==resultList[i].id){
				$("#record_modify_div #id").val(resultList[i].id);
				$("#record_modify_div #device_id").val(resultList[i].record_id);
				$("#record_modify_div #device_name").val(resultList[i].vehicle_type);
				$("#record_modify_div").modal("show");
			}
		}

	}
	var initDeviceFileControlEvent=function(id){
		$('#jump_div #upload_button').click(function() {onJumpUploadFile();});
		$('#ajax_div #upload_button').click(function() {onAjaxUploadFile();});
		console.log("[initDeviceFileControlEvent]");
	}
	var initDeviceFileView=function(id){
		console.log("[initDeviceFileView]");
		getDeviceFile();
	}
	var getDeviceFile=function(){

	}
	var onJumpUploadFile=function(){
		console.log("[onJumpUploadFile]====");
		var deviceId=$("#device_id").val();
		var deviceName=$("#device_name").val();
		jump_form.action="../../device_file_servlet_action?action=upload_file&device_id="+deviceId+"&device_name="+deviceName;
		//jump_form.action="http://192.168.3.111:8888?action=upload_file&device_id="+deviceId+"&device_name="+deviceName;			/*设置提交到TCP工具来接收，TCP工具设置好监听端口例如8888和接收自动存入文件*/
		jump_form.submit();
	}
	//如果出现“No resource with given identifier found”，注意：在谷歌浏览器调试界面找到Network界面导航栏中找到Preserve log，把勾去掉就好了。
	//https://blog.csdn.net/m0_46296300/article/details/126130250
	//发送ajax请求后页面自动刷新的问题
	//https://blog.csdn.net/GCTTTTTT/article/details/123824126
	var onAjaxUploadFile=function(){
		console.log("[onAjaxUploadFile]====");
		var deviceId = $("#device_id").val();
		var deviceName = $("#device_name").val();
		var options = {
			type : 'post', /*设置表单以post方法提交*/
			url : '../../device_file_servlet_action?action=upload_file&device_id='+deviceId+"&device_name="+deviceName, /*设置post提交到的页面*/
			success : function(json) {
				console.log("[onAjaxUploadFile]上传文件返回结果="+JSON.stringify(json));
				if(json.upload_files.length>0){
					var files=json.upload_files;
					var fileUrl = files[0].file_url_name;
					var objectId = files[0].file_object_id;
					$("#current_attachment_name").html("您当前上传的附件第一个是：<span style='color:blue;'><a href='javascript:window.open(\""+fileUrl+"\")'>" + fileUrl + "</a></span>");
					$("#current_attachment_object_id").val(objectId);
					console.log("[onAjaxUploadFile]fileUrl="+fileUrl);
					console.log("[onAjaxUploadFile]objectId="+objectId);
				}else{
					alert("[onAjaxUploadFile]没有上传文件结果返回！");
				}
			},
			error : function(error) {
				alert(error);
			},
			dataType : "json" /*设置返回值类型为文本*/
		};
		$("#ajax_form").ajaxSubmit(options);
	}
	var onDatatableTab=function(){
		$("#datatable_tab").show();
		$("#table_tab").hide();
		$("#bar_tab").hide();
	}
	var onTableTab=function(){
		$("#datatable_tab").hide();
		$("#table_tab").show();
		$("#bar_tab").hide();

	}
	var onBarTab=function(){
		$("#datatable_tab").hide();
		$("#table_tab").hide();
		$("#bar_tab").show();

	}
	var onModifyDivSubmit=function () {
		$("#record_modify_div").modal("hide");
		submitModifyRecordDiv();
	}
	var submitModifyRecordDiv=function(){
		if(confirm("您确定要修改该记录吗？")){
			var url="../../device_file_servlet_action";
			var data={};
			data.action="modify_device_record";
			data.id=$("#record_modify_div #id").val();
			data.device_id=$("#record_modify_div #device_id").val();
			data.device_name=$("#record_modify_div #device_name").val();
			$.post(url,data,function(json){
				if(json.result_code==0){
					alert("已经完成记录修改。");
					window.location.reload();
				}
			});
		}
	}
	var onAddDivSubmit=function () {
		$("#record_add_div").modal("hide");
		submitAddRecordDiv();

	}
	var onQueryRecord=function () {
		initDeviceRecordList();
	}
	var onExportRecord=function () {
        var url="../../device_file_servlet_action";
        var data={"action":"export_device_record"};
        $.post(url,data,function (json) {
            if(json.result_code==0){
                //console.log(JSON.stringify(json));
                //两种放式
                //原来网页刷新
				// $("#record_download_div #download_url").attr("href",json.download_url);
                //跳转新页面刷新
				$("#record_download_div #download_url").attr("href","javascript:window.open('"+json.download_url+"')");
				$("#record_download_div").modal("show");

			}else{
                alert("[onExportRecord]与后端交互错误！"+json.result_smg);
            }

        });
    }
	var submitAddRecordDiv=function(){
		var url="../../device_file_servlet_action";
		var data={};
		data.action="add_device_record";
		data.device_id=$("#record_add_div #device_id").val();
		data.device_name=$("#record_add_div #device_name").val();
		data.device_type=$("#record_add_div #device_type").val();
		data.speed=$("#record_add_div #speed").val();
		$.post(url,data,function(json){
			if(json.result_code==0){
				alert("已经完成记录添加。");
				window.location.reload();
			}
		});
	}
	var onViewRecord=function (id) {
		window.location.href="device_view.jsp?id="+id;
	}
	var returnBack=function () {
		history.go(-1);

	}
	//Page return 开始
	return {
		init: function() {
			initPageControl();
		},
		onDeleteRecord:function(id){
			onDeleteRecord(id);
		},
		onModifyRecord:function(id){
			onModifyRecord(id);
		},
		onViewRecord:function (id) {
			onViewRecord(id);

		}

	}
}();//Page
/*================================================================================*/
