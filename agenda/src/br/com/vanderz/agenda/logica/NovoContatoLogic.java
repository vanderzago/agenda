package br.com.vanderz.agenda.logica;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.vanderz.mvc.logica.Logica;

public class NovoContatoLogic implements Logica {
	public String executa(HttpServletRequest req, HttpServletResponse res)
			throws Exception {
			return "visualiza-contato.jsp";
	}

}
