package br.com.redesocial.modelo.bo;

import br.com.redesocial.modelo.dto.Artigo;
import java.util.List;
import org.junit.Test;
import java.util.Calendar;
import static org.junit.Assert.*;

/**
 * Unidade de testes para o ArtigoBO
 * @author Andrey Silva Ribeiro
 * @since 15/09/2017
 */
public class ArtigoBOTest {
    @Test
    public void testMetodoInserir() {
        ArtigoBO bo = new ArtigoBO();

        Artigo artigo1 = new Artigo();
        artigo1.setIdioma("Portugues");       
        artigo1.setRevista("Playboy");
        artigo1.setISSN("33333333");
        artigo1.setAutor("Ciencias da terra"); 
        Calendar calendario = Calendar.getInstance();
        calendario.set(1988, 2, 7, 0, 0, 0);            
        artigo1.setData(calendario.getTime());
        artigo1.setAreaConhecimento("Ciencias da terra");
        artigo1.setTitulo("Título teste 1");
        artigo1.setResumo("Em design gráfico e editoração, Lorem ipsum é um texto utilizado para preencher o espaço de texto em publicações (jornais, revistas, e websites), com a finalidade de verificar o lay-out, tipografia e formatação antes de utilizar conteúdo real. Muitas vezes este texto também é utilizado em catálogos de tipografia para demonstrar textos e títulos escritos com as fontes.");
        artigo1.setURL("www.artigo.com.br");
        
        
        try {
            bo.inserir(artigo1);
        } catch (Exception ex) {
            fail("Falha ao inserir um país: " + ex.getMessage());
        }

    }
}