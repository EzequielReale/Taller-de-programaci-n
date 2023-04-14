package Vivero;

/**
 *
 * @author Ezequiel
 */
public abstract class Planta {
    private String nombreCientifico;
    private double precio;
    private Clima[] climas;
    private int dimL, dimF;
    
    public Planta(String nombreCientifico, double precio){
        this.nombreCientifico = nombreCientifico;
        this.precio = precio;
        this.dimL = 0;
        this. dimF = 6;
        this.climas = new Clima[dimF];
        for (int i = 0; i < dimF; i++) {
            climas[i] = null;
        }
    }
    
    public void agregarClima(Clima clima){
        if (dimL < dimF){
            this.climas[dimL] = clima;
            dimL++;  
        }     
    }

    public String getNombreCientifico() {
        return nombreCientifico;
    }

    public void setNombreCientifico(String nombreCientifico) {
        this.nombreCientifico = nombreCientifico;
    }

    public double getPrecio() {
        return precio;
    }

    public void setPrecio(double precio) {
        this.precio = precio;
    }
    
    @Override
    public String toString(){
        String aux = "Nombre científico: "+nombreCientifico+" - climas en los que sobrevive: ";
        for (int i = 0; i < dimL; i++) {
            aux += climas[i].getNombre()+" / ";
        }
        return aux;
    }
}
