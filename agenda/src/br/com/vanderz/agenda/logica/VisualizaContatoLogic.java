package br.com.vanderz.agenda.logica;

import java.sql.Connection;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.vanderz.agenda.entities.Contato;
import br.com.vanderz.agenda.persistencia.ContatoDAO;
import br.com.vanderz.mvc.logica.Logica;

public class VisualizaContatoLogic implements Logica {
	public String executa(HttpServletRequest req, HttpServletResponse res)
			throws Exception {
			Connection connection = (Connection) req.getAttribute("conexao");
			long id = Long.parseLong(req.getParameter("id"));
			Contato contato = new ContatoDAO(connection).getListaById(id);
			req.setAttribute("contato", contato);
			return "visualiza-contato.jsp";
	}

}
