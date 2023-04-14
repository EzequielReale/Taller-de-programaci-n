package Ejercicio1;

import java.util.Arrays;

public class E1P2adicional {

    public static void main(String[] args) {
        Proyecto p = new Proyecto("Manhattan", "Pablo Agunsdei", 110110);
        for (int i = 0; i < 2; i++) {
            Investigador unInvestigador = new Investigador("Laura DiGiusti", 4, "uwu");
            p.agregarInvestigador(unInvestigador);
        }
        System.out.println(p.toString());
        for (int i = 0; i < p.getCantInvestigadores(); i++) {
            System.out.println(Arrays.toString(p.getInvestigadores()));
        }
    }   
}
