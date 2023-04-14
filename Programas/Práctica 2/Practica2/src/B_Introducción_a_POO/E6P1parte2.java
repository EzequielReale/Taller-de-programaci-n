package B_Introducción_a_POO;

import PaqueteLectura.Lector;


public class E6P1parte2 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        
        int dimF = 5, i = 0;
        Partido p = new Partido();       
        Partido[] v = new Partido[dimF];
        
        
        //Lleno la matriz
        while ((!"ZZZ".equals(p.getVisitante())) && (i < dimF-1)){
            p = new Partido();
            System.out.print("Introduzca el equipo visitante: ");
            p.setVisitante(Lector.leerString());
            if (!"ZZZ".equals(p.getVisitante())){     
                System.out.print("Introduzca el equipo Local: ");
                p.setLocal(Lector.leerString());
                System.out.print("Introduzca los goles del equipo visitante: ");
                p.setGolesVisitante(Lector.leerInt());
                System.out.print("Introduzca los goles del local: ");
                p.setGolesLocal(Lector.leerInt());
                v[i] = p;
                i++;
            }
        }
        int cantRiver = 0, cantBoca = 0, cantEmpates = 0;
        for (int j = 0; j < dimF; j++) {
            if (v[j] != null){
                if ("River".equals(v[j].getGanador())){
                    cantRiver++;
                }
                if ("Boca".equals(v[j].getLocal())){
                    cantBoca++;
                }
                if (v[j].hayEmpate()){
                    cantEmpates++;
                }
            }
        }
        System.out.println();
        System.out.println("Partidos que ganó RiBer: "+cantRiver);
        System.out.println("Partidos que Bokita el más grande jugó de local: "+cantBoca);
        System.out.println("Partidos que se empataron (es decir, que dirigió Milito): "+cantEmpates);
        System.out.println("Goles que se comió Gimnasia contra Estudiantes: 7");
    }
}



    
