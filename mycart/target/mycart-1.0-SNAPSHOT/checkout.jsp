<%
    User user = (User) session.getAttribute("current-user");
    if (user == null) {
        session.setAttribute("message", "You are not logged in !! Login First to access checkout page");
        response.sendRedirect("login.jsp");
        return;
    }


%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>check out</title>
        <%@include file="components/common_css_js.jsp"%>
    </head>
    <body>
        <%@include file="components/navbar.jsp" %>

        <div class="container">
            <div class="row">
                <div class="col-md-6">
                    <!--card-->
                    <div class="card">
                        <div class="card-body">
                            <h3 class="text-center mb-5">Your selected items</h3>
                            <div class="cart-body">

                            </div>

                        </div>

                    </div>


                </div>

                <div class="col-md-6">
                    <!--form details-->
                    <div class="card">
                        <div class="card-body">
                            <h3 class="text-center mb-5">Your details for order</h3>
                            <form action="#!">
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Email address</label>
                                    <input value="<%=user.getUserEmail()%> "type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
                                    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                                </div>

                                <div class="form-group">
                                    <label for="exampleInputEmail1">Your name</label>
                                    <input value="<%=user.getUserName()%>" type="text" class="form-control" id="name" aria-describedby="emailHelp" placeholder="Enter name">

                                </div>

                                <div class="form-group">
                                    <label for="exampleInputEmail1">Your contact number</label>
                                    <input value="<%=user.getUserPhone()%>" type="number" class="form-control" id="name" aria-describedby="emailHelp" placeholder="Enter contact number">

                                </div>

                                <div class="form-group">
                                    <label for="exampleFormControlTextarea1">your shipping address</label>
                                    <textarea value="<%=user.getUserAddress()%>" class="form-control" id="exampleFormControlTextarea1" rows="3" placeholder="Enter your address"></textarea>
                                </div>
                                <div class="container text-center">
                                    <button class="btn btn-outline-success">Order now </button>
                                    <button class="btn btn-outline-primary">continue shopping </button>
                                </div>
                            </form>


                        </div>

                    </div>


                </div>
            </div>
        </div>
        <%@include file="components/common_modals.jsp" %>
    </body>
</html>
