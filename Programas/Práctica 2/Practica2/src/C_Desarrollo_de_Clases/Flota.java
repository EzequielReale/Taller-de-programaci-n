package C_Desarrollo_de_Clases;
 
public class Flota {
    private Micro[] micros;
    private int dimL;
    
    static final int DIMF = 14;
    
    public Flota(){
        this.dimL = 0;
        this.micros = new Micro[15];
        for (int i = 0; i < DIMF; i++) {
            this.micros[i] = null;
        }
    }

    public void setMicro(Micro micro) {
        if (dimL < DIMF){
            this.micros[dimL] = micro;
            this.dimL++;
        }
    }
    
    public boolean getFlotaLlena(){
        return (dimL == DIMF);
    }
    
    public String eliminarMicro(String patente){
        String aux;
        int i = 0;
        while ((i < dimL) && (!patente.equals(this.micros[i].getPatente())))
            i++;
        if (i < dimL){
            for (int j = i; j < dimL; j++) 
                this.micros[j] = this.micros[j + 1];
            dimL--; 
           aux = "El micro se eliminó con éxito.";
        }
        else
            aux = "El micro con la patente solicitada no existe.";
        return aux;
    }
    
    public Micro getMicroPorPatente(String patente){
        int i = 0;
        while ((i < dimL) && (!patente.equals(this.micros[i].getPatente())))
            i++;
        if (i < dimL)
            return this.micros[i];
        else
            return null;
    }
    
    public String getMicroPorDestino(String destino){
        int i = 0;
        while ((i < dimL) && (!destino.equals(this.micros[i].getDestino()))){
            i++;
        }
        if (i < dimL)
            return this.micros[i].getPatente();
        else
            return null;
    }    
}