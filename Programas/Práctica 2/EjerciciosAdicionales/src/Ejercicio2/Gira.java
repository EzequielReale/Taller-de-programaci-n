package Ejercicio2;

public class Gira extends Recital{
    private String nombreGira;
    private Fecha[] fechas;
    private int fechaActual;
    private int cantFechas;
    private int cantMaxFechas;
    
    public Gira(String nombreBanda, int cantTemas, String nombreGira, int cantMaxFechas){
        super(nombreBanda,cantTemas);
        this.nombreGira = nombreGira;
        this.cantMaxFechas = cantMaxFechas;
        this.cantFechas = 0;
        this.fechas = new Fecha[this.cantMaxFechas];
        this.fechaActual = 0;
    }
    
    public void agregarFecha(Fecha fecha){
        this.fechas[this.cantFechas] = fecha;
        this.cantFechas++;
    }
    
    @Override
    public void actuar(){
        if (this.fechaActual < this.cantFechas){
            System.out.print("¡Buenas noches "+this.fechas[this.fechaActual].getCiudad()+"! ");
            super.actuar();
            this.fechaActual++;
        }
    }

    @Override
    public boolean finalizado() {
        return (this.fechaActual == this.cantFechas);
    }

    @Override
    public double calcularCosto() {
        return (30000 * this.cantFechas);
    }   
    
}
