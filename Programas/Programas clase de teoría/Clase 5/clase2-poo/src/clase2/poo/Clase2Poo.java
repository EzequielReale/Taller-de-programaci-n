package clase2.poo;

import PaqueteLectura.Lector;

public class Clase2Poo {

    public static void main(String[] args) {
        Estacionamiento e = new Estacionamiento("ABC","12 e/ 45 y 46","6:00","22:00",3,3);
        
        for (int i = 0; i<6; i++){
           System.out.println("Ingrese patente, dueño, piso (1..3) y plaza (1..3) ");
           int patente = Lector.leerInt();
           String dueño = Lector.leerString();
           int piso = Lector.leerInt();
           int plaza=Lector.leerInt();
           
           Auto a = new Auto(dueño, patente);
           e.registrar(a, piso,plaza);
               
        }
        
        System.out.println(e.toString());
        
         System.out.println("Ingrese patente a buscar");
        int patente = Lector.leerInt();
        System.out.println( e.buscarAutoPorPatente(patente) );
        
        
        
        
    }
    
}
