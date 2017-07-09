<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="caelum" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
 <head>
  <link href="jquery/jquery-ui.css" rel="stylesheet">
  <script src="jquery/external/jquery/jquery.js"></script>
  <script src="jquery/jquery-ui.js"></script>
 </head>
 <body>
  <c:import url="cabecalho.jsp" />
   <form action="mvc?logica=SalvaContatoLogic" method="POST">
    <table border="1">
     <tr bgcolor="ffffff">
      <td><font color="000000">Nome</font></td>
      <td>
        <input type="text" name="nome" value="${contato.nome}"/><br />
      </td>
     </tr>
     <tr bgcolor="ffffff">
      <td><font color="000000">E-mail</font></td>
      <td>
        <input type="text" name="email" value="${contato.email}"/><br />
     </td>
    </tr>
    <tr bgcolor="ffffff">
	 <td><font color="000000">Endereço</font></td>
	 <td>
       <input type="text" name="endereco" value="${contato.endereco}"/><br />
	 </td>
	</tr>
    <tr bgcolor="ffffff">
	 <td><font color="000000">Data Nascimento</font></td>
	 <td>   
	   <caelum:campoData id="dataNascimento" value="<fmt:formatDate value=\"${contato.dataNascimento.time}\" pattern=\"dd/MM/yyyy\" />"/><br />
	 </td>
	</tr>
   </table>
     <input type="hidden" name="id" value="${contato.id}"/>
     <input type="submit" value="Gravar" />
   </form>
  <c:import url="rodape.jsp" />
 </body>
</html>