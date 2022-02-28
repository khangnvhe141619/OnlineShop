<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Notification</title>
        <script>
            alert("${requestScope.notification}");
            window.location.href = "${requestScope.move}";
        </script>
    </head>
    <body>
        <h1>${requestScope.notification}</h1>
    </body>
    <script>
        alert("${requestScope.notification}");
        window.location.href = "${requestScope.move}";
    </script>
</html>
