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
                    <li class="active">Minhas Avaliações</li>
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
                            <li>
                                <a href="?tab=orders"><i class="fa fa-list"></i> Minhas compras</a>
                            </li>
                            <li class="active">
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
                <h2>Minhas Avaliações</h2>
                <hr>
                <table class="table table-hover">
                    <thead>
                        <tr>
                            <th></th>
                            <th>Avaliação</th>
                            <th>Produto</th>
                            <th>Data</th>
                            <th>Ação</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${reviews}" var="obj">
                        <tr>
                            <td><strong># ${obj.id}</strong></td>
                            <td>${obj.estrelas} estrelas</td>
                            <td><a href="../site/store?acao=mostrar&id=${obj.livro.id}">${obj.livro.nome}</a></td>
                            <td>${obj.getDataString()}</td>
                            <td><a href="../site/store?acao=mostrar&id=${obj.livro.id}" class="btn btn-sm btn-info">Ver</a></td>
                        </tr>
                        </c:forEach>
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



<%@include file="../footer.jsp" %>
