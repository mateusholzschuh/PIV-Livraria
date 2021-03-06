<%-- 
    Document   : checkout
    Created on : 27/11/2018, 16:31:52
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
                <h3 class="breadcrumb-header">Checkout</h3>
                <ul class="breadcrumb-tree">
                    <li><a href="#">Página inicial</a></li>
                    <li class="active">Checkout</li>
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
            
            <div style="display: none;" class="alert alert-danger"><p>Ocorreu um erro</p></div>

            <form action="#" method="post">
            <div class="col-md-7">
                <!-- Billing Details -->
                <div class="billing-details">
                    <div class="section-title">
                        <h3 class="title">Endereço de entrega</h3>
                    </div>
                    <div class="form-group">
                        <input class="input" type="text" name="first-name" placeholder="Nome" value="${sessionScope['usuario-site'].nome}">
                    </div>
                    <div class="form-group">
                        <input class="input" type="email" name="email" placeholder="Email" value="${sessionScope['usuario-site'].email}">
                    </div>
                    <div class="form-group">
                        <input class="input" type="text" name="address" placeholder="Endereço" required="">
                    </div>
                    <div class="form-group">
                        <input class="input" type="text" name="city" placeholder="Cidade" required="">
                    </div>
                    <div class="form-group">
                        <input class="input" type="text" name="zip-code" placeholder="CEP" required="">
                    </div>
                    <div class="form-group">
                        <input class="input" type="tel" name="tel" placeholder="Telefone" required="">
                    </div>
                    <!--div class="form-group">
                        <div class="input-checkbox">
                            <input type="checkbox" id="create-account">
                            <label for="create-account">
                                <span></span>
                                Deseja criar uma conta?
                            </label>
                            <div class="caption">                                
                                <div class="form-group">
                                    <input class="input" type="text" name="first-name" placeholder="Nome">
                                </div>
                                <div class="form-group">
                                    <input class="input" type="email" name="email" placeholder="Email">
                                </div>
                                <div class="form-group">
                                    <input class="input" type="password" name="password" placeholder="Senha">
                                </div>
                                <div class="form-group">
                                    <input class="primary-btn radius-0" type="submit" value="Cadastrar">
                                </div>
                            </div>
                        </div>
                    </div-->
                </div>
                <!-- /Billing Details -->

                <!-- Order notes -->
                <div class="order-notes">
                    <textarea class="input" placeholder="Observações para entrega..." name="observacoes"></textarea>
                </div>
                <!-- /Order notes -->
            </div>

            <!-- Order Details -->
            <div class="col-md-5 order-details">
                <div class="section-title text-center">
                    <h3 class="title">Sua compra</h3>
                </div>
                <div class="order-summary">
                    <div class="order-col">
                        <div><strong>PRODUTO</strong></div>
                        <div><strong>TOTAL</strong></div>
                    </div>
                    <div class="order-products">
                        <c:forEach items="${sessionScope['carrinho'].getItens()}" var="item">
                        <div class="order-col">
                            <div>${item.quantidade}x ${item.livro.nome}</div>
                            <div>R$ ${item.getPrecoTotal()}</div>
                        </div>
                        </c:forEach>                        
                    </div>
                    <div class="order-col">
                        <div>Frete</div>
                        <div><strong>Grátis</strong></div>
                    </div>
                    <div class="order-col">
                        <div><strong>TOTAL</strong></div>
                        <div><strong class="order-total">R$ ${sessionScope['carrinho'].getTotalPrice()}</strong></div>
                    </div>
                </div>
                <hr>
                <div class="payment-method">
                    <h4>Método de pagamento</h4>
                    <hr>
                    <div class="input-radio">
                        <input type="radio" name="payment" id="payment-1" value="Boleto Bancário" checked="">
                        <label for="payment-1">
                            <span></span>
                            Boleto Bancário
                        </label>
                        <div class="caption">
                            <p>Pagamento via boleto bancário.</p>
                        </div>
                    </div>
                    <div class="input-radio">
                        <input type="radio" name="payment" id="payment-2" value="Cartão de Crédito">
                        <label for="payment-2">
                            <span></span>
                            Cartão de Crédito
                        </label>
                        <div class="caption">
                            <p>Pagamento via cartão de crédito.</p>
                        </div>
                    </div>
                    <div class="input-radio">
                        <input type="radio" name="payment" id="payment-3" value="Paypal">
                        <label for="payment-3">
                            <span></span>
                            Paypal
                        </label>
                        <div class="caption">
                            <p>Pagamento via Paypal.</p>
                        </div>
                    </div>
                </div>
                <div class="input-checkbox">
                    <input type="checkbox" id="terms" required="">
                    <label for="terms">
                        <span></span>
                        Eu li e concordo com os <a href="#">termos e condições</a>
                    </label>
                </div>
                <button type="submit" class="primary-btn order-submit">Finalizar compra</button>
            </div>
            <!-- /Order Details -->
            </form>
        </div>
        <!-- /row -->
    </div>
    <!-- /container -->
</div>
<!-- /SECTION -->

<%@include file="footer.jsp" %>