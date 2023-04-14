package SorteosParcial2020;

import PaqueteLectura.GeneradorAleatorio;

public class Parcial {

    public static void main(String[] args) {
        Comun sorteoComun = new Comun (50000);
        Avanzado sorteoAvanzado = new Avanzado(50000);
        GeneradorAleatorio.iniciar();
        
        for (int i = 0; i < sorteoComun.getDimF(); i++) {
            String nombre = GeneradorAleatorio.generarString(8);
            int dni = GeneradorAleatorio.generarInt(50000000);
            double colaboracion = GeneradorAleatorio.generarDouble(20000);
            Persona p = new Persona(nombre, dni, colaboracion);
            sorteoComun.agregarPersona(p); 
        }
        for (int i = 0; i < sorteoAvanzado.getDimF(); i++) {
            String nombre = GeneradorAleatorio.generarString(8);
            int dni = GeneradorAleatorio.generarInt(50000000);
            double colaboracion = GeneradorAleatorio.generarDouble(20000);
            Persona p = new Persona(nombre, dni, colaboracion);
            sorteoAvanzado.agregarPersona(p); 
        }
        System.out.println(sorteoComun.comproBonoB(10).toString());
        System.out.println(sorteoAvanzado.elGanador().toString()+" ganó $"+sorteoAvanzado.getPremio());
        System.out.println(sorteoComun.elGanador().toString()+" ganó $"+sorteoComun.getPremio());
    }
}
