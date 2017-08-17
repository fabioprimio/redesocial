package br.com.redesocial.modelo.bo;

import br.com.redesocial.modelo.dto.Estado;
import org.junit.Test;
import static org.junit.Assert.*;
/**
 *
 * @author Inimigo
 */
public class EstadosBoTest {
    @Test
    public void testMetodoInserir() {
        EstadoBO bo = new EstadoBO();

        Estado estado1 = new Estado();
        estado1.setNome("Goias");

        try {
            bo.inserir(estado1);
        } catch (Exception ex) {
            fail("Falha ao inserir um estado: " + ex.getMessage());
        }

        Estado estado2 = new Estado();
        estado2.setNome("Paraiba");

        try {
            bo.inserir(estado2);
        } catch (Exception ex) {
            fail("Falha ao inserir um estado: " + ex.getMessage());
        }
    }
    
}