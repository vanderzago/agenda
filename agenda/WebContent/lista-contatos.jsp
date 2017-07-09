<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Agenda</title>
</head>
<body>
<c:import url="cabecalho.jsp" />
<form action="mvc?logica=NovoContatoLogic" method="POST">
<table border="1">
<tr bgcolor="00000">
<td><font color="white">Nome</font></td>
<td><font color="white">E-mail</font></td>
<td><font color="white">Endere�o</font></td>
<td><font color="white">Data Nascimento</font></td>
<td><font color="white">&nbsp;</font></td>
<td><font color="white">&nbsp;</font></td>
</tr>
<!-- percorre contatos montando as linhas da tabela -->
<c:forEach var="contato" items="${contatos}" varStatus="id">
<tr bgcolor="#${id.count % 2 == 0 ? 'aaee88' : 'ffffff' }">
<td>${contato.nome}</td>
<td>
 <c:if test="${not empty contato.email}">
  <a href="mailto:${contato.email}">${contato.email}</a>
 </c:if>
 <c:if test="${empty contato.email}">
  E-mail n�o informado
 </c:if>
</td>
<td>${contato.endereco}</td>
<td>
<fmt:formatDate value="${contato.dataNascimento.time}"
pattern="dd/MM/yyyy" />
</td>
<td>
 <a href="mvc?logica=RemoveContatoLogic&id=${contato.id}">Remover</a>
</td>
<td>
 <a href="mvc?logica=VisualizaContatoLogic&id=${contato.id}">Alterar</a>
</td>
</tr>
</c:forEach>
</table>
<input type="submit" value="Novo Contato" />
</form>
<c:import url="rodape.jsp" />
</body>
</html>