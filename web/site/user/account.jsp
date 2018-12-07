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
                    <li class="active">Minha conta</li>
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
                            <li>
                                <a href="?tab=reviews"><i class="fa fa-heart"></i> Minhas avaliações</a>
                            </li>
                            <li class="active">
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
                <div class="alert alert-danger"><p>Aconteceu um problema</p></div>
                <div class="row">
                    <div class="col-md-6">
                        <div class="panel panel-info">
                            <div class="panel-heading">
                                <h4 class="panel-title">Alterar foto</h4>
                            </div>
                            <div class="panel-body">
                                <div class="img-container text-center">
                                    <img src="https://www.wired.it/wp-content/plugins/wordpress-social-login/assets/images/default-avatar.jpg" class="img-thumbnail img-circle" style="max-height: 200px;"/>
                                </div>
                                <hr>
                                <form class="form">
                                    <div class="form-group">
                                         <label>Escolher uma nova foto:</label>
                                        <input type="file" name="data[image]" class="form-control-file">
                                    </div>
                                    <div class="form-group">
                                        <button type="submit" class="primary-btn"><i class="fa fa-save"></i> Salvar</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="panel panel-info">
                            <div class="panel-heading">
                                <h4 class="panel-title">Alterar dados</h4>
                            </div>
                            <div class="panel-body">
                                <form class="form">
                                    <div class="form-group">
                                        <label>Nome</label>
                                        <input type="text" name="txtNome" class="input" placeholder="Nome" required="">
                                    </div>
                                    <div class="form-group">
                                        <label>Email</label>
                                        <input type="email" name="txtEmail" class="input" placeholder="Email" required="">
                                    </div>
                                    <div class="form-group">
                                        <label>Senha</label>
                                        <input type="password" name="txtSenha" class="input" placeholder="Senha" required="">
                                    </div>
                                    <div class="form-group">
                                        <label>Confirmar Senha</label>
                                        <input type="password" name="txtSenhaConf" class="input" placeholder="Confirmar Senha" required="">
                                    </div>
                                    <div class="form-group">
                                        <button type="submit" class="primary-btn"><i class="fa fa-save"></i> Salvar</button>
                                    </div>
                                </form>
                            </div>
                        </div>
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
