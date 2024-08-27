<%@page import="semi.common.PageInfo"%>
<%@page import="semi.mypage.myOneComment.model.vo.OneComment"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
 <%
 	PageInfo pi = (PageInfo)request.getAttribute("pi");   
	ArrayList<OneComment> list = (ArrayList<OneComment>)request.getAttribute("list");
	
	int currentPage = pi.getCurrentPage();
 	int startPage = pi.getStartPage();
 	int endPage = pi.getEndPage();
 	int maxPage = pi.getMaxPage();
%>

 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	
	<style>
         body,h1,h2,h3, h4, h5, h6, p, ul,li, div, a {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        body {
            font-family: Arial, sans-serif;
            background-color: #f6f5f0;
        }

        img {
            display: block;
        }

        a {
            text-decoration: none;
            color: inherit;
        }

        .inner {
            width: 1100px;
            margin: 0 auto;
            position: relative;
        }

        /* --------------------------헤더 부분 ----------*/
       

        /* Content */
        #wrap {
            width: 1100px;
            margin: 150px auto 0;
            background-color: #f6f5f0;
            padding-bottom: 50px;
        }

        #content {
            background-color: #ffffff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
            margin-bottom: 50px;
        }

        #content_title {
            display: flex;
            justify-content: space-around;
            margin-bottom: 20px;
            font-size: 24px;
            font-weight: bold;
        }

        #content_title a {
            padding: 10px 20px;
            background-color: #8b7dbe;
            color: #fff;
            border-radius: 5px;
        }

        #content_title a:hover {
            background-color: #6a5cba;
        }

        .rvbox {
            background-color: #f9f9f9;
            margin-bottom: 20px;
            padding: 15px;
            display: flex;
            border: 1px solid #ddd;
            border-radius: 10px;
        }

        .rvbox_1 img {
            width: 60px;
            height: 60px;
            border-radius: 10px;
            margin-right: 20px;
        }

        .rvbox_2 {
            flex-grow: 1;
        }

        .rvbox_2 div {
            margin-bottom: 5px;
        }

        .rvbox_3 {
            text-align: right;
            color: #777;
        }

        #pgnum {
            text-align: center;
            padding: 20px 0;
        }

        #sort {
            position: absolute;
            right: 20px;
            top: 20px;
        }

        #sort_box {
            display: none;
            position: absolute;
            top: 40px;
            right: 20px;
            background-color: white;
            border: 1px solid #ddd;
            padding: 10px;
            border-radius: 5px;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
        }

        #sort_button img {
            width: 20px;
            height: 20px;
        }
 
    </style>	
</style>
</head>
<body>

 		<%@ include file="../common/mypageMenubar.jsp" %>
         <%@ include file="../common/footer.jsp" %>


    <div id="wrap">
        <div id="content">
            <div id="content_title">
                <a href="<%=contextPath%>">나의 리뷰</a>
                <a href="<%=contextPath%>/myonecomment">한줄평</a> <!-- ?cpage=o -->
                <a href="<%=contextPath%>/myinquire?cpage=1">내 문의사항</a>
            </div>
            <div id="sort">
                <button id="sort_button">
                    <img src="/마이페이지/resource/프로젝트 로고.png" alt="정렬 버튼">
                </button>
                <div id="sort_box">
                    <button>정렬 기준</button><br>
                    <button>날짜 순</button><br>
                    <button>좋아요 순</button><br>
                    <button>댓글 순</button>
                </div>
            </div>
            
            
            <% for(OneComment o  : list){ %>
	           
	            <div class="rvbox">
	                <div class="rvbox_1">
	                    <a href=""><img src="/마이페이지/resource/프로젝트 로고.png" alt=""></a>
	                </div>
	                <div class="rvbox_2">
	                    <div><%=o.getComNo() %>가게명 들어가야함</div>
	                    <div><%=o.getComContent()%></div>
	                    <div>아이콘(좋아요) <span><%=o.getScore() %></span></div>
	                    <div><%=o.getCreateDate() %></div>
	                  	<div><a href="">수정</a><span>/</span><a href="">삭제</a></div>
	                </div>
	                <div class="rvbox_3">
	                    <%=o.getCreateDate() %>
	                </div>
	            </div>
            <% }%>
           

             <div id="pgnum">
                <% if(currentPage != 1){ %>
		        <button onclick="location.href='<%=contextPath %>/mypage.myreview?cpage=<%= currentPage -1%>'">&lt;</button>
		        <%} %>
		        
		        <% for(int p=startPage; p<= endPage; p++){%>
		        	<% if (p == currentPage){ %>
		        <button disabled><%=p %></button>
		        	<% }else{ %>
		        <button onclick="location.href='<%=contextPath %>/mypage.myreview?cpage=<%=p %>'"><%=p %></button>
		  			<%} %>
		  		<%} %>
		  
		  
		  
		 		<% if(currentPage !=maxPage){ %> 
		        <button onclick="location.href='<%=contextPath %>/mypage.myreview?cpage=<%=currentPage +1%>'">&gt;</button>
		   		<%} %>
            </div>
        </div>

       
    </div>


</body>


<script>

</script>


</html>