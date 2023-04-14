package B_Introducción_a_POO;

import PaqueteLectura.Lector;

public class E2P1parte2 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {

        int dimF = 3;
        
        persona[] v = new persona[dimF];
        
        for (int i = 0; i < dimF; i++) {
            persona p = new persona();
            
            System.out.print("Introduzca el nombre de la persona: ");
            p.setNombre(Lector.leerString());
            System.out.print("Introduzca el DNI de la persona: ");
            p.setDNI(Lector.leerInt());
            System.out.print("Introduzca la edad de la persona: ");
            p.setEdad(Lector.leerInt());
            
            v[i]= p;
        }

        int mayores = 0;
        persona pMin = new persona("",1000000000,-1);
        
        for (int i = 0; i < dimF; i++) {
            if (v[i].getEdad() > 65){
                mayores++;
            }
            if (v[i].getDNI() < pMin.getDNI()) {
                pMin = v[i];
            }   
        }
        System.out.println();
        System.out.println("Cantidad de personas mayores de 65 años: "+mayores);
        System.out.println("Persona con el menor DNI: "+pMin.toString());    
    }
    
}
