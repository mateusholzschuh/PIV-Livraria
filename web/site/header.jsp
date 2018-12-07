<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="dao.AutorDAO"%>
<%@page import="dao.EditoraDAO"%>
<%@page import="dao.ClassificacaoDAO"%>
<%@page import="dao.GeneroDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>    
<%
    GeneroDAO gdao = new GeneroDAO();
    request.setAttribute("generos", gdao.listar());
    gdao.fecharConexao();

    ClassificacaoDAO cdao = new ClassificacaoDAO();
    request.setAttribute("classificacoes", cdao.listar());
    cdao.fecharConexao();

    EditoraDAO edao = new EditoraDAO();
    request.setAttribute("editoras", edao.listar());
    edao.fecharConexao();

    AutorDAO adao = new AutorDAO();
    request.setAttribute("autores", adao.listar());
    adao.fecharConexao();
%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

        <title>DeadHLZ - LivrariaOnline</title>

        <!-- Google font -->
        <link href="https://fonts.googleapis.com/css?family=Montserrat:400,500,700" rel="stylesheet">

        <!-- Bootstrap -->
        <link type="text/css" rel="stylesheet" href="css/bootstrap.min.css"/>

        <!-- Slick -->
        <link type="text/css" rel="stylesheet" href="css/slick.css"/>
        <link type="text/css" rel="stylesheet" href="css/slick-theme.css"/>

        <!-- nouislider -->
        <link type="text/css" rel="stylesheet" href="css/nouislider.min.css"/>

        <!-- Font Awesome Icon -->
        <link rel="stylesheet" href="css/font-awesome.min.css">

        <!-- Custom stlylesheet -->
        <link type="text/css" rel="stylesheet" href="css/style.css"/>
        <link href="css/modified.css" rel="stylesheet" type="text/css"/>
        <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
          <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->

    </head>
    <body>
        <!-- HEADER -->
        <header>
            <!-- TOP HEADER -->
            <div id="top-header">
                <div class="container">
                    <ul class="header-links pull-left">
                        <li><a href="#"><i class="fa fa-phone"></i> +55 4002-8922</a></li>
                        <li><a href="#"><i class="fa fa-envelope-o"></i> bookstore@deadhlz.com</a></li>
                        <li><a href="#"><i class="fa fa-map-marker"></i> 1734 Stonecoal Road</a></li>
                    </ul>
                    <ul class="header-links pull-right">
                        <c:if test="${sessionScope['usuario-site'] != null}">
                        <li><a href="#"><i class="fa fa-dollar"></i> R$ (REAIS)</a></li>
                        <li><a href="user?tab=account"><i class="fa fa-user-o"></i>Olá, ${sessionScope['usuario-site'].nome}</a></li>
                        <li><a href="logout"><i class="fa fa-sign-out"></i> Sair</a></li>
                        </c:if>
                        <c:if test="${sessionScope['usuario-site'] == null}">
                        <li><a href="login"><i class="fa fa-sign-in"></i> Login</a></li>
                        <li><a href="login"><i class="fa fa-user-plus"></i> Cadastre-se</a></li>
                        <li><a href="../admin"><i class="fa fa-gears"></i> Intranet</a></li>
                        </c:if>
                    </ul>
                </div>
            </div>
            <!-- /TOP HEADER -->

            <!-- MAIN HEADER -->
            <div id="header">
                <!-- container -->
                <div class="container">
                    <!-- row -->
                    <div class="row">
                        <!-- LOGO -->
                        <div class="col-md-3">
                            <div class="header-logo">
                                <a href="../site/store" class="logo">
                                    <!--img src="./img/logo.png" alt=""-->
                                    <h1 style="margin: 15px 0 0 0;color:#fff;"><I CLASS="fa fa-book"></i> DeadHLZ<span style="color:red;">.</span></h1>
                                </a>
                            </div>
                        </div>
                        <!-- /LOGO -->

                        <!-- SEARCH BAR -->
                        <div class="col-md-6">
                            <div class="header-search">
                                <!--form-->
                                    <!--select class="input-select">
                                        <option value="0">Todas</option>
                                        <option value="1">Category 01</option>
                                        <option value="1">Category 02</option>
                                    </select-->
                                    <input class="input-select input" id="search-input" placeholder="Busque aqui...">
                                    <button class="search-btn" onclick="searchbk('../site/store?acao=filtro&q=nome=', 'search-input')">Buscar</button>
                                <!--/form-->
                            </div>
                        </div>
                        <!-- /SEARCH BAR -->

                        <!-- ACCOUNT -->
                        <div class="col-md-3 clearfix">
                            <div class="header-ctn">
                                <!-- Wishlist -->
                                <div>
                                    <a href="site.zip">
                                        <i class="fa fa-heart-o"></i>
                                        <span>Baixar</span>
                                        <div class="qty">2</div>
                                    </a>
                                </div>
                                <!-- /Wishlist -->

                                <!-- Cart -->
                                <div class="dropdown">
                                    <a class="dropdown-toggle" data-toggle="dropdown" aria-expanded="true">
                                        <i class="fa fa-shopping-cart"></i>
                                        <span>Carrinho</span>
                                        <c:if test="${carrinho != null && carrinho.getTotalItems() > 0}">
                                            <div class="qty">${carrinho.getTotalItems()}</div>
                                        </c:if>
                                    </a>
                                    <div class="cart-dropdown">
                                        <c:if test="${carrinho != null && carrinho.getTotalItems() > 0 }">
                                            <div class="cart-list">
                                                <c:forEach items="${carrinho.getItens()}" var="obj">
                                                    <div class="product-widget">
                                                        <div class="product-img">
                                                            <img src="../arquivos/${obj.livro.capa}" alt="">
                                                        </div>
                                                        <div class="product-body">
                                                            <h3 class="product-name"><a href="#">${obj.livro.nome}</a></h3>
                                                            <h4 class="product-price"><span class="qty">${obj.quantidade}x</span>R$ ${obj.getPrecoTotal()}</h4>
                                                        </div>
                                                        <button class="delete" onclick="goURL('../site/cart?remove=${obj.livro.id}')"><i class="fa fa-close"></i></button>
                                                    </div>
                                                </c:forEach>
                                                <!--
                                                <div class="product-widget">
                                                    <div class="product-img">
                                                        <img src="./img/product02.png" alt="">
                                                    </div>
                                                    <div class="product-body">
                                                        <h3 class="product-name"><a href="#">product name goes here</a></h3>
                                                        <h4 class="product-price"><span class="qty">3x</span>$980.00</h4>
                                                    </div>
                                                    <button class="delete"><i class="fa fa-close"></i></button>
                                                </div>
                                                -->
                                            </div>
                                        </c:if>
                                        <c:if test="${carrinho == null || carrinho.getTotalItems() == 0}">
                                            <h4>Nenhum item no carrinho</h4>
                                        </c:if>
                                        <div class="cart-summary">
                                            <small>${carrinho != null ? carrinho.getTotalItems().toString().concat(" itens selecionados") : "Nenhum item selecionado"}</small>
                                            <h5>SUBTOTAL: ${carrinho != null ? "R$ ".concat(carrinho.getTotalPrice().toString()) : "R$ 0.00"}</h5>
                                        </div>
                                        <div class="cart-btns">
                                            <a href="cart">Ver Carrinho</a>
                                            <a href="#">Checkout  <i class="fa fa-arrow-circle-right"></i></a>
                                        </div>
                                    </div>
                                </div>
                                <!-- /Cart -->

                                <!-- Menu Toogle -->
                                <div class="menu-toggle">
                                    <a href="#">
                                        <i class="fa fa-bars"></i>
                                        <span>Menu</span>
                                    </a>
                                </div>
                                <!-- /Menu Toogle -->
                            </div>
                        </div>
                        <!-- /ACCOUNT -->
                    </div>
                    <!-- row -->
                </div>
                <!-- container -->
            </div>
            <!-- /MAIN HEADER -->
        </header>
        <!-- /HEADER -->

        <!-- NAVIGATION -->
        <nav id="navigation">
            <!-- container -->
            <div class="container">
                <!-- responsive-nav -->
                <div id="responsive-nav">
                    <!-- NAV -->
                    <ul class="main-nav nav navbar-nav">
                        <li class=""><a href="../site/store">Página Inicial</a></li>
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">Autores <b class="caret"></b></a>
                            <ul class="dropdown-menu">
                                <c:forEach items="${autores}" var="obj">
                                <li><a href="../site/store?acao=filtro&q=autor=${obj.nome}@">${obj.nome}</a></li>
                                </c:forEach>
                            </ul>
                        </li>
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">Gêneros <b class="caret"></b></a>
                            <ul class="dropdown-menu">
                                <c:forEach items="${generos}" var="obj">
                                <li><a href="../site/store?acao=filtro&q=genero=${obj.genero}@">${obj.genero}</a></li>
                                </c:forEach>
                            </ul>
                        </li>
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">Editoras <b class="caret"></b></a>
                            <ul class="dropdown-menu">
                                <c:forEach items="${editoras}" var="obj">
                                <li><a href="../site/store?acao=filtro&q=editora=${obj.nome}@">${obj.nome}</a></li>
                                </c:forEach>
                            </ul>
                        </li>
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">Classificação <b class="caret"></b></a>
                            <ul class="dropdown-menu">
                                <c:forEach items="${classificacoes}" var="obj">
                                <li><a href="../site/store?acao=filtro&q=classificacao=${obj.classificacao}@">${obj.classificacao}</a></li>
                                </c:forEach>
                            </ul>
                        </li>
                    </ul>
                    <!-- /NAV -->
                </div>
                <!-- /responsive-nav -->
            </div>
            <!-- /container -->
        </nav>
        <!-- /NAVIGATION -->
