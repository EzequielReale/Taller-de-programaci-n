package Ejercicio1;

public class Investigador {
    private String nombreApellido, especialidad;
    private int categoria, cantSubsidios = 0;
    private Subsidio [] subsidio;
    
    public Investigador(String nombreApellido, int categoria, String especialidad){
        this.nombreApellido = nombreApellido;
        this.categoria = categoria;
        this.especialidad = especialidad;
        this.subsidio = new Subsidio [5];
        for (int i = 0; i < 5; i++) {
            this.subsidio[i] = null;
        }
    }

    public String getNombreApellido() {
        return nombreApellido;
    }

    public int getCategoria() {
        return categoria;
    }

    public int getCantSubsidios() {
        return cantSubsidios;
    }
    
    public double getMontoTotal(){
        double total = 0;
        for (int i = 0; i < this.cantSubsidios; i++) {
            if (this.subsidio[i].isOtorgado()){
                total += this.subsidio[i].getMonto();
            }
        }
        return total;
    }
    
    public void agregarSubsidio(Subsidio unSubsidio){
        this.subsidio[this.cantSubsidios] = unSubsidio;
        this.cantSubsidios++;
    }
    
    public void otorgarSubsidio(int i){
        this.subsidio[i].setOtorgado(true);
    }
    
    
    
    public String toString(){
        return this.nombreApellido+" (categoría "+this.categoria+") con una contribución de subsidios del Estado de $"+this.getMontoTotal()+"; ";
    }
}
