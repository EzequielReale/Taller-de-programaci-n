package Ejercicio2;

import PaqueteLectura.Lector;

public class E2P2adicional {

    public static void main(String[] args) {
        Ocasional o;
        System.out.print("Ingrese dia: ");
        int dia = Lector.leerInt();
        
        System.out.print("Ingrese la persona que contrata: ");
        String persona = Lector.leerString();
        
        System.out.print("Ingrese el motivo: ");
        String motivo = Lector.leerString();
        
        System.out.print("Ingrese el nombre de la banda: ");
        String nombreBanda = Lector.leerString();
        o = new Ocasional(nombreBanda, 10, motivo, persona, dia);
        
        int i = 0;
        System.out.print("Ingrese el nombre de un tema: ");
        String tema = Lector.leerString();
        while (!"zzz".equals(tema) && (i < 10)){
            o.agregarTema(tema);
            i++;
            System.out.print("Ingrese el nombre de un tema: ");
            tema = Lector.leerString();
        }
        
        System.out.println("Coste: "+o.calcularCosto());
        o.actuar();
    }  
}
