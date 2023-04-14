package C_Desarrollo_de_Clases;

import PaqueteLectura.Lector;

public class E5P2parte2 {

    public static void main(String[] args) {
        String patente, destino;
        int horaSa, asientos;
        System.out.println("-----Nueva Flota-----");
        Flota flota = new Flota();
        System.out.print("Ingrese la patente del Micro: ");
        patente = Lector.leerString();
        
        while (!patente.equals("ZZZ000") && !flota.getFlotaLlena()) {
            System.out.print("Ingrese el destino del Micro: ");
            destino = Lector.leerString();
            System.out.print("Ingrese el horario de salida del Micro: ");
            horaSa = Lector.leerInt();
            System.out.print("Ingrese los asientos que tiene el Micro: ");
            asientos = Lector.leerInt();
            flota.setMicro(new Micro(patente, destino, horaSa, asientos));
            System.out.print("Ingrese la patente del Micro: ");
            patente = Lector.leerString();
        }
        System.out.println();
        System.out.print("Ingrese patente del Micro a eliminar: ");
        patente = Lector.leerString();
        System.out.println(flota.eliminarMicro(patente));
        Micro m = flota.getMicroPorPatente(patente);
        System.out.println("Valor de la posición donde se encontraba el micro eliminado: "+m);
        
        System.out.println();
        System.out.print("Ingrese el destino del Micro a buscar: ");
        destino = Lector.leerString();
        System.out.println("La patente de dicho micro es: "+flota.getMicroPorDestino(destino));
    }
}

