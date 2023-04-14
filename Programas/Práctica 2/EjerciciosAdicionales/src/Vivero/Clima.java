package Vivero;

/**
 *
 * @author Ezequiel
 */
public class Clima {
    private String nombre;
    private int temperatura, precipitaciones;
    
    public Clima(String nombre, int temperatura, int precipitaciones){
        this.nombre = nombre;
        this.temperatura = temperatura;
        this.precipitaciones = precipitaciones;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getTemperatura() {
        return temperatura;
    }

    public void setTemperatura(int temperatura) {
        this.temperatura = temperatura;
    }

    public int getPrecipitaciones() {
        return precipitaciones;
    }

    public void setPrecipitaciones(int precipitaciones) {
        this.precipitaciones = precipitaciones;
    }
}
