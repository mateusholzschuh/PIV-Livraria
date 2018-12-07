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
                    <li class="active">Fazer Login &bull; Cadastrar-se</li>
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
            <!-- login -->
            <div class="col-md-5">
                <h2 class="text-uppercase">Fazer Login</h2>
                <p class="lead">Já é cliente?</p>
                <hr>
                <form action="?" method="POST" class="form">
                    <c:if test="${not empty msglogin}">
                    <div class="alert alert-danger"><p>${msglogin}</p></div>
                    </c:if>
                    <div class="form-group">
                        <label>Email</label>
                        <input type="email" name="txtEmail" class="input" placeholder="Digite seu email" required>
                    </div>
                    <div class="form-group">
                        <label>Senha</label>
                        <input type="password" name="txtSenha" class="input" placeholder="Digite sua senha" required>
                    </div>
                    <div class="form-group">
                        <input type="hidden" value="login" name="acao">
                        <button  type="submit" class="primary-btn"><i class="fa fa-sign-in"></i> Login</button>
                    </div>
                </form>
            </div>
            <!-- /login -->
            
            <!-- register -->
            <div class="col-md-5 col-md-offset-1">
                <h2 class="text-uppercase">Cadastrar-se</h2>
                <p class="lead">Ainda não é cliente?</p>
                <hr>
                <form action="?" method="POST" class="form" name="f2">
                    <c:if test="${not empty msgregister}">
                    <div class="alert alert-danger"><p>${msgregister}</p></div>
                    </c:if>
                    <div class="form-group">
                        <label>Nome</label>
                        <input type="text" name="txtNome" class="input" placeholder="Digite seu nome" required>
                    </div>
                    <div class="form-group">
                        <label>Email</label>
                        <input type="email" name="txtEmail" class="input" placeholder="Digite seu email" required>
                    </div>
                    <div class="form-group">
                        <label>Senha</label>
                        <input type="password" name="txtSenha" class="input" placeholder="Digite sua senha" required>
                    </div>
                    <div class="form-group">
                        <input type="hidden" value="register" name="acao">
                        <button type="submit" class="primary-btn"><i class="fa fa-user-plus"></i> Cadastrar</button>
                    </div>
                </form>
            </div>
            <!-- /register -->
        </div>
        <!-- /row -->
    </div>
    <!-- /container -->
</div>
<!-- /SECTION -->



<%@include file="footer.jsp" %>
