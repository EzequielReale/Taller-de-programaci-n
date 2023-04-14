package A_Matrices;

import PaqueteLectura.GeneradorAleatorio;
import PaqueteLectura.Lector;

public class E4P1parte1 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        
        GeneradorAleatorio.iniciar(); // sin esta línea, se generarán siempre los mismos valores
        int filas=10, columnas=10;
        int[][] numeritos = new int[filas][columnas];

        //Lleno la matriz
        for (int i = 0; i < filas; i++) {
            for (int j = 0; j < columnas; j++) {
                numeritos[i][j] = GeneradorAleatorio.generarInt(200);   
            }          
        }
        
        //Imprimo la matriz
        System.out.print("Matriz: ");
        for (int i = 0; i < filas; i++) {
            for (int j = 0; j < columnas; j++) {
                System.out.print(numeritos[i][j]+" - ");
            }
        }
        System.out.println("");
        
        //Hago la suma de las filas y columnas específica
        int result = 0;
        for (int i = 0; i < filas; i++) {
            for (int j = 0; j < columnas; j++) {
                if (((i >= 2) && (i <= 9)) && ((j >= 0) && (j <= 3)))
                    result+= numeritos[i][j];
            }
        }
        System.out.println("Resultado de la suma: "+result);
        
        //Hago el vector a base de columnas
        int[] numeritosVector = new int[filas];
        int sumaColumnas = 0;
        for (int i = 0; i < filas; i++) {
            for (int j = 0; j < columnas; j++) {
                sumaColumnas+= numeritos[i][j];
            }
            numeritosVector[i] = sumaColumnas; 
        }
        //Imprimo el vector
        System.out.print("Vector: ");
        for (int i = 0; i < filas; i++) {
            System.out.print(numeritosVector[i]+" - ");
        }
        System.out.println("");
        
        //Busco el dato en la matriz
        System.out.print("Ingrese un valor a  buscar en la matriz: ");
        int buscado = Lector.leerInt();
        boolean encontre = false;
        for (int i = 0; i < filas; i++) {
            for (int j = 0; j < columnas; j++) {
                if (numeritos[i][j] == buscado){
                    System.out.println("El numero "+buscado+" se encuentra en la fila "+i+" columna "+j);
                    encontre = true;
                }
            }
        }
        if (encontre == false)
            System.out.println("El numero "+buscado+" no se encontraba en la matriz");
    }
}
