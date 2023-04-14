package SorteosParcial2020;

public class Avanzado extends Sorteo{
    
    public Avanzado(double premio){
        super(premio);
    }

    @Override
    public Persona elGanador() {
        double max = -1;
        Persona ganador = null;
        for (int i = 0; i < this.getDimF(); i++) {
            if (this.getBono(i) != null){
                if (this.getBono(i).getColaboracion() > max){
                    max = this.getBono(i).getColaboracion();
                    ganador = this.getBono(i);
                }
            }
        }
        return ganador;
    }  
}
