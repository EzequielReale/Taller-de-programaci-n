package D_Herencia.Ejer1;

public class E1P3 {

    public static void main(String[] args) {
        Figura[] f = new Figura[3];
        
        f[0] = new Triangulo(5,8,5,"Amarillo","Azul");
        f[1] = new Circulo(7,"Rojo","Blanco");
        f[2] = new Cuadrado(6,"Negro","Naranja");
        
        for (int i = 0; i < 3; i++) {
            System.out.println(f[i].getClass()+ " : " + f[i].toString());
            System.out.println();
        }
    }
    
}
