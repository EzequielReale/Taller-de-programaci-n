package D_Herencia.Ejer6;

public class MainVisorFiguras {

    public static void main(String[] args) {
        VisorFiguras visor = new VisorFiguras();
        visor.guardar(new Cuadrado(10,"Violeta","Rosa")); 
        visor.guardar(new Rectangulo(20,10,"Azul","Celeste"));
        visor.guardar(new Cuadrado(30,"Rojo","Naranja"));
        
        for (int i = 0; i < visor.getDimL(); i++) {
            visor.mostrar(i);
        }
        System.out.println("Mostradas: "+visor.getMostradas());
    }
}