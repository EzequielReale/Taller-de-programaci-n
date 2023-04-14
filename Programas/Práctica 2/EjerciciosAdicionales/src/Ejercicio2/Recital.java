package Ejercicio2;

public abstract class Recital {
    private String nombreBanda;
    private String[] temas;
    private int cantMaxTemas;
    private int cantTemas;
    
    public Recital(String nombreBanda, int cantMaxTemas){
        this.nombreBanda = nombreBanda;
        this.cantMaxTemas = cantMaxTemas;
        this.temas = new String[this.cantMaxTemas];
        this.cantTemas = 0;
    }
    
    public void agregarTema(String tema){
        this.temas[this.cantTemas] = tema;
        this.cantTemas++;
    }
    
    public void actuar(){
        for (int i = 0; i < this.cantTemas; i++) {
            System.out.println("Y ahora tocaremos "+this.temas[i]);
        }       
    }
    
    public abstract boolean finalizado();
    public abstract  double calcularCosto();
}
