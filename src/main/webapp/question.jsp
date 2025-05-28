<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="adminheader.jsp"></jsp:include>

<table border="1px" width="100%">
    <tr> <th>question</th> <th>option1</th> <th>option2</th> <th>option3</th> <th>option4</th> <th>answer</th</tr>
    <c:forEach var="q" items="${question}">
        <tr> <td>${q.question}</td> 
            <td> ${q.option1}</td>
            <td> ${q.option2}</td>
            <td> ${q.option3}</td>
            <td> ${q.option4}</td>
            <td> ${q.answer}</td>
            <td>
                <form method="post" action="manage_question">
                    <input type="hidden" name="slno" value="${q.slno}"/>
                    <input type="submit" name="btn" value="delete"/>
                    <input type="submit" name="btn" value="edit"/>

                </form>
            </td>
        </tr>
    </c:forEach>
</table>