package C_Desarrollo_de_Clases;

import PaqueteLectura.Lector;

public class E5P2parte1 {

    public static void main(String[] args) {
        
        BalanzaPro b = new BalanzaPro();
        double precio, peso = -1;
        String descripcion;
        
        while (peso != 0){
            
            System.out.print("Peso del producto: ");
            peso = Lector.leerDouble();
            if (peso != 0){
                System.out.print("Descripción del producto: ");
                descripcion = Lector.leerString();
                System.out.print("Precio del producto: ");
                precio = Lector.leerDouble(); 
                Producto p = new Producto(peso, descripcion);
                b.registrarProductoPro(precio, p);
                System.out.println();
            }
        }
        System.out.println(b.toStringPro());
    }
    
}
