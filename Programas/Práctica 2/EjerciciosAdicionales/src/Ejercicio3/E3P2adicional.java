package Ejercicio3;

import PaqueteLectura.GeneradorAleatorio;
import PaqueteLectura.Lector;

public class E3P2adicional {

    public static void main(String[] args) {
        Coro[] coros = new Coro[4];
        
        for (int i = 0; i < 4; i++) {
            String nombreDirector = GeneradorAleatorio.generarString(8);
            int edadDirector = GeneradorAleatorio.generarInt(65);
            int antiguedadDirector = GeneradorAleatorio.generarInt(40);
            int dniDirector = GeneradorAleatorio.generarInt(30000000);
            Director d = new Director(nombreDirector, dniDirector, edadDirector, antiguedadDirector);
            System.out.print("Ingrese el tipo de coro: ");
            String tipo = Lector.leerString();
            String nombreCoro = GeneradorAleatorio.generarString(10);
            
            if (tipo.equals("semicircular")){
                int dimF = GeneradorAleatorio.generarInt(20);
                coros[i] = new Semicircular(nombreCoro, d, dimF);
                for (int j = 0; j < dimF; j++) {
                    String nombreCorista = GeneradorAleatorio.generarString(8);
                    int dniCorista = GeneradorAleatorio.generarInt(50000000);
                    int edadCorista = GeneradorAleatorio.generarInt(30);
                    int tonoF = GeneradorAleatorio.generarInt(50);
                    Corista c = new Corista(nombreCorista, dniCorista, edadCorista, tonoF);
                    coros[i].agregarCorista(c);
                }
            }
            else{
                int dimFC = GeneradorAleatorio.generarInt(10);
                int dimFH = GeneradorAleatorio.generarInt(10);
                coros[i] = new Hilera(nombreCoro, d, dimFH, dimFC);
                for (int j = 0; j < dimFC*dimFH; j++) {
                    String nombreCorista = GeneradorAleatorio.generarString(8);
                    int dniCorista = GeneradorAleatorio.generarInt(50000000);
                    int edadCorista = GeneradorAleatorio.generarInt(30);
                    int tonoF = GeneradorAleatorio.generarInt(50);
                    Corista c = new Corista(nombreCorista, dniCorista, edadCorista, tonoF);
                    coros[i].agregarCorista(c);   
                }
            }
            System.out.println(coros[i].toString());
            System.out.println(coros[i].estaLleno());
            System.out.println(coros[i].estaBienFormado()); 
        }
    }
}