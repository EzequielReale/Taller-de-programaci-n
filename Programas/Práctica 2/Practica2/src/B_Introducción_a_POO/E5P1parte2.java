package B_Introducción_a_POO;

import PaqueteLectura.Lector;


public class E5P1parte2 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        int dimF = 10;
        String[] v = new String[dimF];
        
        for (int i = 0; i < dimF; i++) {
            System.out.print("Ingrese una palabra: ");
            v[i]= Lector.leerString();
        }
        
        System.out.println();
        
        for (int i = 0; i < dimF; i++) {
            System.out.print(v[i].charAt(0));
        }
        System.out.println();
    }
    
}
