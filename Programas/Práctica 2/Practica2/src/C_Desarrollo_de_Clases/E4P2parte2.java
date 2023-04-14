package C_Desarrollo_de_Clases;

import PaqueteLectura.Lector;

public class E4P2parte2 {

    public static void main(String[] args) {
        System.out.print("Ingrese la cantidad de asientos del micro: ");
        int i = 3, asientos = Lector.leerInt();
        Micro m = new Micro("ABC123","Mar del Plata",5,asientos);
        
        while ((i != -1) && (!m.getMicroLleno())){
            System.out.print("Ingrese qué número de asiento quisiera comprar: ");
            i = Lector.leerInt();
            if (m.getEstadoAsiento(i)){
                m.setAsiento(i);
                System.out.println("¡Felicidades! Se reservó su asiento");
            }
            else{
                System.out.println("Lo sentimos, este asiento no está disponible."
                        + " El primer asiento disponible que tenemos para ofrecerle es el nro "+m.getPrimerAsientoLibre());
            }
        }
        
        System.out.println();
        System.out.println(m.toString());
    }
    
}
