package C_Desarrollo_de_Clases;

public class Micro {
    private String patente;
    private int horaSalida, asientos;
    private String destino;
    private boolean ocupado[];
    
    public Micro(String unaPatente, String unDestino, int unaHoraSalida, int cantAsientos){
        this.patente = unaPatente;
        this.destino = unDestino;
        this.horaSalida = unaHoraSalida;
        this.asientos = cantAsientos;
        this.ocupado = new boolean[this.asientos];
        for (int i = 0; i < asientos; i++) {
            this.ocupado[i] = false;
        }
    }

    public String getPatente() {
        return patente;
    }

    public void setPatente(String patente) {
        this.patente = patente;
    }

    public String getDestino() {
        return destino;
    }

    public void setDestino(String destino) {
        this.destino = destino;
    }

    public int getHoraSalida() {
        return horaSalida;
    }

    public void setHoraSalida(int horaSalida) {
        this.horaSalida = horaSalida;
    }

    public int getCantOcupados() {
        int cantOcupados = 0;
        for (int i = 0; i < this.asientos; i++) {
            if (this.ocupado[i]) {
                cantOcupados++;
            }
        }
        return cantOcupados;
    }
    
    public boolean getMicroLleno(){
        return (this.getCantOcupados() == this.asientos);
    }
    
    public boolean getAsientoValido(int i){
        return ((i-1 >= 0) && (i-1 < this.asientos)); 
    } 
    
    public boolean getEstadoAsiento(int i){
        boolean disponible = false;
        if (this.getAsientoValido(i)){
            if (!this.ocupado[i-1]){
                disponible = true;
            }
        }
        return disponible;
    }
        
    public void setAsiento(int i){
        if (this.getAsientoValido(i)){
            this.ocupado[i-1] = true;
        }   
    }
    
    public void setntAsiento(int i){
        if (this.getAsientoValido(i)){
            this.ocupado[i-1] = false;
        }   
    }
    
    public int getPrimerAsientoLibre(){
        int i = 0;
        while ((i < this.asientos) & (this.ocupado[i])){
            i++;
        }
        return i+1;
    }
    
    @Override
    public String toString(){
        return "El micro con patente "+this.patente+" sale a las "+this.horaSalida+"hs con destino en: "+this.destino+
               ". Posee "+this.asientos+" asientos de los cuales "+this.getCantOcupados()+" se encuentran ocupados";
    }
}
