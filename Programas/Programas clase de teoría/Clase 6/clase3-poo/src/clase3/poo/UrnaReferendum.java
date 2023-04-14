package clase3.poo;

public class UrnaReferendum extends Urna{
    private int votosAFavor;
    private int votosEnContra;
    
    public UrnaReferendum(int U){
       super(U);
       votosAFavor=0;
       votosEnContra=0;
    }

    public int getVotosAFavor() {
        return votosAFavor;
    }

    public int getVotosEnContra() {
        return votosEnContra;
    }
    
    public void votarAFavor(){
        votosAFavor++;
    }
    
    public void votarEnContra(){
        votosEnContra++;
    }
    
    public  int calcularGanador(){
       int resultado; 
       if (votosAFavor == votosEnContra){
          resultado=-1; //Empate
       }
       else if (votosEnContra > votosAFavor){
          resultado=0;  //Gano en contra
       }
       else resultado= 1; //Gano a favor
       return resultado;
    }
    
     public int calcularTotalVotos(){
       return (this.getVotosBlanco()+ votosAFavor + votosEnContra);
     }
    
}
