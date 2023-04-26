<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<%@ include file="meta.jsp" %>

<body>
   <%@ include file="header.jsp"%>
    <div class="container">
    <div>
        <h2>게시판</h2>
        <table class="table">
            <thead>
                <tr>
                    <th>번호</th>
                    <th>제목</th>
                    <th>작성자</th>
                    <th>작성일</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="board" items="${boards}">
                <tr>
                    <td>${board.id}</td>
                    <td>
                        <a href="view.jsp?id=${board.id}">
                            ${board.title}
                        </a>
                    </td>
                    <td>${board.author}</td>
                    <td>${board.created_at}</td>
                </tr>
                </c:forEach>
            </tbody>
        </table>
        <c:if test="${sessionScope.username != null}">
        <div>
            <a href="write.jsp" class="btn btn-primary">글쓰기</a>
        </div>
        </c:if>
    </div>
</div>
<%@ include file="footer.jsp" %>
</body>
</html>