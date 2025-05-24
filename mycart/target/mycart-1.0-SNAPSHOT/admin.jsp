

<%@page import="java.util.Map"%>
<%@page import="com.learn.mycart.helper.Helper"%>
<%@page import="java.util.List"%>
<%@page import="com.learn.mycart.entities.Category"%>
<%@page import="com.learn.mycart.helper.FactoryProvider"%>
<%@page import="com.learn.mycart.dao.CategoryDao"%>
<%@page import="com.learn.mycart.entities.User"%>
<%
    User user = (User) session.getAttribute("current-user");
    if (user == null) {
        session.setAttribute("message", "You are not logged in !! Login First");
        response.sendRedirect("login.jsp");
        return;
    } else {
        if (user.getUserType().equals("normal")) {
            session.setAttribute("message", "You are not admin !! Do not access this page");
            response.sendRedirect("login.jsp");
            return;
        }
    }


%>

<!-- product category-->

<%                           
    CategoryDao cdao = new CategoryDao(FactoryProvider.getFactory());
    List<Category> list = cdao.getCategories();
    
//getting count
Map<String,Long> m=Helper.getCounts(FactoryProvider.getFactory());
%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin-panel</title>
        <%@include file="components/common_css_js.jsp"%>
    </head>
    <body>

        <%@include file="components/navbar.jsp" %>

        <div class="container admin">

            <div class="container-fluid mt-3">
                <%@include file="components/message.jsp" %>
            </div>



            <!--first row-->
            <div class="row mt-3" >
                <!-- first column -->
                <div class="col-md-4">
                    <!-- First box -->
                    <div class="card" >
                        <div class="card-body text-center">
                            <div class="container">
                                <img style="max-width: 100px;" class="img-fluid rounded-circle" src="img/team.png" alt="user_icon"></img>
                            </div>
                            <h1><%=m.get("userCount")%></h1>
                            <h1 class="text-uppercase text-muted">Users</h1>
                        </div>
                    </div>

                </div>
                <!-- second column -->
                <div class="col-md-4">

                    <div class="card">
                        <div class="card-body text-center">
                            <div class="container">
                                <img style="max-width: 100px;" class="img-fluid rounded-circle" src="img/menu.png" alt="user_icon"></img>
                            </div>

                            <h1><%=list.size()%></h1>
                            <h1 class="text-uppercase text-muted">Categories</h1>
                        </div>
                    </div>

                </div>
                <!-- Third column -->
                <div class="col-md-4">

                    <div class="card">
                        <div class="card-body text-center">
                            <div class="container">
                                <img style="max-width: 100px;" class="img-fluid rounded-circle" src="img/delivery-box.png" alt="user_icon"></img>
                            </div>

                            <h1><%=m.get("productCount")%></h1>
                            <h1 class="text-uppercase text-muted">Products</h1>
                        </div>
                    </div>

                </div>
            </div>
            <!--second row-->
            <div class="row mt-3">
                <!-- second row first column -->
                <div class="col-md-6">

                    <div class="card" data-toggle="modal" data-target="#add-category-modal">
                        <div class="card-body text-center">
                            <div class="container">
                                <img style="max-width: 100px;" class="img-fluid rounded-circle" src="img/user.png" alt="user_icon"></img>
                            </div>

                            <p class="mt-2">click here to add new category</p>
                            <h1 class="text-uppercase text-muted">Add Category</h1>
                        </div>
                    </div>

                </div>

                <!-- second row second column -->
                <div class="col-md-6">

                    <div class="card" data-toggle="modal" data-target="#add-product-modal">
                        <div class="card-body text-center">
                            <div class="container">
                                <img style="max-width: 100px;" class="img-fluid rounded-circle" src="img/add.png" alt="user_icon"></img>
                            </div>

                            <p class="mt-2">click here to add new product</p>
                            <h1 class="text-uppercase text-muted">Add Product</h1>
                        </div>
                    </div>

                </div>
            </div>
        </div>

        <!--add category model-->


        <!-- Modal -->
        <div class="modal fade" id="add-category-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content">
                    <div class="modal-header custom-bg text-white">
                        <h5 class="modal-title" id="exampleModalLabel">Fill category details</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form action="ProductOperationServlet" method="post">

                            <input type="hidden" name="operation" value="addcategory">

                            <div class="form-group">
                                <input type="text" class="form-control" name="catTitle" placeholder="Enter category title" required/>

                            </div>

                            <div class="form-group">
                                <textarea  style="height: 350px;" class="form-control" placeholder="Enter category discription" name="catDescription" required></textarea>

                            </div> 

                            <div class="container text-center">
                                <button class="btn btn-outline-success ">Add category</button>
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>

                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>


    <!-- End add category modal -->

    <!-- product modal-->


    <!-- Modal -->
    <div class="modal fade" id="add-product-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Product Details</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <!--Form -->
                    <form action="ProductOperationServlet" method="post" enctype="multipart/form-data">

                        <input type="hidden" name="operation" value="addproduct"/>
                        <!--product title-->

                        <div class="form-group">
                            <input type="text" class="form-control" placeholder="Enter title of product" name="pName" required/>


                        </div>
                        <!-- product discription-->
                        <div class="form-group">
                            <textarea style="height: 150px" class="form-control" placeholder="Enter product discription" name="pDesc"></textarea>
                        </div>

                        <!-- product price -->

                        <div class="form-group">
                            <input type="number" class="form-control" placeholder="Enter price of product" name="pPrice" required/>
                        </div>

                        <!--product discount-->
                        <div class="form-group">
                            <input type="number" class="form-control" placeholder="Enter price discount" name="pDiscount" required/>
                        </div>

                        <!--product quantity-->
                        <div class="form-group">
                            <input type="number" class="form-control" placeholder="Enter product quantity" name="pQuantity" required/>
                        </div>



                        <div class="form-group">
                            <select name="catId" class="form-control"id="">

                                <%                                    for (Category c : list) {
                                %>
                                <option value="<%= c.getCategoryId()%>"><%=c.getCategoryTitle()%></option>
                                <%
                                    }
                                %>
                                <option value="laptop">Laptop</option>

                            </select>
                        </div>

                        <!-- product file-->
                        <div class="form-group">
                            <label for="pPic">Select picture of product</label>
                            <br>
                            <input type="file" name="pPic" required/>
                        </div>

                        <!-- submit button -->
                        <div class="container text-center">
                            <button class="btn btn-outline-success">Add product</button>
                        </div>


                    </form>
                    <!-- End form -->

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>

                </div>
            </div>
        </div>
    </div>

    <!-- End product modal -->
    <%@include file="components/common_modals.jsp" %>

</body>
</html>
