<%@ page import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="adminheader.jsp"></jsp:include>


</head>
<body>
    <div class="container">
        <table class="table table-custom">
            <thead>
                <tr>
                    <th scope="col">Id</th>
                    <th scope="col">Name</th>
                    <th scope="col">Email</th>
                    <th scope="col">From</th>
                    <th scope="col">To</th>
                    <th scope="col">Reason</th>
                    <th scope="col">Apply Date</th>
                    <th scope="col">Status</th>
                    <th scope="col">Action</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="leave" items="${manage_leave}">
                    <tr id="row-${leave.email}">
                        <td>${leave.id}</td>
                        <td>${leave.name}</td>
                        <td>${leave.email}</td>
                        <td>${leave.from_date}</td>
                        <td>${leave.to_date}</td>
                        <td>${leave.reason}</td>
                        <td>${leave.created_at}</td>
                        <td id="status-${leave.email}">${leave.status}</td>
                        <td>
                            <form method="post" action="/action_leave" onsubmit="return handleFormSubmit('${leave.email}', this);">
                                <input type="hidden" name="id" value="${leave.id}" readonly/>
                                <button type="submit" name="action" value="approve" class="btn btn-approve">Approve</button>
                                <button type="submit" name="action" value="deny" class="btn btn-deny">Deny</button>
                            </form>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
    <script>
        function handleFormSubmit(email, form) {
            var action = form.querySelector('button[type="submit"]:focus').value;
            var confirmed = confirm(`Are you sure you want to ${action} the leave request from ${email}?`);

            if (confirmed) {
                var formData = new FormData(form);
                formData.append('action', action); // Add action to FormData

                fetch('/action_leave', {
                    method: 'POST',
                    body: formData
                })
                .then(response => {
                    if (response.redirected) {
                        window.location.href = response.url;
                    } else {
                        return response.text();
                    }
                })
                .then(html => {
                    // Assuming the server response includes the updated status
                    document.getElementById(`status-${email}`).innerText = action.charAt(0).toUpperCase() + action.slice(1) + "d"; // Update status
                    document.querySelector(`#row-${email} .btn-approve`).classList.add('btn-hidden');
                    document.querySelector(`#row-${email} .btn-deny`).classList.add('btn-hidden');
                })
                .catch(error => {
                    console.error('Error:', error);
                });

                return false; // Prevent default form submission
            } else {
                return false; // Prevent default form submission
            }
        }
    </script>
</body>
</html>
