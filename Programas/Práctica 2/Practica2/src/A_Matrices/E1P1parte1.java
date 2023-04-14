package A_Matrices;

import PaqueteLectura.Lector; // para leer por teclado


public class E1P1parte1 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
        
        int num, numTot = 1;
        
        System.out.print("Ingrese un número: ");
        num = Lector.leerInt();
        
        for (int i = 1; i <= num; i++){  
            numTot *= i; 
        }
        System.out.println("Factorial: " +numTot);   
    }
    
}