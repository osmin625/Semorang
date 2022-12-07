<%@page import="dao.User_TR_Board_DAO"%>
<%@page import="main.MyPage"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page language="java" import="main.MyPage,dto.User_TR_Board_DTO,java.util.*"%>
<!DOCTYPE html>
<html lang="en">
<%
	String login_id = (String)session.getAttribute("login_id"); 
	MyPage mp = new MyPage();
	// 카테고리는 cate_name (String)으로 넘겨준다
	String category ="";
	if (request.getAttribute("category") == null){
		category = "전체";
	}else{
	 category= (String)request.getAttribute("category");
	}
	
	List<User_TR_Board_DTO> result = new ArrayList<>();
	boolean check_total;
	if (category.equals("전체")){
		result = mp.print_total_trBoard(login_id);
		check_total = true;  
	}else{
		result = mp.print_category_trBoard(login_id, category);
		check_total = false;
	}
%>

<script>
	function InsertThing(){
		var width = 430;
		var height = 500;
		var popupX = (document.body.offsetWidth / 2) - (width / 2);
		var popupY=  (document.body.offsetWidth / 2) - (height / 2);
		window.open("${pageContext.request.contextPath }/InsertThingDialog.main",
		'InsertThing', 'width='+width+ ', height='+ height + ', status=no, scrollbars=yes ,left=' + popupX + ',top='+ popupY);
	}
	function UpdateThing(){
		var width = 430;
		var height = 500;
		var popupX = (document.body.offsetWidth / 2) - (width / 2);
		var popupY=  (document.body.offsetWidth / 2) - (height / 2);
		window.open("${pageContext.request.contextPath }/UpdateThingDialog.main",
				'InsertThing', 'width='+width+ ', height='+ height + ', status=no, scrollbars=yes ,left=' + popupX + ',top='+ popupY);
	}
	function DeleteThing(){
		var width = 430;
		var height = 500;
		var popupX = (document.body.offsetWidth / 2) - (width / 2);
		var popupY=  (document.body.offsetWidth / 2) - (height / 2);
		window.open("${pageContext.request.contextPath }/DeleteThingDialog.main",
				'InsertThing', 'width='+width+ ', height='+ height + ', status=no, scrollbars=yes ,left=' + popupX + ',top='+ popupY);
	}
	
</script>
<head>
    <title>Mypage</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel = "stylesheet" type ="text/css" href = "${pageContext.request.contextPath}/css/MyPage.css">
</head>
<body>
    <div id="wrapper">
        <div id="content">
            <div id="headline">
                <a id="main" href="main.html">
                    <img id="icon" src="${pageContext.request.contextPath }/image/semorang.png" />
                </a>
                <span class="head_content">
                    <a class="link" href="${pageContext.request.contextPath }/RankingBoardPage.main">Ranking</a>
                </span>
                <span class="head_content">
                    <a class="link" href="${pageContext.request.contextPath }/UserRankingPage.main">User Ranking</a>
                </span>
                <span class="head_content">
                    <a class="link" href="${pageContext.request.contextPath }/SnapshotBoardPage.main">Ranking Snapshot</a>
                </span>
                <span id=r class="head_content">
                    <a class="link" href="${pageContext.request.contextPath }/MyPage.main">My page</a>
                </span>
            </div>
            <div id=bodyline>
                <div id="lcontent">
                    <form method="POST" action="${pageContext.request.contextPath }/MP_CategoryBtnClick.main" id="category_form">
                        <div>
                            <input type="submit" name=category value="전체">
                        </div>
                        <div>
                            <span>
                                <input type="submit" name=category value="한식">
                                <input type="submit" name=category value="중식">
                                <input type="submit" name=category value="일식/수산물">
                                <input type="submit" name=category value="분식">
                                <input type="submit" name=category value="닭/오리요리">
                            </span>
                        </div>
                        <div>
                            <span>
                                <input type="submit" name=category value="양식">
                                <input type="submit" name=category value="패스트푸드">
                                <input type="submit" name=category value="제과제빵떡케익">
                                <input type="submit" name=category value="유흥주점">
                            </span>
                        </div>
                        <div>
                            <span>
                                <input type="submit" name=category value="별식/퓨전요리">
                                <input type="submit" name=category value="커피점/카페">
                                <input type="submit" name=category value="음식배달서비스">
                                <input type="submit" name=category value="기타음식업">
                                <input type="submit" name=category value="부페">
                            </span>
                        </div>
                    </form>
                </div>
                <div id="rcontent">
                    <div id="rank_head">
                        <span class="head">순위</span>
                        <span class="head">상호명</span>
                    </div>
                    <div id="ranking">
                         <%
                         	if(check_total){
		                        for (User_TR_Board_DTO item : result) {
		                        	out.print("<div class = tuple>");
		                        	out.print("<span class = unit1>" + item.getTr_ranks()+ "</span>");
			        				out.print("<span class = unit2>" + item.getT_categories()+ "</span>");
			        				out.print("<span class = unit3>" + item.getT_thing_name()+ "</span>");
			                        out.print("</div>");
		            			}
                         	}else{
                         		int new_rank = 0;
	                         	int temp =0;
	                         	int pre= 0;
	                         	for (User_TR_Board_DTO item : result) {
	                         		temp = item.getTr_ranks();
	                         		if(new_rank != temp && pre != temp) {
	            						new_rank++;
	            					}
		                        	out.print("<div class = tuple>");
		                        	out.print("<span class = unit1>" + new_rank+ "</span>");
			        				out.print("<span class = unit2>" + item.getT_categories()+ "</span>");
			        				out.print("<span class = unit3>" + item.getT_thing_name()+ "</span>");
			                        out.print("</div>");
			                        pre = temp;
		            			}
	                         	
                         	}
                        %>
                    </div>
                </div>
                <div id="rrcontent">
	                    <input type="submit" value="추가" onclick = "return InsertThing()">
	                    <input type="submit" value="수정" onclick = "return UpdateThing()">
	                    <input type="submit" value="삭제" onclick = "return DeleteThing()">
                </div>
            </div>

        </div>
        <!-- Sidebar -->
        <div id="sidebar">
            <button id="close">≫</button>
            <div id="userinfo">
               <%=login_id %>님,<br>안녕하세요.
            </div>
            <div class="fd">
                <span class="fs">
                    팔로워 수
                </span>
                <span class="fs">
                    팔로잉 수
                </span>
            </div>
            <div class="fd">
                <span class="fs">
                    123
                </span>
                <span class="fs">
                    456
                </span>
            </div>
            <button id="logout" onclick="location.href='${pageContext.request.contextPath }/Logout.main'">Logout</button>
        </div>
    </div>
</body>

</html>