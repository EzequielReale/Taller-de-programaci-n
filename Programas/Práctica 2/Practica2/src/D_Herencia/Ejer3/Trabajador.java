package D_Herencia.Ejer3;

public class Trabajador extends Persona{
    private String trabajo;
    
    public Trabajador(String nombre, int DNI, int edad, String trabajo){
        super(nombre, DNI, edad);
        this.trabajo = trabajo;
    }

    public String getTrabajo() {
        return trabajo;
    }

    public void setTrabajo(String trabajo) {
        this.trabajo = trabajo;
    }
    
    @Override
    public String toString(){
        return super.toString()+"Soy "+this.trabajo+".";
    }
}
