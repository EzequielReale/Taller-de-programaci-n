package Vivero;

import PaqueteLectura.Lector;

/**
 *
 * @author Ezequiel
 */
public class Vivero {

    public static void main(String[] args) {
        int dimF = 3;
        Clima[] climas = new Clima[dimF];
        for (int i = 0; i < dimF; i++) {
            System.out.print("Nombre del clima: ");
            String nombreClima = Lector.leerString();
            System.out.print("Temperatura del clima: ");
            int temp = Lector.leerInt();
            System.out.print("Precipitaciones al año del clima: ");
            int prec = Lector.leerInt();
            climas[i] = new Clima(nombreClima,temp,prec);
        }
        
        System.out.print("Nombre científico de la planta: ");
        String nombreCientifico = Lector.leerString();
        System.out.print("Precio de la planta: ");
        double precio = Lector.leerDouble();
        System.out.print("Nombre de la familia de la planta: ");
        String nombreFamilia = Lector.leerString();
        System.out.print("Hábitat de la planta: ");
        String habitat = Lector.leerString();
        Suculenta s = new Suculenta(nombreCientifico,precio,nombreFamilia,habitat);
        for (int i = 0; i < dimF-1; i++) {
            s.agregarClima(climas[i]);
        }
        
        System.out.print("Nombre científico de la planta: ");
        nombreCientifico = Lector.leerString();
        System.out.print("Precio de la planta: ");
        precio = Lector.leerDouble();
        System.out.print("Agua donde vive de la planta [dulce o salada]: ");
        String agua = Lector.leerString();
        Acuatica a = new Acuatica(nombreCientifico,precio,agua);
        for (int i = 1; i < dimF; i++) {
            a.agregarClima(climas[i]);
        }
        
        System.out.println();
        System.out.println(s.toString());
        System.out.println(a.toString());
    }
    
}
