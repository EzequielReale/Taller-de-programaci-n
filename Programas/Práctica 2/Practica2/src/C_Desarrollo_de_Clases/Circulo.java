package C_Desarrollo_de_Clases;

public class Circulo {
    private double radio;
    private String colorLinea;
    private String colorRelleno;
    
    public Circulo(){
        
    }
    
    public Circulo(double unRadio, String unColorLinea, String unColorRelleno){
        this.radio = unRadio;
        this.colorLinea = unColorLinea;
        this.colorRelleno = unColorRelleno;
    }

    public double getRadio() {
        return radio;
    }

    public void setRadio(double radio) {
        this.radio = radio;
    }

    public String getColorLinea() {
        return colorLinea;
    }

    public void setColorLinea(String colorLinea) {
        this.colorLinea = colorLinea;
    }

    public String getColorRelleno() {
        return colorRelleno;
    }

    public void setColorRelleno(String colorRelleno) {
        this.colorRelleno = colorRelleno;
    }
    
    public double calcularPerimetroC(){
        return (2 * Math.PI * this.radio);
    }
    
    public double calcularAreaC(){
        return (Math.PI * (this.radio * this.radio));
    }
    
    @Override
    public String toString(){
        return "Hola! Soy un circúlo! Mi radio es :"+this.radio+
                ". Mi color de relleno es "+this.colorRelleno+" y mi color de línea es "+this.colorLinea+
                ". Mi perímetro es "+this.calcularPerimetroC()+" y mi área es "+this.calcularAreaC();
    }
}
