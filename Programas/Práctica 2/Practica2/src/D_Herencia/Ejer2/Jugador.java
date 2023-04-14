package D_Herencia.Ejer2;

public class Jugador extends Empleado{
    private int partidos, goles;
    
    public Jugador(int cantPartidos, int cantGoles, String nombre, double sueldoBasico){
        super(nombre,sueldoBasico);
        this.partidos = cantPartidos;
        this.goles = cantGoles;
    }

    public int getPartidos() {
        return partidos;
    }

    public void setPartidos(int partidos) {
        this.partidos = partidos;
    }

    public int getGoles() {
        return goles;
    }

    public void setGoles(int goles) {
        this.goles = goles;
    }
    
    public double calcularPromedioDeGol(){
        double promedio = (double) this.goles / this.partidos; 
        return promedio;
    }
    
    @Override
    public double calcularSueldoACobrar(){
        double sueldoTotal = getSueldoBasico();
        if (calcularPromedioDeGol() > 0.5)
            sueldoTotal += getSueldoBasico();
        return sueldoTotal;
    }
    
    @Override
    public String toString(){
        return super.toString()+ "Soy jugador de fútbol. Mi promedio de gol es: "+this.calcularPromedioDeGol()+
               ", por lo tanto cobro $"+this.calcularSueldoACobrar()+" en total.";
    }
}
