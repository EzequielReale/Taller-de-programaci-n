package C_Desarrollo_de_Clases;



public class Entrenador {
    private String nombre;
    private double sueldo;
    private int titulos;
   
    static final int ADICIONAL_BAJO = 5000;
    static final int ADICIONAL_MEDIO = 30000;
    static final int ADICIONAL_ALTO = 50000;   
    
    public Entrenador(){
        
    }
    
    public Entrenador(String unNombre, double unSueldo, int campeonatos){
        this.nombre = unNombre;
        this.sueldo = unSueldo;
        this.titulos = campeonatos;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public double getSueldo() {
        return sueldo;
    }

    public void setSueldo(double sueldo) {
        this.sueldo = sueldo;
    }

    public int getTitulos() {
        return titulos;
    }

    public void setTitulos(int titulos) {
        this.titulos = titulos;
    }
    
    public double calcularSueldoACobrar(){
        double sueldoFinal = this.sueldo;
        
        if (this.titulos <= 4)
            sueldoFinal += ADICIONAL_BAJO;
        else if (this.titulos <= 10)
            sueldoFinal += ADICIONAL_MEDIO;
        else if (this.titulos > 10)
            sueldoFinal += ADICIONAL_ALTO;
        
        return sueldoFinal;
    }
    
    @Override
    public String toString(){
        return"Mi nombre es "+this.nombre+", mi club me paga $"+this.sueldo+". Pero gané "
            +this.titulos+" títulos y por eso gano $"+this.calcularSueldoACobrar()+" en total";
    }
    
}
