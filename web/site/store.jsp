<%-- 
    Document   : store
    Created on : 27/11/2018, 15:00:27
    Author     : Mateus
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                    <li><a href="#">Página inicial</a></li>
                    <li><a href="#">Categorias</a></li>
                    <li><a href="#">Categoria</a></li>
                    <li class="active">PESQUISA (227,490 resultados)</li>
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
            <!-- ASIDE -->
            <div id="aside" class="col-md-3">
                <!-- aside Widget -->
                <div class="aside">
                    <h3 class="aside-title">Gêneros</h3>
                    <div class="checkbox-filter">
                        <c:forEach items="${generos}" var="obj">
                            <div class="input-checkbox">
                                <input type="checkbox" id="genre-${obj.id}">
                                <label for="genre-${obj.id}">
                                    <span></span>
                                    ${obj.genero}
                                    <small>(${obj.livros.size()})</small>
                                </label>
                            </div>
                        </c:forEach>
                    </div>
                </div>
                <!-- /aside Widget -->
                
                <!-- aside Widget -->
                <div class="aside">
                    <h3 class="aside-title">Classificações</h3>
                    <div class="checkbox-filter">
                        <c:forEach items="${classificacoes}" var="obj">
                            <div class="input-checkbox">
                                <input type="checkbox" id="classification-${obj.id}">
                                <label for="classification-${obj.id}">
                                    <span></span>
                                    ${obj.classificacao}
                                    <small>(${obj.livros.size()})</small>
                                </label>
                            </div>
                        </c:forEach>
                    </div>
                </div>
                <!-- /aside Widget -->
                
                <!-- aside Widget -->
                <div class="aside">
                    <h3 class="aside-title">Autores</h3>
                    <div class="checkbox-filter">
                        <c:forEach items="${autores}" var="obj">
                            <div class="input-checkbox">
                                <input type="checkbox" id="author-${obj.id}">
                                <label for="author-${obj.id}">
                                    <span></span>
                                    ${obj.nome}
                                    <small>(${obj.livros.size()})</small>
                                </label>
                            </div>
                        </c:forEach>
                    </div>
                </div>
                <!-- /aside Widget -->
                
                <!-- aside Widget -->
                <div class="aside">
                    <h3 class="aside-title">Editoras</h3>
                    <div class="checkbox-filter">
                        <c:forEach items="${editoras}" var="obj">
                            <div class="input-checkbox">
                                <input type="checkbox" id="publisher-${obj.id}">
                                <label for="publisher-${obj.id}">
                                    <span></span>
                                    ${obj.nome}
                                    <small>(${obj.livros.size()})</small>
                                </label>
                            </div>
                        </c:forEach>
                    </div>
                </div>
                <!-- /aside Widget -->

                <!-- aside Widget -->
                <div class="aside">
                    <h3 class="aside-title">Preço</h3>
                    <div class="price-filter">
                        <div id="price-slider"></div>
                        <div class="input-number price-min">
                            <input id="price-min" type="number">
                            <span class="qty-up">+</span>
                            <span class="qty-down">-</span>
                        </div>
                        <span>-</span>
                        <div class="input-number price-max">
                            <input id="price-max" type="number">
                            <span class="qty-up">+</span>
                            <span class="qty-down">-</span>
                        </div>
                    </div>
                </div>
                <!-- /aside Widget -->

            </div>
            <!-- /ASIDE -->

            <!-- STORE -->
            <div id="store" class="col-md-9">
                <!-- store top filter -->
                <!--<div class="store-filter clearfix">
                    <div class="store-sort">
                        <label>
                            Ordenar por:
                            <select class="input-select">
                                <option value="0">Popular</option>
                                <option value="1">Maior preço</option>
                                <option value="1">Menor preço</option>
                            </select>
                        </label>

                        <label>
                            Mostrar:
                            <select class="input-select">
                                <option value="0">20</option>
                                <option value="1">50</option>
                            </select>
                        </label>
                    </div>
                    <ul class="store-grid">
                        <li class="active"><i class="fa fa-th"></i></li>
                        <li><a href="#"><i class="fa fa-th-list"></i></a></li>
                    </ul>
                </div>
                -->
                <!-- /store top filter -->

                <!-- store products -->
                <div class="row">
                    <c:forEach items="${lista}" var="obj">
                        <!-- product -->
                        <div class="col-md-4 col-xs-6">
                            <div class="product">
                                <div class="product-img">
                                    <img src="../arquivos/${obj.capa}" alt="">
                                    <div class="product-label">
                                        <span class="sale">-30%</span>
                                        <span class="new">LANÇAMENTO</span>
                                    </div>
                                </div>
                                <div class="product-body">
                                    <p class="product-category">${obj.genero} &bull; <span class="">${obj.classificacao}</span></p>
                                    <h3 class="product-name"><a href="#">${obj.nome}</a></h3>
                                    <h4 class="product-price">R$ 10<!--<del class="product-old-price">$990.00</del>--></h4>
                                    <div class="product-rating">
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                    </div>
                                    <div class="product-btns">
                                        <button class="add-to-wishlist"><i class="fa fa-heart-o"></i><span class="tooltipp">+lista de desejos</span></button>
                                        <!--<button class="add-to-compare"><i class="fa fa-exchange"></i><span class="tooltipp">add to compare</span></button>-->
                                        <button class="quick-view"><i class="fa fa-eye"></i><span class="tooltipp">ver produto</span></button>
                                    </div>
                                </div>
                                <div class="add-to-cart">
                                    <button class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i> add ao carrinho</button>
                                </div>
                            </div>
                        </div>
                        <!-- /product -->
                    </c:forEach>

                </div>
                <!-- /store products -->

                <!-- store bottom filter -->
                <!--
                <div class="store-filter clearfix">
                    <span class="store-qty">Mostrando 20-100 produtos</span>
                    <ul class="store-pagination">
                        <li class="active">1</li>
                        <li><a href="#">2</a></li>
                        <li><a href="#">3</a></li>
                        <li><a href="#">4</a></li>
                        <li><a href="#"><i class="fa fa-angle-right"></i></a></li>
                    </ul>
                </div>
                -->
                <!-- /store bottom filter -->
            </div>
            <!-- /STORE -->
        </div>
        <!-- /row -->
    </div>
    <!-- /container -->
</div>
<!-- /SECTION -->

<%@include file="footer.jsp" %>