package C_Desarrollo_de_Clases;

import PaqueteLectura.Lector;

public class E3P2parte1 {
    
    public static void main(String[] args) {
        Entrenador dt = new Entrenador();
        
        System.out.print("Nombre del técnico: ");
        dt.setNombre(Lector.leerString());
        System.out.print("Sueldo del técnico: ");
        dt.setSueldo(Lector.leerDouble());
        System.out.print("Cantidad de títulos del técnico: ");
        dt.setTitulos(Lector.leerInt());
        
        System.out.println(dt.toString());
    }
    
}
