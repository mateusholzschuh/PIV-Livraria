<%@page import="dao.GeneroDAO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!-- FOOTER -->
<footer id="footer">
    <!-- top footer -->
    <div class="section">
        <!-- container -->
        <div class="container">
            <!-- row -->
            <div class="row">
                <div class="col-md-3 col-xs-6">
                    <div class="footer">
                        <h3 class="footer-title">Sobre nós</h3>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut.</p>
                        <ul class="footer-links">
                            <li><a href="#"><i class="fa fa-map-marker"></i>1734 Stonecoal Road</a></li>
                            <li><a href="#"><i class="fa fa-phone"></i>+55 4002-8922</a></li>
                            <li><a href="#"><i class="fa fa-envelope-o"></i>bookstore@deadhlz.com</a></li>
                        </ul>
                    </div>
                </div>

                <div class="col-md-6 col-xs-12">
                    <div class="footer">
                        <h3 class="footer-title">Gêneros</h3>                        
                        <ul class="footer-links list-inline">
                            <c:forEach items="${generos}" var="obj">
                                <li><a href="#">${obj.genero}</a></li>
                            </c:forEach>
                            <!--
                            <li><a href="#">Laptops</a></li>
                            <li><a href="#">Smartphones</a></li>
                            <li><a href="#">Cameras</a></li>
                            <li><a href="#">Accessories</a></li>
                            <li><a href="#">Hot deals</a></li>
                            <li><a href="#">Laptops</a></li>
                            <li><a href="#">Smartphones</a></li>
                            <li><a href="#">Cameras</a></li>
                            <li><a href="#">Accessories</a></li>
                            -->
                        </ul>
                    </div>
                </div>

                <div class="clearfix visible-xs"></div>

                <!-- commented
                <div class="col-md-3 col-xs-6">
                    <div class="footer">
                        <h3 class="footer-title">Informações</h3>
                        <ul class="footer-links">
                            <li><a href="#">Sobre nós</a></li>
                            <li><a href="#">Contato</a></li>
                            <li><a href="#">Politica de Privacidade</a></li>
                            <li><a href="#">Compras e Devoluções</a></li>
                            <li><a href="#">Termos e Condições</a></li>
                        </ul>
                    </div>
                </div>
                -->

                <div class="col-md-3 col-xs-6">
                    <div class="footer">
                        <h3 class="footer-title">Serviços</h3>
                        <ul class="footer-links">
                            <li><a href="#">Minha Conta</a></li>
                            <li><a href="#">Ver Carrinho</a></li>
                            <li><a href="#">Lista de Desejos</a></li>
                            <li><a href="#">Minhas Compras</a></li>
                            <li><a href="#">Ajuda</a></li>
                        </ul>
                    </div>
                </div>
            </div>
            <!-- /row -->
        </div>
        <!-- /container -->
    </div>
    <!-- /top footer -->

    <!-- bottom footer -->
    <div id="bottom-footer" class="section">
        <div class="container">
            <!-- row -->
            <div class="row">
                <div class="col-md-12 text-center">
                    <ul class="footer-payments">
                        <li><a href="#"><i class="fa fa-cc-visa"></i></a></li>
                        <li><a href="#"><i class="fa fa-credit-card"></i></a></li>
                        <li><a href="#"><i class="fa fa-cc-paypal"></i></a></li>
                        <li><a href="#"><i class="fa fa-cc-mastercard"></i></a></li>
                        <li><a href="#"><i class="fa fa-cc-discover"></i></a></li>
                        <li><a href="#"><i class="fa fa-cc-amex"></i></a></li>
                    </ul>
                    <span class="copyright">
                        <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                        Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="fa fa-heart-o" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
                        <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                    </span>
                </div>
            </div>
            <!-- /row -->
        </div>
        <!-- /container -->
    </div>
    <!-- /bottom footer -->
</footer>
<!-- /FOOTER -->

<!-- jQuery Plugins -->
<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/slick.min.js"></script>
<script src="js/nouislider.min.js"></script>
<script src="js/jquery.zoom.min.js"></script>
<script src="js/main.js"></script>

</body>
</html>

