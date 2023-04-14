package C_Desarrollo_de_Clases;

public class E4P2parte1 {
    
    public static void main(String[] args) {
        Circulo c = new Circulo(4,"amarillo","azul");
        System.out.println(c.toString());
        c = new Circulo();
        System.out.println(c.toString());
    }
    
}
