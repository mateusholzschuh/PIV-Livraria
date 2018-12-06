<%-- 
    Document   : login/register page
    Created on : 27/11/2018, 15:22:23
    Author     : Mateus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="header.jsp" %>

<!-- BREADCRUMB -->
<div id="breadcrumb" class="section">
    <!-- container -->
    <div class="container">
        <!-- row -->
        <div class="row">
            <div class="col-md-12">
                <ul class="breadcrumb-tree">
                    <li><a href="../site/store">Página Inicial</a></li>
                    <li class="active">Minhas Compras</li>
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
                                <a href="#"><i class="fa fa-list"></i> Minhas compras</a>
                            </li>
                            <li>
                                <a href="#"><i class="fa fa-heart"></i> Minhas avaliações</a>
                            </li>
                            <li>
                                <a href="#"><i class="fa fa-user"></i> Minha conta</a>
                            </li>
                            <li>
                                <a href="#"><i class="fa fa-sign-out"></i> Sair</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </aside>
            <!-- /menu -->

            <!-- content -->
            <section class="col-md-8 col-md-offset-1">
                <h2>Minhas Compras</h2>
                <hr>
                <table class="table table-hover">
                    <thead>
                        <tr>
                            <th>Compra</th>
                            <th>Data</th>
                            <th>Valor</th>
                            <th>Estado</th>
                            <th>Ação</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td><strong># 111</strong></td>
                            <td>12/06/2018</td>
                            <td>R$ 198.58</td>
                            <td><span class="label label-info">Em processamento</span></td>
                            <td><a hre="#" class="btn btn-sm btn-info">Ver</a></td>
                        </tr>
                    </tbody>
                </table>

            </section>
            <!-- /content -->
        </div>
        <!-- /row -->
    </div>
    <!-- /container -->
</div>
<!-- /SECTION -->



<%@include file="footer.jsp" %>
