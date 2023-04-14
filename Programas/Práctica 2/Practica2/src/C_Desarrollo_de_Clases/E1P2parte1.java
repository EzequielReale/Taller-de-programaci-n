package C_Desarrollo_de_Clases;

import PaqueteLectura.Lector;

public class E1P2parte1 {
    public static void main(String[] args) {
        double lado1, lado2, lado3;
        String colorRelleno, colorLinea;
        
        System.out.print("Ingrese el lado 1: ");
        lado1 = Lector.leerDouble();
        System.out.print("Ingrese el lado 2: ");
        lado2 = Lector.leerDouble();
        System.out.print("Ingrese el lado 3: ");
        lado3 = Lector.leerDouble();
        System.out.print("Ingrese el color de relleno: ");
        colorRelleno = Lector.leerString();
        System.out.print("Ingrese el color de línea: ");
        colorLinea = Lector.leerString();
        
        Triangulo t = new Triangulo(lado1, lado2, lado3,colorRelleno, colorLinea);
        
        System.out.println();
        System.out.println(t.toString());
        
        t = new Triangulo();
        
        System.out.println();
        System.out.println(t.toString());
    }
    
}
