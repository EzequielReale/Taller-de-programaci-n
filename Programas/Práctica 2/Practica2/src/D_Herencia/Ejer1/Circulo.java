package D_Herencia.Ejer1;

public class Circulo extends Figura{
    private double radio;
    
    public Circulo(double radio, String colorRelleno, String colorLinea){
        super(colorRelleno, colorLinea);
        this.radio = radio;
    }

    public double getRadio() {
        return radio;
    }

    public void setRadio(double radio) {
        this.radio = radio;
    }
    
    @Override
    public double calcularArea(){
        return (Math.PI * (this.radio * this.radio));
    }
    
    @Override
    public double calcularPerimetro(){
        return (2 * Math.PI * this.radio);
    }
    
    @Override
    public String toString(){
        return super.toString()+
                " - Radio: " +this.radio;
    }
}
