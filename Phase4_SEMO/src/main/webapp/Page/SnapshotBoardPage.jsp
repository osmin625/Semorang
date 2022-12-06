<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page language="java" import="controller.RankingBoardPage,java.util.*"%>
<!DOCTYPE html>
<html lang="en">
<%
	RankingBoardPage rbp = new RankingBoardPage();
	ArrayList<String[]> result = rbp.display(15);
%>

<head>
    <title>Semorang</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <style>
        #content {
            background-color: #fffefb;
            width: 100%;
        }

        #headline {
            display: flex;
            align-items: center;
            justify-content: space-around;
            height: 10vh;
        }

        .head_content {
            padding: 35px 55px;
            font-size: 30px;
            text-align: center;
            font-family: "inter";
            font-weight: bold;
            background-color: #dfeaff;
            border-radius: 40px 40px 0px 0px;
        }

        .head_content:hover {
            background-color: #c4d9ff;
            text-decoration: underline;
        }

        .head_content:active {
            background-color: #a1c2ff;
            text-decoration: underline;
        }

        #start {
            margin-left: auto;
            margin-right: 30px;
            background-color: #E16259;
            color: white;
            padding: 8px 15px 8px 15px;
            border: 0px;
            border-radius: 5px;
        }

        input[type="text"],
        input[type="password"] {
            padding: 1em;
            margin: 3px 0px;
            border-radius: 8px;
            border: solid 1px #bbbbbb;
        }

        input[type="text"]:hover,
        input[type="password"]:hover {
            border: solid 1px rgb(97, 97, 97);
        }

        input[type="text"]:focus,
        input[type="password"]:focus {
            outline: solid 2px #abdcef;
            border: solid 1px #bbbbbb;
        }

        body {
            margin: 0px;
            height: 100vh;
        }

        input[type="submit"] {
            padding: 1em;
            border-radius: 16px;
            border: solid 1px #B591D1;
            margin: 5px;
            background-color: #B591D1;
            color: black;
            font-weight: bold;
            font-size: 15px;
            box-shadow: 2px 2px 2px 1px #c2aad4;
        }

        input[type="submit"]:hover {
            background-color: #a76ed3;
        }

        input[type="submit"]:active {
            background-color: #9745d6;
        }

        a {
            text-decoration: none;
            color: black;
        }

        #main {
            display: flex;
            padding: 10px 30px 10px 80px;
            align-items: center;
        }

        #login_option {
            display: flex;
            justify-content: space-between;
            font-size: 13px;
            font-weight: bold;
        }

        .link:hover {
            text-decoration: underline;
        }
        #userinfo {
          margin-left: 20px;
          color: #878785;
          font-size:20px;
          width: 200px;
          line-break: anywhere;
        }
        #sidebar {
            display: flex;
            flex-direction: column;
            justify-content: flex-start;
            align-content: flex-start;
            align-items: flex-start;
            width: 18%;
            min-width: fit-content;
            overflow: auto;
            background-color: #f7f6f3;
        }
        #close{
            border: transparent;
            background-color: transparent;
            font-size: 25px;
            padding: 10px;
        }
        #close:hover{
            background-color:#dfdfdf;
        }
        #logout {
            margin: 20px;
            background-color: transparent;
            border: solid 1px #bbbbbb;
            border-top: 1px solid #e8e7e4;
            font-size: 18px;
            padding: 5px 15px;
            color: #b6b4b0;
            text-align: left;
            border-radius: 10px;
        }

        #logout:hover {
            background-color: #e8e7e4;
        }

        #sections {
            display: flex;
            align-items: center;
            font-size: 25px;
            max-width: 99%;
        }

        #sections:hover {
            background-color: #fcf9f2;
        }

        #wrapper {
            display: flex;
            align-content: space-between;
            justify-content: space-between;
            min-height: 100vh;
        }

        #bodyline {
            display: flex;
            margin-bottom: auto;
            height: 90vh;
        }

        #lcontent {
            display: flex;
            width: 40%;
            flex-direction: column;
            margin-top: 10%;
            padding: 6%;
        }

        #rcontent {
            display: flex;
            flex-direction: column;
            width: 50%;
        }
        #rank_head{
            display: flex;
            flex-direction: row;
            justify-content: space-between;
            margin-right: 50px;
        }
        .head{
            margin-top: 40px;
            border: #000000 solid 2px;
            border-radius: 20px;
            font-size: 30px;
            padding: 10px;
            background-color: white;
            font-weight: bold;
        }
        #ranking {
            display:flex;
            flex-direction: column;
            padding: 1em;
            border-radius: 16px;
            margin-right: 50px;
            margin-top: 10px;
            border: solid 2px #000000;
            background-color: #ffffff;
            color: black;
            font-weight: bold;
            font-size: 20px;
        }
        .tuple{
            display:flex;
            justify-content: space-between;
            border-bottom: solid 2px #b4b4b4;
        }
        .unit {
            /* border-bottom: solid 2px #b4b4b4; */
            /* margin: 10px; */
            font-size: 30px;
        }
        #r{
            background-color: #a1c2ff;
            
        }
    </style>
