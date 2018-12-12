<%-- 
    Document   : product.jsp
    Created on : 27/11/2018, 14:23:58
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
                    <li><a href="../site/store">Livros</a></li>
                    <li><a href="../site/store?acao=filtro&q=genero=${livro.genero}@">${livro.genero}</a></li>
                    <li><a href="../site/store?acao=filtro&q=autor=${livro.autor}@">${livro.autor}</a></li>
                    <li class="active">${livro.nome}</li>
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
            <!-- Product main img -->
            <div class="col-md-5 col-md-push-2">
                <div id="product-main-img">
                    <div class="product-preview">
                        <img src="../arquivos/${livro.capa}" alt="">
                    </div>
                    <!--
                    <div class="product-preview">
                        <img src="./img/product03.png" alt="">
                    </div>

                    <div class="product-preview">
                        <img src="./img/product06.png" alt="">
                    </div>

                    <div class="product-preview">
                        <img src="./img/product08.png" alt="">
                    </div>
                    -->
                </div>
            </div>
            <!-- /Product main img -->

            <!-- Product thumb imgs -->
            <div class="col-md-2  col-md-pull-5">
                <div id="product-imgs">
                    <div class="product-preview">
                        <img src="../arquivos/${livro.capa}" alt="">
                    </div>
                    <!--
                    <div class="product-preview">
                        <img src="./img/product03.png" alt="">
                    </div>

                    <div class="product-preview">
                        <img src="./img/product06.png" alt="">
                    </div>

                    <div class="product-preview">
                        <img src="./img/product08.png" alt="">
                    </div>
                    -->
                </div>
            </div>
            <!-- /Product thumb imgs -->

            <!-- Product details -->
            <div class="col-md-5">
                <div class="product-details">
                    <h2 class="product-name">${livro.nome}</h2>
                    <div>
                        <div class="product-rating">
                            ${stars}
                        </div>
                        <a class="review-link" href="#product-tab">${livro.avaliacaos.size()} Avaliações | Adicione sua avaliação</a>
                    </div>
                    <div>
                        <h3 class="product-price">R$ ${livro.preco} <!--<del class="product-old-price">$990.00</del>--></h3>
                        <span class="product-available">Disponível</span>
                    </div>
                    <p style="display:none">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>

                    <div class="product-options">
                        <!-- commented
                        <label>
                            Size
                            <select class="input-select">
                                <option value="0">X</option>
                            </select>
                        </label>
                        <label>
                            Color
                            <select class="input-select">
                                <option value="0">Red</option>
                            </select>
                        </label>
                        -->
                    </div>
                    <div class="add-to-cart">
                        <div class="qty-label">
                            Qtd
                            <div class="input-number">
                                <input type="number" value="1" id="qtd-item">
                                <span class="qty-up">+</span>
                                <span class="qty-down">-</span>
                            </div>
                        </div>
                        <button class="add-to-cart-btn" onclick="updateItem('../site/cart?add=${livro.id}&qtd=', 'qtd-item')"><i class="fa fa-shopping-cart"></i> add ao carrinho</button>
                    </div>

                    <ul class="product-btns">
                        <!-- commented <li><a href="#"><i class="fa fa-heart-o"></i> add à lista de desejos</a></li> -->
                        <!-- commented <li><a href="#"><i class="fa fa-exchange"></i> add to compare</a></li> -->
                    </ul>

                    <ul class="product-links">
                        <li>Gênero &bull;</li>
                        <li><a href="#">${livro.genero}</a></li>
                        <br><li>Classificação &bull;</li>
                        <li><a href="#">${livro.classificacao}</a></li>
                        <!--<li><a href="#">Accessories</a></li>-->
                    </ul>

                    <!-- commented
                    <ul class="product-links">
                        <li>Share:</li>
                        <li><a href="#"><i class="fa fa-facebook"></i></a></li>
                        <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                        <li><a href="#"><i class="fa fa-google-plus"></i></a></li>
                        <li><a href="#"><i class="fa fa-envelope"></i></a></li>
                    </ul>
                    -->

                </div>
            </div>
            <!-- /Product details -->

            <!-- Product tab -->
            <div class="col-md-12">
                <div id="product-tab">
                    <!-- product tab nav -->
                    <ul class="tab-nav">
                        <li class="active"><a data-toggle="tab" href="#tab1">Detalhes</a></li>
                        <li><a data-toggle="tab" href="#tab2">Avaliações (${livro.avaliacaos.size()})</a></li>
                    </ul>
                    <!-- /product tab nav -->

                    <!-- product tab content -->
                    <div class="tab-content">

                        <!-- tab2  -->
                        <div id="tab1" class="tab-pane fade in active">
                            <div class="row">
                                <div class="col-md-12">
                                    <p>${livro.descricao}</p>
                                </div>
                            </div>
                        </div>
                        <!-- /tab2  -->

                        <!-- tab3  -->
                        <div id="tab2" class="tab-pane fade in">
                            <div class="row">
                                
                                <!-- Reviews -->
                                <div class="col-md-6">
                                    <div id="reviews">
                                        <ul class="reviews">
                                            <c:forEach items="${livro.avaliacaos}" var="k">
                                                <li>
                                                    <div class="review-heading">
                                                        <h5 class="name">${k.usuario.nome}</h5>
                                                        <p class="date">${k.getDataString()}</p>
                                                        <div class="review-rating">
                                                            ${k.getEstrelasHTML()}
                                                        </div>
                                                    </div>
                                                    <div class="review-body">
                                                        <p>${k.comentario}</p>
                                                    </div>
                                                </li>
                                            </c:forEach>                                            
                                        </ul>
                                        <ul class="reviews-pagination" style="display: none">
                                            <li class="active">1</li>
                                            <li><a href="#">2</a></li>
                                            <li><a href="#">3</a></li>
                                            <li><a href="#">4</a></li>
                                            <li><a href="#"><i class="fa fa-angle-right"></i></a></li>
                                        </ul>
                                    </div>
                                </div>
                                <!-- /Reviews -->

                                <!-- Review Form -->
                                <div class="col-md-3">
                                    <c:if test="${sessionScope['usuario-site'].getId() != null}">
                                        <div id="review-form">
                                            <form action="?acao=avaliar" method="post" class="review-form">
                                                <input class="input" type="text" placeholder="Seu nome" value="${sessionScope['usuario-site'].nome}" readonly="">
                                                <input type="hidden" name="lid" value="${livro.id}">
                                                <textarea class="input" name="txtComentario" placeholder="Sua avaliação" required=""></textarea>
                                                <div class="input-rating">
                                                    <span>Sua avaliação: </span>
                                                    <div class="stars">
                                                        <input id="star5" name="rating" value="5" type="radio"><label for="star5"></label>
                                                        <input id="star4" name="rating" value="4" type="radio"><label for="star4"></label>
                                                        <input id="star3" name="rating" value="3" type="radio"><label for="star3"></label>
                                                        <input id="star2" name="rating" value="2" type="radio"><label for="star2"></label>
                                                        <input id="star1" name="rating" value="1" type="radio"><label for="star1"></label>
                                                    </div>
                                                </div>
                                                <button class="primary-btn">Enviar</button>
                                            </form>
                                        </div>
                                    </c:if>
                                </div>
                                <!-- /Review Form -->
                            </div>
                        </div>
                        <!-- /tab3  -->
                    </div>
                    <!-- /product tab content  -->
                </div>
            </div>
            <!-- /product tab -->
        </div>
        <!-- /row -->
    </div>
    <!-- /container -->
</div>
<!-- /SECTION -->


<%@include file="footer.jsp" %>
