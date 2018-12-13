<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="../cabecalho.jsp" %>
<div class="card">
    <div class="card-header">
        <h5 class="title">Adiciona Livro</h5>
    </div>
    <div class="card-body">
        <!--MODIFICAR PARA ADD-->
        <form action="UploadWS" method="POST" enctype="multipart/form-data">
            <input type="hidden" name="urldestino" value="LivroWS">
            <div class="row">
                <div class="col-md-3 pr-md-1">
                    <div class="form-group">
                        <label>Id</label>
                        <input type="text" class="form-control" name="txtId" placeholder="Id" value="${obj.id}" readonly="true">
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-5 pr-md-1">
                    <div class="form-group">
                        <label>Nome</label>
                        <input type="text" name="txtNome" required class="form-control" placeholder="Nome" value="${obj.nome}">
                    </div>
                </div>
                <div class="col-md-5 pr-md-1">
                    <div class="form-group">
                        <label>Pre�o</label>
                        <input type="number" step="0.01" name="txtPreco" required class="form-control" placeholder="Pre�o" value="${obj.preco}">
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-5 pr-md-1">
                    <div class="form-group">
                        <label>Lan�amento</label>
                        <input type="date" name="txtLancamento" required class="form-control" value="${obj.lancamento}">
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-5 pr-md-1">
                    <div class="form-group">
                        <label>Autor</label>
                        <select class="form-control" name="txtAutor">
                            <c:forEach items="${_autor}" var="a">
                                <option value="${a.id}" <c:if test="${a.id == obj.autor.id}">selected</c:if>>${a.nome}</option>
                            </c:forEach>
                        </select>
                    </div>
                </div>
                <div class="col-md-5 pr-md-1">
                    <div class="form-group">
                        <label>Editora</label>
                        <select class="form-control" name="txtEditora">
                            <c:forEach items="${_editora}" var="e">
                                <option value="${e.id}" <c:if test="${e.id == obj.editora.id}">selected</c:if>>${e.nome}</option>
                            </c:forEach>
                        </select>
                    </div>
                </div>
                <div class="col-md-5 pr-md-1">
                    <div class="form-group">
                        <label>G�nero</label>
                        <select class="form-control" name="txtGenero">
                            <c:forEach items="${_genero}" var="g">
                                <option value="${g.id}" <c:if test="${g.id == obj.genero.id}">selected</c:if>>${g.genero}</option>
                            </c:forEach>
                        </select>
                    </div>
                </div>
                <div class="col-md-5 pr-md-1">
                    <div class="form-group">
                        <label>Classifica��o</label>
                        <select class="form-control" name="txtClassificacao">
                            <c:forEach items="${_classificacao}" var="c">
                                <option value="${c.id}" <c:if test="${c.id == obj.classificacao.id}">selected</c:if>>${c.classificacao}</option>
                            </c:forEach>
                        </select>
                    </div>
                </div>
                <div class="col-md-7">
                    <div class="form-group-file">
                        <label for="file">Foto</label>
                        <input type="file" id="file" name="txtCapa" required class="form-control form-control-file" value="./../../arquivos/${obj.capa}">
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-md-5 pr-md-1">
                    <div class="form-group">
                        <label>Descri��o</label>
                        <textarea name="txtDescricao" required class="form-control" placeholder="Descri��o...">${obj.descricao}</textarea>
                    </div>
                </div>
            </div>
            <button class="btn btn-primary btn-round text-center" type="submit">
                <i class="tim-icons icon-cloud-upload-94"></i> Salvar
            </button>
            <a class="btn btn-primary btn-round text-center" href="LivroWS?acao=list">
                <i class="tim-icons icon-bullet-list-67"></i> Listar
            </a>
        </form>
    </div>
    <div class="card-footer">
        <c:if test = "${not empty msg}">
            <div class="alert alert-primary alert-dismissible fade show" role="alert">
                ${msg}
                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                    <i class="tim-icons icon-simple-remove"></i>
                </button>
            </div>
        </c:if>
    </div>
</div>
</div>
<%@include file="../rodape.jsp" %>