</head>

<body>
    <div id="wrapper">
        <div id="content">
            <div id="headline">
                <a id="main" href="main.html">
                    <img id="icon" src="icon.png" />
                </a>
                <span id=r class="head_content">
                    <a class="link" href="./analysis.html">Ranking</a>
                </span>
                <span class="head_content">
                    <a class="link" href="./review.html">User Ranking</a>
                </span>
                <span class="head_content">
                    <a class="link" href="./analysis.html">Ranking Snapshot</a>
                </span>
                <span class="head_content">
                    <a class="link" href="./review.html">My page</a>
                </span>
            </div>
            <div id=bodyline>
                <div id="lcontent">
                    <form action="POST">
                        <div>
                            <input type="submit" name=전체 value="전체">
                        </div>
                        <div>
                            <span>
                                <input type="submit" name=한식 value="한식">
                                <input type="submit" name=중식 value="중식">
                                <input type="submit" name=일식/수산물 value="일식/수산물">
                                <input type="submit" name=분식 value="분식">
                                <input type="submit" name=닭/오리요리 value="닭/오리요리">
                            </span>
                        </div>
                        <div>
                            <span>
                                <input type="submit" name=양식 value="양식">
                                <input type="submit" name=패스트푸드 value="패스트푸드">
                                <input type="submit" name=제과제빵떡케잌 value="제과제빵떡케잌">
                                <input type="submit" name=유흥주점 value="유흥주점">
                            </span>
                        </div>
                        <div>
                            <span>
                                <input type="submit" name=커피점/카페 value="커피점/카페">
                                <input type="submit" name=음식배달서비스 value="음식배달서비스">
                                <input type="submit" name=기타음식업 value="기타음식업">
                                <input type="submit" name=부페 value="부페">
                            </span>
                        </div>
                    </form>
                </div>
                <div id="rcontent">
                    <div id="rank_head">
                        <span class="head">순위</span>
                        <span class="head">상호명</span>
                        <span class="head">평점</span>
                    </div>
                    <div id="ranking">
                         <%
	                        for (String[] item : result) {
		                        out.print("<div class = tuple>");
		        				out.print("<span class = val>" + item[0]+ "</span>");
		        				out.print("<span class = val>" + item[1]+ "</span>");
		        				out.print("<span class = val>" + item[2]+ "</span>");
		                        out.print("</div>");
	            			}
                        		
                        %>
                    </div>
                </div>
            </div>
        </div>
        <!-- Sidebar -->
        <div id="sidebar">
            <button id="close">≫</button>
            <div id="userinfo">
               님,<br>안녕하세요.
            </div>
            <button id="logout" onclick="location.href='/logout'">Logout</button>
        </div>
    </div>
</body>

</html>