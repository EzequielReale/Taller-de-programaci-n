package D_Herencia.Ejer2;

public class Entrenador extends Empleado{
    private int campeonatos;
    
    static final int ADICIONAL_BAJO = 5000;
    static final int ADICIONAL_MEDIO = 30000;
    static final int ADICIONAL_ALTO = 50000;  
    
    public Entrenador(int cantCampeonatos, String nombre, double sueldoBasico){
        super(nombre,sueldoBasico);
        this.campeonatos = cantCampeonatos;
    }

    public int getCampeonatos() {
        return campeonatos;
    }

    public void setCampeonatos(int campeonatos) {
        this.campeonatos = campeonatos;
    }
    
    @Override
    public double calcularSueldoACobrar(){
        double sueldoTotal = getSueldoBasico();
        if (this.campeonatos <= 4)
            sueldoTotal += ADICIONAL_BAJO;
            else if (this.campeonatos <= 10)
                sueldoTotal += ADICIONAL_MEDIO;
                else if (this.campeonatos > 10)
                    sueldoTotal += ADICIONAL_ALTO;  
        return sueldoTotal;
    }
    
    @Override
    public String toString(){
        return super.toString()+"Soy entrenador de fútbol. Gané "+this.campeonatos+
                " campeonatos en total, por lo tanto cobro $"+this.calcularSueldoACobrar()+" en total.";
    }
}
