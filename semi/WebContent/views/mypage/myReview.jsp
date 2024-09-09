<%@page import="semi.common.PageInfo"%>
<%@page import="java.util.ArrayList"%>
<%@page import = "semi.member.model.vo.Member" %>
<%@page import = "semi.mypage.myReview.model.vo.Review" %> 
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
    PageInfo pi = (PageInfo)request.getAttribute("pi");   
	ArrayList<Review> list = (ArrayList<Review>)request.getAttribute("list");
	
	
	int currentPage = pi.getCurrentPage();
 	int startPage = pi.getStartPage();
 	int endPage = pi.getEndPage();
 	int maxPage = pi.getMaxPage();

 	
	// 서비스 요청 전 : member.jsp 로딩시 : null
	// 서비스 성공 후 : member.jsp 로딩시 : alert로 띄워줄 메시지 문구
		
%>     
    
 
<!DOCTYPE html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>마이페이지_1</title>

<style>
    
#wrap {
    width: 1100px;
    margin: 30px auto 0;
    background-color: #f6f5f0;
    padding-bottom: 50px;
}

#content {
    background-color: #ffffff;
    padding: 20px;
    border-radius: 10px;
    margin-bottom: 50px;
    height: 1000px;
    position: relative;
}

#content_title {
    display: flex;
    justify-content: space-around;
    margin-bottom: 20px;
    font-size: 24px;
    font-weight: bold;
}

#content_title > a {
    padding: 10px 20px;
    background-color: #8b7dbe;
    color: #fff;
    border-radius: 5px;
}

#content_title > a:hover {
    background-color: #6a5cba;
}


.empty{
	

}
.rvboxE{
    background-color: #f9f9f9;
    display: flex;
    margin-bottom: 20px;
    padding: 15px;
    border: 1px solid #ddd;
    border-radius: 10px;
    align-items: flex-start;
    text-align: center;
    font-size: 15px;
    font-weight: 600;
}

.rvbox {
    background-color: #f9f9f9;
    display: flex;
    margin-bottom: 20px;
    padding: 15px;
    border: 1px solid #ddd;
    border-radius: 10px;
    align-items: flex-start;
}

.rvbox_1 img {
    width: 80px;
    height: 80px;
    border-radius: 10px;
    margin-right: 20px;
}

.rvbox_2 {
    flex-grow: 1;
}

.rvbox_2 .rvbox_header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-bottom: 5px;
}

.rvbox_2 .rvbox_header div {
    font-size: 16px;
    font-weight: bold;
}

.rvbox_3 {
    font-size: 14px;
    color: #555;
    margin-bottom: 10px;
}

.rvbox_4 {
    display: flex;
    justify-content: flex-end; 
    align-items: center;
    font-size: 14px;
    color: #888;
}

.rvbox_4 .rvbox_score {
    margin-right: 20px;
}

.rvbox_4 .rvbox_delete a {
    color: #d9534f;
    text-decoration: none;
}

.rvbox_4 .rvbox_delete a:hover {
    text-decoration: underline;
}

#pgnum {
    text-align: center;
    padding: 20px 0;
    position: absolute; 
    bottom: 20px; 
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

footer {
    background-color: #f6f5f0;
    padding: 20px 0;
    text-align: center;
    border-top: 1px solid #ddd;
}

footer .inner {
    display: flex;
    flex-direction: column;
    align-items: center;
}

footer .menu {
    list-style: none;
    display: flex;
    justify-content: center;
    gap: 10px;
    margin-bottom: 10px;
}

footer .menu li a {
    font-size: 12px;
}

footer .info span {
    font-size: 12px;
    margin: 0 10px;
}

    </style>
    <script>
        document.addEventListener("DOMContentLoaded", function () {
            const sortButton = document.getElementById("sort_button");
            const sortBox = document.getElementById("sort_box");

            sortButton.addEventListener("click", function () {
                sortBox.style.display = sortBox.style.display === "none" ? "block" : "none";
            });
        });
    </script>
</head>

<body>
   
        <%@ include file="../mypage/mypageMenubar.jsp" %>
         <%@ include file="../common/footer.jsp" %>
        
    <div id="wrap">
        <div id="content">
            <div id="content_title">
                <a href="<%=contextPath%>">나의 리뷰</a>
                <a href="<%=contextPath %>/myonecomment">한줄평</a>
                <a href="myinquire">내 문의사항</a>
               
            </div>
            <div id="sort">
                <button id="sort_button">
                    <img src="<%= request.getContextPath() %>/resources/images/mypage/sort.PNG" alt="정렬 버튼">
                </button>
                <div id="sort_box">
                    <button>정렬 기준</button><br>
                    <button>날짜 순</button><br>
                    <button>좋아요 순</button><br>
                    <button>댓글 순</button>
                </div>
            </div>
             
             <% if(list.isEmpty()){ %>
             		
             	<div class="rvboxE">작성된 리뷰가 없습니다.</div>
             	
              <%} else{%>
            <% for(Review r : list){ %>
                <div class="rvbox">
				    <a href="<%=contextPath %>/reviewDetail.ro?reviewNo=<%= r.getReviewNo() %>">
				        <div class="rvbox_1">
				            <% if(r.getTitleimg() != null && r.getChangeName() != null) { %>
				                <img src="<%=request.getContextPath()%>/<%=r.getTitleimg()%>/<%=r.getChangeName()%>" alt="가게 이미지">
				            <% } else { %>
				                <img src="<%=request.getContextPath()%>/resources/images/emptyImg.jpg" alt="기본 이미지">
				            <% } %>
				        </div>
				        <div class="rvbox_2">
				            <div class="rvbox_header">
				                <div><%=r.getTitle() %></div>  <!-- 가게 이름 -->
				                <div class="rvbox_score">평점: <%= r.getScore() %></div>  <!-- 점수 -->
				                <div><%= r.getrDate() %></div>  <!-- 날짜 -->
				            </div>
				            <div class="rvbox_3"><%=r.getrContent()%></div>  <!-- 리뷰 내용 -->
				            <div class="rvbox_4">
				                <div class="rvbox_delete"><a href="<%=contextPath%>/ReviewDelete.ro?rno=<%=r.getReviewNo()%>">삭제</a></div>  <!-- 삭제 버튼 -->
				            </div>
				        </div>
				    </a>
				</div>
          	<% }%>
           <%} %>
            
            

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







</html>