package Vivero;

/**
 *
 * @author Ezequiel
 */
public class Suculenta extends Planta{
    private String nombreFamilia, habitat;
    
    public Suculenta(String nombreCientifico, double precio, String nombreFamilia, String habitat){
        super(nombreCientifico,precio);
        this.nombreFamilia = nombreFamilia;
        this.habitat = habitat;
    }

    public String getNombreFamilia() {
        return nombreFamilia;
    }

    public void setNombreFamilia(String nombreFamilia) {
        this.nombreFamilia = nombreFamilia;
    }

    public String getHabitat() {
        return habitat;
    }

    public void setHabitat(String habitat) {
        this.habitat = habitat;
    }
    
    @Override
    public String toString(){
        String aux = super.toString();
        aux += "- precio: "+this.getPrecio()+" - hábitat recomendado: "+habitat;
        return aux;
    }
    
}
