<%--
  Created by IntelliJ IDEA.
  User: jyukutyo
  Date: 2016/02/04
  Time: 18:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <script type="text/javascript" src="https://code.jquery.com/jquery-2.2.0.js"></script>
  <script type="text/javascript">
    $(function(){
      var ws = new WebSocket("ws://localhost:8080/websocket/myHandler");

      ws.onopen = function(){
      };

      ws.onclose = function(){
      };

      ws.onmessage = function(message){
        $("#log").append(message.data).append("<br/>");
        $("#message").val("")
      };

      ws.onerror = function(event){
        alert("エラー");
      };

      $("#form").submit(function(){
        ws.send($("#message").val());
        return false;
      });
    });
  </script>
</head>

<body>
<div id="log"></div>
<form id="form" action="#">
  <input type="text" id="message" /> <input type="submit" id="send" value="送信" />
</form>
</body>
</html>
