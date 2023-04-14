package D_Herencia.Ejer3;

import PaqueteLectura.Lector;

public class E3P3 {

    public static void main(String[] args) {
        String nombre, trabajo;
        int DNI, edad;
        
        System.out.println("-------Persona-------");
        System.out.print("Nombre: "); nombre = Lector.leerString();
        System.out.print("DNI: "); DNI = Lector.leerInt();
        System.out.print("Edad: "); edad = Lector.leerInt();
        Persona p = new Persona(nombre, DNI, edad);
        System.out.println(p.toString());
        System.out.println();
        
        System.out.println("-------Trabajador-------");
        System.out.print("Nombre: "); nombre = Lector.leerString();
        System.out.print("DNI: "); DNI = Lector.leerInt();
        System.out.print("Edad: "); edad = Lector.leerInt();
        System.out.print("Trabajo: "); trabajo = Lector.leerString();
        Trabajador t = new Trabajador(nombre, DNI, edad, trabajo);
        System.out.println(t.toString());
    }
    
}
