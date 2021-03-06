<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>叽叽喳喳</title>
    <meta name="keywords" content="叽叽喳喳聊天平台">
    <meta name="description" content="叽叽喳喳聊天平台">
    <link rel="shortcut icon" href="../statics/img/favicon.ico"> <link href="../statics/css/bootstrap.min.css" rel="stylesheet">
    <link href="../statics/css/font-awesome.min.css" rel="stylesheet">
    <link href="../statics/css/plugins/jsTree/style.min.css" rel="stylesheet">
    <link href="../statics/css/animate.min.css" rel="stylesheet">
    <link href="../statics/css/style.min.css" rel="stylesheet">
    <link href="../statics/css/index.css" rel="stylesheet">
</head>
<body class="gray-bg">
    <div class="wrapper wrapper-content  animated fadeInRight">

        <div class="row">
            <div class="col-sm-12">

                <div class="ibox chat-view">

                    <div class="ibox-title">
                        <!-- <small class="pull-right text-muted">最新消息：2015-02-02 18:39:23</small> 聊天窗口 -->
	                    	<button type="button" class="indexSearchBtn btn btn-default btn-sm" id="friendSearchBtn" onclick="javascript:;">
	                                        	搜索 <i class="fa fa-search"></i> </button>
	                    	<input type="text" class="indexSearchContent form-control" name="userName" placeholder="请输入账号">
	                    	<a class="indexAdd btn btn-primary pull-right btn-sm" href="#"  role="button" onclick="showAddFrindBox()"><i class="fa fa-plus"></i>好友</a>
	                     	<a class="indexAdd btn btn-primary pull-right btn-sm" href="#"  role="button" onclick="showAddGroupBox()"><i class="fa fa-plus"></i>群组</a>                        
	                                             聊天窗口
                    </div>
                    <div class="ibox-content">
                        <div class="row">
                            <div class="col-md-9 ">
                                <div class="chat-discussion">
                                	<p>未选择聊天</p>
                                    <!-- 
                                    <div class="chat-message">
                                        <img class="message-avatar" src="../statics/img/a4.jpg" alt="">
                                        <div class="message">
                                            <a class="message-author" href="#"> 林依晨Ariel </a>
                                            <span class="message-date">  2015-02-02 11:12:36 </span>
                                            <span class="message-content">
											jQuery表单验证插件 - 让表单验证变得更容易
                                            </span>
                                        </div>
                                    </div>
                                     -->
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="chat-users">
                                    <div class="users-list">
                                    	<c:forEach items="${userList}" var="ulist" varStatus="userCount">
                                    		<div class="chat-user">
                                    			<span class="pull-right label label-primary">
                                    				<c:if test="${ulist.userState == 0}">离线</c:if>
                                    				<c:if test="${ulist.userState == 1}">在线</c:if>
                                    				<c:if test="${ulist.userState == 2}">忙碌</c:if>
                                    			</span>
	                                            <img class="chat-avatar" src="../statics/img/a1.jpg" alt="">
	                                            <div class="chat-user-name">
	                                                <a href="#">${ulist.userName}</a>
                                            	</div>
                                        	</div>
                                    	</c:forEach>
                                    </div>
                                </div>
                            </div>

                        </div>
                        <div class="row">
                            <div class="col-sm-12">
                                <div class="chat-message-form">

                                    <div class="form-group">
                                        <textarea class="form-control message-input" name="message" placeholder="输入消息内容，按回车键发送"></textarea>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <!-- 隐藏添加好友div -->
    <div class="search-box-msg" id="addFriend" style="display:none">
	   <form class="form-inline">
		  <div class="form-group">
			    <input type="text" class="form-control" name="fname" placeholder="请输入用户名">
		  </div>
			  <button type="button" class="btn btn-default btn-sm" id="searchBtn" onclick="javascript:;">
             	搜索 <i class="fa fa-search"></i>
         	  </button>
         	  <button type="button" class="btn btn-default btn-sm" id="clearBtn" onclick="javascript:;">
             	清空 
         	  </button>
         	  <button type="button" class="close"><span>x</span></button>
	    </form>
	    <div class="new-table-responsive">
	    	<div class="box-body table-responsive no-padding ">
	    		<table class="table table-hover" id="addFriendTable">
	    			<tr>
                       <th><input type="checkbox" name="" id="all"/></th>
                       <th>序号</th>
                       <th>用户名</th>
                       <th>手机</th>
                       <th>状态</th>
                       <th style="width: 100px;">操作</th>
                    </tr>
                    <%-- <c:forEach items="${allUser}" var="list" varStatus="allUserCount">
                    	<tr>
                    		<td>
								<input type="checkbox" name="checkValues" value="${list.user_id}" />
							</td>
							<td>${allUserCount.count}</td>
							<td>${list.user_name}</td>
							<td>${list.user_phone}</td>
							<td>
								<span class="pull-right label label-primary">
									<c:if test="${list.status == 0}">离线</c:if>	
									<c:if test="${list.status == 1}">在线</c:if>	
									<c:if test="${list.status == 2}">忙碌</c:if>		
								</span>
							</td>
							<td>
								<c:if test="${list.status != 0}">
									<a class="btn btn-primary pull-right btn-sm" href="#"  role="button"><i class="fa fa-plus"></i></a>
								</c:if>	
							</td>
                    	</tr>
                    </c:forEach> --%>
	    		</table>
	    	</div>
	    </div>
    </div>
    
    <!-- 隐藏创建群聊div -->
    <div class="search-box-msg" id="addGroupChat" style="display:none">
	   <form class="form-inline">
		  <div class="form-group">
			    <input type="text" class="form-control" name="fname" placeholder="请输入用户名">
		  </div>
			  <button type="button" class="btn btn-default btn-sm" id="searchBtn" onclick="javascript:;">
             	搜索 <i class="fa fa-search"></i>
         	  </button>
         	  <button type="button" class="btn btn-default btn-sm" id="clearBtn" onclick="javascript:;">
             	清空 
         	  </button>
         	  <button type="button" class="close"><span>x</span></button>
	    </form>
	    <div class="new-table-responsive">
	    	<div class="box-body table-responsive no-padding ">
	    		<table class="table table-hover">
	    			<tr>
                       <th><input type="checkbox" name="" id="all"/></th>
                       <th>序号</th>
                       <th>用户名</th>
                       <th>手机</th>
                       <th>状态</th>
                       <th style="width: 100px;">操作</th>
                    </tr>
	    		</table>
	    	</div>
	    </div>
    </div>
    <script src="../statics/jquery/jquery-2.2.3.min.js"></script>
    <script src="../statics/bootstrap/js/bootstrap.min.js"></script>
    <script src="../statics/bootstrap/js/bootstrap.js"></script>
    <script src="../statics/js/content.min.js"></script>
    <script src="../statics/dialog/jquery-confirm.min.js"></script>
    <script>
	    function showAddFrindBox() {
	    	$("#addFriend").show();
		};
		
		function showAddGroupBox() {
	    	$("#addGroupChat").show();
		};
		function showAddGroupBox() {
	    	$("#addGroupChat").show();
		};
		$("#clearBtn").click(function(){
			$("#addFriend input[type='text']").val("");
		});
		$(".close").click(function(){
	        $(".search-box-msg").hide();
	        $("#addFriend input[type='text']").val("");
	        $("#addFriendTable  tr:not(:first)").html("");
	    });
		$("#friendSearchBtn").click(function(){
	        var userName=$("input[name='userName']").val();
	        $.ajax({
	            type : 'post',
	            url : '${pageContext.request.contextPath}/userManageService/searchFriend.do',
	            contentType : 'application/json',
	            data : JSON.stringify({
	                "userName":userName
	            }),
	            cache : false,
	            sync : true,
	            success : function(data) {
	                if (200 == data.resultCode) {
	                	
	                } else {
	                		warmMessage(data.resultMsg);
	                }
	            },
	            error : function() {
	            	warmMessage("请求失败!");
	            }

	        });
	    });
		$("#searchBtn").click(function(){
	        var userName=$("input[name='fname']").val();
	        $.ajax({
	            type : 'post',
	            url : '${pageContext.request.contextPath}/userManageService/searchUser.do',
	            contentType : 'application/json',
	            data : JSON.stringify({
	                "userName":userName
	            }),
	            cache : false,
	            sync : true,
	            success : function(data) {
	                if (200 == data.resultCode) {
	                	var userLsit = data.extend.allUser;
	                	var tempHtml = "";
	                	for(var i = 0; i< userLsit.length; i++)
	                	{
	                		tempHtml += "<tr><td><input type='checkbox' name='checkValues' value='" + userLsit[i]["user_id"] +"' /></td>";
	                		tempHtml += "<td>" + i + "</td>";
	                		tempHtml += "<td>" + userLsit[i]["user_name"] + "</td>";
	                		tempHtml += "<td>" + userLsit[i]["user_phone"] + "</td>";
	                		if(userLsit[i]["status"] == 0)
	                		{
	                			tempHtml += "<td><span class='pull-left label label-primary'>离线</span></td>";
	                		}
	                		else if(userLsit[i]["status"] == 1)
	                		{
	                			tempHtml += "<td><span class='pull-left label label-primary'>在线</span></td>";
	                		}
	                		else if(userLsit[i]["status"] == 2)
	                		{
	                			tempHtml += "<td><span class='pull-left label label-primary'>忙碌</span></td>";
	                		}
	                		if(userLsit[i]["status"] == 0)
	                		{
	                			tempHtml += "<td><a class='btn btn-primary pull-left btn-xs' href='#'  role='button'><i class='fa fa-plus'></i></a></td></tr>";
	                		}
	                		$("#addFriendTable  tr:not(:first)").html("");
	                		$("#addFriendTable").append(tempHtml);
	                	}
	                	
	                } else {
	                		$("#addFriendTable  tr:not(:first)").html("");
	                		warmMessage(data.resultMsg);
	                }
	            },
	            error : function() {
	            	warmMessage("请求失败!");
	            }

	        });
	    });
		function warmMessage(msg){
			var d=$.dialog({
		         content: '<div style="text-align:center;" class="text-center">'+msg+'</div>',
		         top: '10%',
		         left: '50%',
		         title: false, // hides the title.
		         closeIcon: false, // hides the close icon.
		         columnClass: 'xsmall',
		         onOpen: function(){
		             setTimeout(function(){
		                 d.close();
		             }, 400);
		         }
		   });
		}
    </script>
</body>

</html>
