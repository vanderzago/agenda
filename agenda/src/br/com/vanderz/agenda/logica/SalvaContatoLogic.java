package br.com.vanderz.agenda.logica;

import java.io.PrintWriter;
import java.sql.Connection;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.vanderz.agenda.entities.Contato;
import br.com.vanderz.agenda.persistencia.ContatoDAO;
import br.com.vanderz.mvc.logica.Logica;

public class SalvaContatoLogic implements Logica {
	public String executa(HttpServletRequest req, HttpServletResponse res)
			throws Exception {
			Connection connection = (Connection) req.getAttribute("conexao");
			PrintWriter out = res.getWriter();
			Contato contato = new Contato();
			if(req.getParameter("id") != "") {
				long id = Long.parseLong(req.getParameter("id"));
				contato.setId(id);
			}
			String nome = req.getParameter("nome");
			String email = req.getParameter("email");
			String endereco = req.getParameter("endereco");
			String dataEmTexto = req.getParameter("dataNascimento");
			Calendar dataNascimento = null;
			// fazendo a conversão da data
			try {
				Date date = new SimpleDateFormat("dd/MM/yyyy").parse(dataEmTexto);
				dataNascimento = Calendar.getInstance();
				dataNascimento.setTime(date);
			} catch (ParseException e) {
				out.println("Erro de conversão da data");
			}
			contato.setNome(nome);
			contato.setEndereco(endereco);
			contato.setEmail(email);
			contato.setDataNascimento(dataNascimento);
			ContatoDAO dao = new ContatoDAO(connection);
			if(contato.getId() == null) {
		 	    dao.adiciona(contato);
			}
			else
			{
				dao.altera(contato);
			}
			System.out.println("Salvando contato... ");
			return "mvc?logica=ListaContatosLogic";
		}
}
