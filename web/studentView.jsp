<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>
        Student View
    </title>
    <meta charset="utf-8" />
    <meta name="viewport" content="initial-scale=1.0; maximum-scale=1.0; width=device-width;">
    <link type="text/css" rel="stylesheet" href="css/main.css">
</head>
<body>
<div id = "wrapper">
    <div id = "header">
        <h1>Student List</h1>
    </div>
</div>
<div id = "container">
    <div id = "content">
        <table class="table-fill">
            <tr>
                <th class="text-left">ID</th>
                <th class="text-left">First Name</th>
                <th class="text-left">Last Name</th>
                <th class="text-left">Email</th>
                <th class="text-left">Action</th>
            </tr>
            <c:forEach var="student" items="${students}">

                <c:url var="command_update" value="StudentControllerServlet">
                    <c:param name="command" value="LOAD"/>
                    <c:param name="id" value="${student.id}"/>
                </c:url>

                <c:url var="command_delete" value="StudentControllerServlet">
                    <c:param name="command" value="DELETE"/>
                    <c:param name="id" value="${student.id}"/>
                </c:url>
            <tr>
                <td class="text-left">${student.id}</td>
                <td class="text-left">${student.firstName}</td>
                <td class="text-left">${student.lastName}</td>
                <td class="text-left">${student.email}</td>
                <td class="text-left">
                    <a href="${command_update}">Update</a>
                    |
                    <a href="${command_delete}" onclick="if(!(confirm('Are you sure? All data will be deleted!'))) return false">Delete</a>
                </td>
            </tr>
            </c:forEach>
        </table>
        <br/><br/>
        <input type="button" value="Add Student" onclick = "window.location.href = 'add-student-form.jsp'; return false;"
               class="button" style="background-color:#42cc8c;">
    </div>
</div>
</body>
</html>