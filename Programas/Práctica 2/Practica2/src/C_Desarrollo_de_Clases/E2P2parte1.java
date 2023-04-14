package C_Desarrollo_de_Clases;

import PaqueteLectura.Lector;

public class E2P2parte1 {

    public static void main(String[] args) {
        Balanza b = new Balanza();
        double precio, peso = -1;
        
        while (peso != 0){
            System.out.print("Precio del producto: ");
            precio = Lector.leerDouble();
            System.out.print("Peso del producto: ");
            peso = Lector.leerDouble();
            if (peso != 0){
                b.registrarProducto(peso, precio);
            }
        }
        System.out.println();
        System.out.println(b.toString());
    }
    
}
