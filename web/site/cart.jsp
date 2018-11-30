<%-- 
    Document   : cart
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
                <h3 class="breadcrumb-header">Carrinho</h3>
                <ul class="breadcrumb-tree">
                    <li><a href="#">Página Inicial</a></li>
                    <li class="active">Carrinho</li>
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
            <!-- Order Details -->
            <div class="col-md-12 order-details">
                <div class="section-title text-center">
                    <h3 class="title">Seus produtos</h3>
                    <hr>
                </div>

                <table class="table table-responsive-md cart-table">
                    <thead>
                        <tr>
                            <th></th>
                            <th>PRODUTO</th>
                            <th></th>
                            <th>PREÇO</th>
                            <th>QUANTIDADE</th>
                            <th>TOTAL</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${carrinho.getItens()}" var="obj">
                        <tr>
                            <td>
                                <a href="?remove=${obj.livro.id}" title="Remover"><i class="fa fab fa-remove"></i></a>                                
                            </td>
                            <td class="product-col">
                                <img src="../arquivos/${obj.livro.capa}" alt="">                                
                            </td>
                            <td>${obj.livro.nome}</td>
                            <td>${obj.livro.preco}</td>
                            <td>
                                <input class="form-control qty-inpt" id="i${obj.livro.id}" type="number" value="${obj.getQuantidade()}">
                                <a href="#" onclick="updateItem('?update=${obj.livro.id}&qtd=', 'i${obj.livro.id}');" title="Atualizar"><i class="fa fab fa-refresh"></i></a>
                            </td>
                            <td><strong>R$ ${obj.getPrecoTotal()}</strong></td>
                        </tr>
                        </c:forEach>
                        <!--
                        <tr>
                            <td>
                                <a href="#" title="Remover"><i class="fa fab fa-remove"></i></a>                                
                            </td>
                            <td class="product-col">
                                <img src="./img/product01.png" alt="">                                
                            </td>
                            <td>LIVRO TAL NOME TAL</td>
                            <td>R$ 99,90</td>
                            <td>
                                <input class="form-control qty-inpt" type="number" value="1">
                                <a href="#" title="Atualizar"><i class="fa fab fa-refresh"></i></a>
                            </td>
                            <td><strong>R$ 99,90</strong></td>
                        </tr>
                        -->
                    </tbody>
                </table>
                <hr>
                <div class="order-summary">
                    <div class="order-col">
                        <div><strong>TOTAL</strong></div>
                        <div><strong class="order-total">R$ ${carrinho.getTotalPrice()}</strong></div>
                    </div>
                </div>
                <a href="#" class="primary-btn order-submit">Fazer Checkout</a>
            </div>
            <!-- /Order Details -->
        </div>
        <!-- /row -->
    </div>
    <!-- /container -->
</div>
<!-- /SECTION -->



<%@include file="footer.jsp" %>
