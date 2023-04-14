package D_Herencia.Ejer6;

public class VisorFiguras {
    private int mostradas, dimL = 0;
    private Figura[] vector = new Figura[DIMF];

    static final int DIMF = 5;  
    
    public VisorFiguras(){
        mostradas=0;
    }
    
    private boolean quedaEspacio(){
        return !(dimL == DIMF);
    }
    
    public void guardar(Figura f){
        if (this.quedaEspacio()){
            vector[dimL] = f;
            dimL++;
        }
    }

    public void mostrar(int i){
        System.out.println(vector[i].toString());
        mostradas++;
    }

    public int getDimL() {
        return dimL;
    }

    public static int getDIMF() {
        return DIMF;
    }

    public int getMostradas() {
        return mostradas;
    }
}