package clase3.poo;

public abstract class Urna {
    private int numero;
    private int votosBlanco;

    public Urna(int U){
      //Setear el nro. de urna a U
      numero=U;
      //votosBlanco a 0
      votosBlanco=0;     
    }
    
    public int getNumero() {
        return numero;
    }

    public int getVotosBlanco() {
        return votosBlanco;
    }

    public void setNumero(int numero) {
        this.numero = numero;
    }
    
    public void votarEnBlanco(){
        votosBlanco++;
    } 
    
    
    public abstract int calcularGanador(); 
    public abstract int calcularTotalVotos(); 
    
}
