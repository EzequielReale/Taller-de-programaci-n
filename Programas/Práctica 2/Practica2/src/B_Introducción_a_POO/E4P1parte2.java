package B_Introducción_a_POO;

import PaqueteLectura.Lector;


public class E4P1parte2 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        int dia=0, turno, cont = 0;
        persona p = new persona();        
        persona[][] v = new persona[5][8];
        
        //Lleno la matriz
        while ((!"ZZZ".equals(p.getNombre())) && (dia <= 4)){
            p = new persona();
            System.out.print("Introduzca el nombre de la persona: ");
            p.setNombre(Lector.leerString());
            if (!"ZZZ".equals(p.getNombre())){     
                System.out.print("Introduzca el DNI de la persona: ");
                p.setDNI(Lector.leerInt());
                System.out.print("Introduzca la edad de la persona: ");
                p.setEdad(Lector.leerInt());
                System.out.println("Asignele a la persona el número de turno [1..8]");
                turno = Lector.leerInt();
                v[dia][turno-1] = p;
                cont++;
                if (cont >= 8){
                    dia++;
                    cont = 0;
                }
            }
        }
        //Imprimo los entrevistados
        System.out.println("");
        for (int i = 0; i <= dia; i++) {
            for (int j = 0; j < 8; j++) {
                if (v[i][j] != null)
                    System.out.println(v[i][j].toString());
            }
        }
    }
    
}
