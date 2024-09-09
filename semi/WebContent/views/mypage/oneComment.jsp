<%@page import="semi.common.PageInfo"%>
<%@page import="semi.mypage.myOneComment.model.vo.OneComment"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
 <%
	ArrayList<OneComment> list = (ArrayList<OneComment>)request.getAttribute("list");
	PageInfo pi = (PageInfo)request.getAttribute("pi");   

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
    	margin-bottom: 50px;
    	min-height: 600px;
    	position: relative;
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
    	display: flex;
    	border: 1px solid #ddd;
    	border-radius: 10px;
    	margin-bottom: 20px;
    	padding: 15px;
    	background-color: #f9f9f9;
	}

	.commentImg img {
    	width: 100px;
    	height: 100px;
    	border-radius: 10px;
    	margin-right: 20px;
	}

	.rvbox_2 {
   		flex-grow: 1;
	}

	.rvbox_header {
    	display: flex;
    	justify-content: space-between;
    	font-weight: bold;
    	margin-bottom: 10px;
	}

	.rvbox_content {
    	margin-bottom: 10px;
	}

	.delete_btn {
    	text-align: right;
    	color: #d9534f;
	}

	.delete_btn a {
   		color: #d9534f;
   		text-decoration: none;
	}

	.delete_btn a:hover {
   		text-decoration: underline;
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
	}

	#sort_button img {
    	width: 20px;
    	height: 20px;
	}
</style>
</head>
<body>

 	<%@ include file="../mypage/mypageMenubar.jsp" %>
    <%@ include file="../common/footer.jsp" %>

	<div id="wrap">
    	<div id="content">
        	<div id="content_title">
            	<a href="<%=contextPath%>">나의 리뷰</a>
            	<a href="<%=contextPath %>/myonecomment">한줄평</a>
            	<a href="<%=contextPath%>/myinquire">내 문의사항</a>
        	</div>

			<!-- 정렬 기능 -->
			<div id="sort">
			    <button id="sort_button">
			        <img src="<%= request.getContextPath() %>/resources/images/mypage/sort.PNG" alt="정렬 버튼">
			    </button>
			    <div id="sort_box">
			        <button onclick="location.href='<%=contextPath%>/myonecomment?sort=date'">날짜 순</button><br>
			        <button onclick="location.href='<%=contextPath%>/myonecomment?sort=score'">별점 순</button><br>
			    </div>
			</div>
			
			<!-- 리뷰 리스트 -->
       		<% if (list != null && !list.isEmpty()) { %>
        		<% for(OneComment o : list) { %>
            	<div class="rvbox" onclick="location.href='<%=contextPath%>/onecommentDetail.co?cno=<%= o.getComNo() %>'">
               
                	<div class="commentImg">
                    	<% if(o.getFilePath() != null && o.getChangeName() != null) { %>
                        	<img src="<%=request.getContextPath()%>/<%=o.getFilePath()%>/<%=o.getChangeName()%>" alt="가게 이미지">
                    	<% } else { %>
                        	<img src="<%=request.getContextPath()%>/resources/images/mypage/emptyImg.jpg" alt="가게 이미지 입력된 게 없음">
                    	<% } %>
                	</div>

                	<div class="rvbox_2">
                    	<div class="rvbox_header">
                        	<div><strong><%= o.getpTitle() %></strong></div>
                        	<div>평점: <%= o.getScore() %></div>
                        	<div><%= o.getCreateDate() %></div>
                    	</div>

                    	<div class="rvbox_content">
                        	<%= o.getComContent() %>
                    	</div>

                    	<div class="delete_btn">
                        	<a href="#">수정</a> / 
                        	<a href="<%=contextPath%>/OneCommentDelete.no?cno=<%=o.getComNo()%>">삭제</a>
                    	</div>
                  	</div>
              	</div>
  				<% } %>
         	<% } %>

        	<!-- 페이징 부분 -->
        	<div id="pgnum">
            	<% if(currentPage != 1) { %>
                	<button onclick="location.href='<%=contextPath %>/myonecomment?cpage=<%= currentPage -1 %>'">&lt;</button>
            	<% } %>

            	<% for(int p = startPage; p <= endPage; p++) { %>
                	<% if (p == currentPage) { %>
                    	<button disabled><%=p %></button>
                	<% } else { %>
                    	<button onclick="location.href='<%=contextPath %>/myonecomment?cpage=<%=p %>'"><%=p %></button>
                	<% } %>
            	<% } %>

            	<% if(currentPage != maxPage) { %>
                	<button onclick="location.href='<%=contextPath %>/myonecomment?cpage=<%=currentPage + 1%>'">&gt;</button>
            	<% } %>
        	</div>
    	</div>
	</div>
</body>

<script>
	document.addEventListener("DOMContentLoaded", function () {
	    const sortButton = document.getElementById("sort_button");
	    const sortBox = document.getElementById("sort_box");
	
	    sortButton.addEventListener("click", function () {
	        sortBox.style.display = sortBox.style.display === "none" ? "block" : "none";
	    });
	});
</script>
</html>