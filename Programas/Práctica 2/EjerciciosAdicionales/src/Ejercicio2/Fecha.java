package Ejercicio2;

public class Fecha {
    private int dia;
    private String ciudad;
    
    public Fecha(int dia, String ciudad){
        this.dia = dia;
        this.ciudad = ciudad;
    }

    public int getDia() {
        return dia;
    }

    public void setDia(int dia) {
        this.dia = dia;
    }

    public String getCiudad() {
        return ciudad;
    }

    public void setCiudad(String ciudad) {
        this.ciudad = ciudad;
    }
    
    
}
