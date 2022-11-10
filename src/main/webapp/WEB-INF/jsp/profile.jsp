<%@page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>

<t:mainLayout title="Profile">
    <script>
        document.addEventListener('DOMContentLoaded', function () {
            let btn = document.getElementById('logOut');

            function logOut() {
                if (confirm('Are you sure you want to log out?')) {
                    document.location = '${pageContext.request.contextPath}/logout';
                }
            }

            if (btn) {
                btn.addEventListener('click', logOut);
            }
        });</script>

    <div class="d-container-fluid d-flex w-50 p-3">

        <form method="post" action="updateUser" class="w-50 p-5">
            <h1>Profile</h1>
            <br>

            <c:if test="${requestScope.get('message') != null}"><h2>${requestScope.get('message')}</h2></c:if>

            <div class="input-group mb-3">
                <span class="input-group-text" id="basic-addon1">Username</span>
                <input type="text" class="form-control"
                       placeholder="${requestScope.get('username')}"
                       value="${requestScope.get('username')}"
                       maxlength="25" name="username"
                       aria-label="Username" aria-describedby="basic-addon1">
            </div>
            <div class="input-group mb-3">
                <span class="input-group-text" id="basic-addon2">Email</span>
                <input type="text" class="form-control"
                       aria-label="Email" aria-describedby="basic-addon1"
                       placeholder="${requestScope.get('email')}"
                       value="${requestScope.get('email')}"
                       name="email" maxlength=30">
            </div>

            <div class="input-group mb-3">
                <span class="input-group-text" id="basic-addon3">Password</span>
                <input type="password" class="form-control"
                       aria-label="Email" aria-describedby="basic-addon3"
                       name="password" maxlength="30"
                       placeholder="${requestScope.get('password')}" value="${requestScope.get('password')}">
            </div>

            <input class="btn btn-primary" type="submit" value="Change profile data">
        </form>
    </div>
</t:mainLayout>
