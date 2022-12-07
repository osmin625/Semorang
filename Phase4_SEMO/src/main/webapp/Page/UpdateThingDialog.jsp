<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DeleteThingDialog</title>
<style>
        body {
            margin: 0px;
        }

        a {
            text-decoration: none;
            color: black;
        }

        .link:hover {
            text-decoration: underline;
        }

        #wrapper {
            display: flex;
            align-content: space-between;
            justify-content: space-between;
            min-height: 100vh;
        }

        form {
            display: flex;
            align-items: flex-start;
            justify-content: center;
            flex-direction: column;
        }

        #vc {
            padding: 10px;
            min-width: 100px;
            margin: 10px;
            font-size: 18px;
            background-color: rgb(207, 207, 255);
            border: solid 1px rgb(225, 225, 225);
            border-radius: 5px;
        }

        input[type="text"] {
            padding: 10px 20px;
            background-color: #f7f6f3;
            border: solid 1px rgb(225, 225, 225);
            border-radius: 5px;
            min-width: 355px;
            font-size: 20px;
        }

        input[type="text"]:hover {
            border: solid 1px rgb(201, 201, 201);
            ;
        }

        input[type="text"]:focus {
            outline: solid 3px #abdcef;
            border: solid 1px #00a2e3;
        }

        input[type="text"]:active {
            outline: none;
            border: solid 1px #00a2e3;
        }

        #input_label {
            color: #bbbbbb;
            font-size: 13px;
            margin-left: 10px;
        }

        #join {
            padding: 10px;
            min-width: 185px;
            margin: 15px 5px;
            font-size: 18px;
            border: solid 1px rgb(225, 225, 225);
            border-radius: 5px;
            color: #ec625b;
            background-color: #fdf5f2;
            border: solid 1px #ec625b;
        }

        #join:hover {
            background-color: #feece5;
        }

        #join:active {
            background-color: #fee3d9;
        }

        #log_message {
            margin-left: 10px;
            margin-bottom: 15px;
            color: red;
            /* display: none; */
        }

        body {
            height: 100%;
            width: 100%;
        }
        #temp{
            display: flex;
            align-items: center;
            flex-direction: column;
        }
        form {
            display: flex;
            align-items: flex-start;
            flex-direction: column;
            min-height: 100vh;
        }
    </style>
</head>
<script type="text/javascript">
	function close(){
		opener.document.location.reload();
		self.close();
	}
</script>

<body>
    <div id="temp">
       	<form method= "POST"  name = "insert_form" >
            <div id="input_label">Thing</div>
            <span>
                <input type="text" name="thing_name" placeholder="수정할 Thing의 이름을 입력하세요" value ="${thing_name}">
                <input type = "submit" id = vc value ="valid_check" name ="thing_valid_check" 
                	onclick = "javascript: insert_form.action ='${pageContext.request.contextPath }/ThingValidCheck.main';">
				<c:choose>
					<c:when test = "${result == 0 }">Thing의 이름을 입력하세요. </c:when>
					<c:when test = "${result == 1 }">${thing_name}은 유효하지 않은 이름입니다. </c:when>
					<c:when test = "${result == 2 }">${thing_name}은 이미 등록한 thing입니다. </c:when>
					<c:when test = "${result == 3 }">${thing_name}은 사용 가능합니다. </c:when>
				</c:choose>
            </span>
            <div id="input_label">Rank</div>
            <input type="text" name="thing_rank" placeholder="새로운 순위를 입력하세요">
            <span>
                <input type="submit" id=join value="수정하기" name="thing_update"
                	onclick = "javascript: insert_form.action ='${pageContext.request.contextPath }/UpdateThingAction.main';">
                <input type="submit" id=join value="닫기" name="close" onclick = "close()">
                <!--  제발 닫아줘 어캐 닫노 안 닫긴다 -->
            </span>
            <span>
            	<c:choose>
					<c:when test = "${insert_result == 0 }">${thing_name}을 수정하지 못했습니다.</c:when>
					<c:when test = "${insert_result == 1 }">${thing_name}이 수정되었습니다. </c:when>
				</c:choose>
            </span>
        </form>
    </div>
</body>

</html>