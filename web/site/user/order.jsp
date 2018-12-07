<%-- 
    Document   : login/register page
    Created on : 27/11/2018, 15:22:23
    Author     : Mateus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="../header.jsp" %>

<!-- BREADCRUMB -->
<div id="breadcrumb" class="section">
    <!-- container -->
    <div class="container">
        <!-- row -->
        <div class="row">
            <div class="col-md-12">
                <ul class="breadcrumb-tree">
                    <li><a href="../site/store">Página Inicial</a></li>
                    <li><a href="../site/orders.jsp">Minhas Compras</a></li>
                    <li class="active">Compra <strong># 111@</strong></li>
                </ul>
            </div>
        </div>
        <!-- /row -->
    </div>
    <!-- /container -->
</div>
<!-- /BREADCRUMB -->

<!-- SECTION -->
<div class="section">
    <!-- container -->
    <div class="container">
        <!-- row -->
        <div class="row">
            <!-- menu -->
            <aside class="col-md-3">
                <div class="main-panel">
                    <div class="panel-heading">
                        <h3 class="panel-title">Menu do Usuário</h3>
                    </div>
                    <div class="panel-body">
                        <ul class="nav nav-pills nav-stacked side-menu">
                            <li class="active">
                                <a href="?tab=orders"><i class="fa fa-list"></i> Minhas compras</a>
                            </li>
                            <li>
                                <a href="?tab=reviews"><i class="fa fa-heart"></i> Minhas avaliações</a>
                            </li>
                            <li>
                                <a href="?tab=account"><i class="fa fa-user"></i> Minha conta</a>
                            </li>
                            <li>
                                <a href="../site/logout"><i class="fa fa-sign-out"></i> Sair</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </aside>
            <!-- /menu -->

            <!-- content -->
            <section class="col-md-8 col-md-offset-1">
                <h2>Compra # 111 <span class="badge">[ 22/08/2018 ]</span></h2>
                <hr>
                <table class="table table-hover">
                    <thead>
                        <tr>
                            <th>Produto</th>
                            <th>Quantidade</th>
                            <th>Preço</th>
                            <th>Total</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>
                                
                            </td>
                            <td>2</td>
                            <td>R$ 198.58</td>
                            <td>R$ 400.88</td>
                        </tr>
                    </tbody>
                    <tfoot>
                        <tr>
                            <td></td>
                            <td></td>
                            <td>Subtotal</td>
                            <td>R$ 7888.0</td>
                        </tr>
                        <tr>
                            <td></td>
                            <td></td>
                            <td class="lead">Total</td>
                            <td class="lead">R$ 7888.0</td>
                        </tr>
                    </tfoot>
                </table>
                
                <div class="row">
                    <div class="col-md-6">
                        <h4 class="text-uppercase">Endereço de entrega</h4>
                    </div>
                </div>

            </section>
            <!-- /content -->
        </div>
        <!-- /row -->
    </div>
    <!-- /container -->
</div>
<!-- /SECTION -->



<%@include file="../footer.jsp" %>
