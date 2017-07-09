package br.com.vanderz.agenda.logica;

import java.sql.Connection;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.vanderz.agenda.entities.Contato;
import br.com.vanderz.agenda.persistencia.ContatoDAO;
import br.com.vanderz.mvc.logica.Logica;

public class ListaContatosLogic implements Logica {
	public String executa(HttpServletRequest req, HttpServletResponse res)
			throws Exception {
			Connection connection = (Connection) req.getAttribute("conexao");
			List<Contato> contatos = new ContatoDAO(connection).getLista();
			req.setAttribute("contatos", contatos);
			return "lista-contatos.jsp";
	}

}
