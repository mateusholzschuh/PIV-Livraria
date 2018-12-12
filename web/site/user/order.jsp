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
                    <li class="active">Compra <strong># ${order.id}</strong></li>
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
                <h2>Compra # ${order.id} <span class="badge">[ ${order.getDataString()} ]</span></h2>
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
                        <c:forEach items="${order.getItens()}" var="item">
                            <tr>
                                <td>
                                    ${item.livro.nome}
                                </td>
                                <td>${item.quantidade}</td>
                                <td>R$ ${item.livro.preco}</td>
                                <td>R$ ${item.getPrecoTotal()}</td>
                            </tr>
                        </c:forEach>
                    </tbody>
                    <tfoot>
                        <tr>
                            <td></td>
                            <td></td>
                            <td>Subtotal</td>
                            <td>R$ ${order.getPrecoTotal()}</td>
                        </tr>
                        <tr>
                            <td></td>
                            <td></td>
                            <td class="lead">Total</td>
                            <td class="lead">R$ ${order.getPrecoTotal()}</td>
                        </tr>
                    </tfoot>
                </table>

                <hr>

                <div class="row">
                    <div class="col-md-6">
                        <h4 class="text-uppercase">Endereço de entrega</h4>
                        <ul>
                            <li><strong>Endereço: </strong>${order.endereco}</li>
                            <li><strong>Cidade </strong>${order.cidade}</li>
                            <li><strong>CEP </strong>${order.cep}</li>
                            <li><strong>Telefone: </strong>${order.telefone}</li>
                            <li><strong>Observações: </strong>${order.observacoes}</li>                            
                        </ul>                        
                    </div>
                    <div class="col-md-6">
                        <h4 class="text-uppercase">Método de pagamento</h4>
                        <p>${order.metodoPagamento}</p>
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
