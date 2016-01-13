<%@page import="java.util.*"%>
<%@page import="com.turing.dao.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	IDao dao = new DaoImpl();
	List<Map<String,Object>> list = dao.executeQueryForList("select * from code_gene");
	int h_count = list.size()%5==0?list.size()/5:list.size()/5+1;
%>
<h3 id="jiyinBtn" style="position: relative;">基因类型：<img id="jiyinIcon" src="images/add.png" width="24" height="24" style="position: absolute;"/></h3>
<table id="jiyinTable" style="display: none;">
	<%for(int h=0;h<h_count;h++){%>
	<tr>
		<%for(int l=0;l<5;l++){%>
		<td>
		<%=h*5+l>=list.size()?"":"<input name='genetype' type='checkbox' value='"+list.get(h*5+l).get("genetype")+"'/>&nbsp;&nbsp;"+list.get(h*5+l).get("genetype")+"" %>
		</td>
		<%} %>
	</tr>
	<%}%>
</table>

<h3 id="jiyinfenxingBtn" style="position: relative;">基因分型：<img id="jiyinfenxingIcon" src="images/add.png" width="24" height="24" style="position: absolute;"/></h3>
<table id="jiyinfenxingTable" style="display: none;">
	<%
		for(int i=0;i<list.size();i++){
			Map<String,Object> map = list.get(i);
	%>
	<tr id="<%=map.get("genetype") %>" style="display:none;">
		<td width="15%"><%=map.get("genetype") %></td>
		<td>
			<input name="<%=map.get("genetype") %>targetspot" value="<%=map.get("targetspot01value") %>" type="radio" />&nbsp;<%=map.get("targetspot01") %>
			<input name="<%=map.get("genetype") %>targetspot" value="<%=map.get("targetspot02value") %>" type="radio" />&nbsp;<%=map.get("targetspot02") %>
			<input name="<%=map.get("genetype") %>targetspot" value="<%=map.get("targetspot03value") %>" type="radio" />&nbsp;<%=map.get("targetspot03") %>
		</td>
	</tr>
	<%} %>
</table>

<script type="text/javascript">
	$(function(){	
		//初始化
		$("input[name='genetype']").each(function(){
			if(this.checked==true){
				$("#"+this.value).show();
			}
		});
		
		$("#jiyinBtn").toggle(
			function(){
				$("#jiyinTable").show("slow");
				$("#jiyinIcon").attr("src","images/plus.png");
			},
			function(){
				$("#jiyinTable").hide("slow");
				$("#jiyinIcon").attr("src","images/add.png");
			}
		);
		
		$("#jiyinfenxingBtn").toggle(
			function(){
				$("#jiyinfenxingTable").show("slow");
				$("#jiyinfenxingIcon").attr("src","images/plus.png");
			},
			function(){
				$("#jiyinfenxingTable").hide("slow");
				$("#jiyinfenxingIcon").attr("src","images/add.png");
			}
		);
		
		
		$("input[name='genetype']").each(function(){
			//alert($(this).val());
			$(this).on("click",function(){
				if (this.checked==true) {
					$("#"+this.value).show();
				} else {
					$("#"+this.value).hide();
				}
			});
		});
	});
</script>