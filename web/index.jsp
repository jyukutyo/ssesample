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
    <title>$Title$</title>
  </head>
  <body>
  Message: <span id="foo"></span>

  <br><br>
  <button onclick="start()">Start</button>

  <script type="text/javascript">
    function start() {

      var eventSource = new EventSource("sse/index");
      eventSource.addEventListener('open', function (e) {
        console.log('Connected.');
      });
      eventSource.onmessage = function(event) {

        document.getElementById('foo').innerHTML = event.data;

      };
    eventSource.addEventListener("event", function(e) {

        var newElement = document.createElement("div");
        newElement.innerHTML = e.data;
        document.getElementsByTagName("body")[0].appendChild(newElement);

    }, false);

    }
  </script>
  </body>
</html>
