package A_Matrices;

import PaqueteLectura.GeneradorAleatorio;

public class E3P1parte1 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        
        GeneradorAleatorio.iniciar(); // sin esta línea, se generarán siempre los mismos valores
        int dimF = 15;
        double[] jugadores = new double[dimF];
        double promedio = 0;
        
        for (int i = 0; i < dimF; i++) {
            jugadores[i] = GeneradorAleatorio.generarDouble(3);
            promedio += jugadores[i];
        }
        promedio /= dimF;
        
        System.out.println("La altura promedio es: "+promedio+" metros");
        
        int cant = 0;
        for (int i = 0; i < dimF; i++) {  
            if (jugadores[i] > promedio)
                cant++;
        }
        System.out.println("Cantidad de jugadores por encima del promedio: "+cant);
    }
    
}