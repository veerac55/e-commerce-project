
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>New user</title>
        <%@include file="components/common_css_js.jsp" %>
    </head>
    <body>
        <%@include file="components/navbar.jsp" %>
        <div class="container-fluid">
            
             <div class="row mt-5">
            <div class="col-md-4 offset-md-4">
                <div class="card">
                    <%@include file="components/message.jsp"%>
                    <div class="card-body px-5">
                        <div class="container text-center">
                            <img src="img/register.jpeg" style="max-width: 150px;" class="img-fluid"></img>
                        </div>
                         <h3 class="text-center my-3">Sign up here!!</h3>
                         <form action="RegisterServlets" method="post">
                     <div class="form-group">
                        <label for="name">User name</label>
                        <input name="user_name" type="text" class="form-control" id="name" aria-describedby="emailHelp" placeholder="Enter user name">
                      </div>
                    
                    <div class="form-group">
                        <label for="email">User Email</label>
                        <input name="user_email" type="email" class="form-control" id="email" aria-describedby="emailHelp" placeholder="Enter user email">
                    </div>
                    
                    <div class="form-group">
                        <label for="password">User password</label>
                        <input name="user_password"type="password" class="form-control" id="password" aria-describedby="emailHelp" placeholder="Enter user password">
                    </div>
                    
                     <div class="form-group">
                        <label for="phone">User phone</label>
                        <input name="user_phone" type="number" class="form-control" id="phone" aria-describedby="emailHelp" placeholder="Enter user phone">
                     </div>
                    
                     <div class="form-group">
                        <label for="password">User Addresas</label>
                        <textarea name="user_address" style="height:200px" class="form-control" placeholder="Enter Your address"></textarea>
                    </div>
                    
                    <div class="container text-center">
                        <button class="btn btn-outline-success">Register</button>
                        <button class="btn btn-outline-warning">Reset</button>
                    </div>
                    
                    
                </form>
                    </div>
                </div>
        </div>
        </div>
    </body>
</html>
