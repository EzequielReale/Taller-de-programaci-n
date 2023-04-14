package Vivero;

/**
 *
 * @author Ezequiel
 */
public class Acuatica extends Planta{
    private String agua;
    
    public Acuatica(String nombreCientifico, double precio, String agua){
        super(nombreCientifico,precio);
        this.agua = agua;
    }

    public String getAgua() {
        return agua;
    }

    public void setAgua(String agua) {
        this.agua = agua;
    }
    
    public double calcularImpuesto(){
        double total;
        total = this.getPrecio() + (this.getPrecio()*0.1);
        return total;
    }
    
    @Override
    public String toString(){
        String aux = super.toString();
        aux += "- precio: "+calcularImpuesto()+" - vive en agua: "+agua;
        return aux;
    }
}
