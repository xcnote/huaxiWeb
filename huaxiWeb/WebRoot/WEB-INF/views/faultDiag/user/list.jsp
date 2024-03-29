 <%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}" />

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <title>用户列表</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<link rel="stylesheet" type="text/css" href="${ctx }/css/faultDiag/style.css">
	<script type="text/javascript" src="${ctx }/js/jquery-1.10.2.min.js"></script>
	<style type="text/css">
		html,body{
			height:100%;
			}
		html{
			overflow:hidden;
			}
		body{
			overflow:auto;
			background-color:#fbfbfb;
			}
	</style>
  </head>
  
 <body style="overflow:auto; background-color:#fbfbfb;">
<div class="address">
    <div class="space_left">&nbsp;</div>
    <div class="house"><img src="${ctx}/images/faultDiag/house.png"></div>
    <div class="address_infor">当前位置：<a href="#" onFocus="blur()">用户管理</a></div>
    <div class="time">&nbsp;&nbsp;&nbsp;&nbsp;</div>
</div>
<div class="list">
    <div class="list_case">
    	<c:if test="${!empty messageOK}">
    		<div class="flash notice">${messageOK }</div>
    	</c:if>
    	<c:if test="${!empty messageErr}">
    		<div class="flash error">${messageErr }</div>
    	</c:if>
    	<form action="${ctx }/admin/faultDiag/user/list" method="post" id="findForm">
	        <div class="list_title">
	            <div class="st_title">查询类别</div>
	            <div class="st_text">
	            	<select name="queryName">
	                    <option value="">请选择</option>
	                    <option value="username">登录名</option>
			            <option value="realname">真实姓名</option>
	                </select>
	                <script type="text/javascript">
			        	$("select[name='queryName']").val("${queryName}");
			        </script>
	            </div>
	            <div class="key">关键字</div>
	            <div class="txt"><input type="text" name="queryValue" value="${queryValue }" /></div>
	            <div class="button"><a href="javascript:gotoPage(0);" onfocus="blur()"><img src="${ctx}/images/faultDiag/search_button.png" /></a></div>
			    <div class="button"><a href="javascript:location.href='${ctx}/admin/faultDiag/user/add';" onfocus="blur()"><img src="${ctx}/images/faultDiag/add_button.png" /></a></div>
	            <div class="button"><a href="javascript:del();" onfocus="blur()"><img src="${ctx}/images/faultDiag/del_button.png" /></a></div>
	            <input type="hidden" name="page.page" id="pageNo" value="${page.number+1}"/>
	        </div>
        </form>
        <div class="list_table">
        	<form action="${ctx }/admin/faultDiag/user/delete" id="myForm" method="post">
	            <table width="98%" align="center" border="0" cellpadding="0" cellspacing="0" class="tab">
	              <tr class="th_sty">
		          	<td nowrap="nowrap" width="10%">全选&nbsp;<input name="selAll" id="all" type="checkbox" onClick="selectAll(this)" /></td>
		          	<td nowrap="nowrap" width="20%">登录名</td>
		          	<td nowrap="nowrap" width="20%">真实姓名</td>
		          	<td nowrap="nowrap" width="20%">联系电话</td>
		          	<td nowrap="nowrap" width="20%">管理员类别</td>
		          	<td nowrap="nowrap" width="15%">操作</td>
		       	  </tr>
		         <c:forEach items="${page.content }" var="user">
			      <tr>
			      	<td>
			       		<input type="checkbox" name="idGroup" value="${user.id }" />
			      	</td>
			       	<td>${user.username }&nbsp;</td>
			       	<td>${user.realname }&nbsp;</td>
			       	<td>${user.phone }&nbsp;</td>
			       	<td>
				       	<c:if test="${user.type == 1}">
					       	超级管理员
				       	</c:if>
				       	<c:if test="${user.type == 0 }">
				       		一般用户（不可控制）
				       	</c:if>
			       	</td>
			       	<td><a href="${ctx }/admin/faultDiag/user/edit/${user.id}">编辑</a>&nbsp;</td>
			      </tr>
		       	 </c:forEach> 
	            </table>
            </form>
        </div>
    </div>
    <div style="clear:both; height:15px; line-height:15px;">
   	 <jsp:include page="../page.jsp"></jsp:include>
    </div>
    
</div>
</body>
</html>
<script type="text/javascript" src="${ctx }/js/dataformat.js"></script>
<script type="text/javascript">
<!--
	$(document).ready(function() {
		var w = $(window).width();
		if($.support.boxModel){
			$(".list_table table").css("width",w-20);
		}else{
			if(w > 0){
				$(".list_table table").css("width",w-20);
			}else{
				$(".list_table table").css("width","96%");
				var ltw1 = $(".list_table").width();
				$(".address").css("width",ltw1+20);
			}
		}
		$(window).resize(function() {
			var width = $(window).width();
			if($.support.boxModel){
				$(".list_table table").css("width",width-20);
			}else{
				if(width > 0){
					$(".list_table table").css("width",width-20);
				}else{
					$(".list_table table").css("width","96%");
					var ltw = $(".list_table").width();
					$(".address").css("width",ltw+20);
				}
			}
		});
	});
	
	function selectAll(c){
		if(c.checked){
			$("[name='idGroup']").attr("checked",true);
		}else{
			$("[name='idGroup']").attr("checked",false);
		}
	}
	
	function del(){
		if($("[name='idGroup']:checked").length <= 0){
			alert("请选择一个您要删除的！");
		} else{
			if (confirm("确定要删除吗？")){
				$("#myForm").submit();
			}
		}
	}
	
	function gotoPage(pageNo){
		$("#pageNo").val(pageNo);
		$("#findForm").submit();
	}
	
	   function now(){
	     var date = new Date();
	    var dStr = date.format();
	    $(".time").html(dStr+"&nbsp;&nbsp;&nbsp;&nbsp;");
	   }
	   setInterval(now, 1000);
//-->
</script>
