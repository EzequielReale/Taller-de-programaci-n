package Ejercicio1;

public class Proyecto {
    private String nombre, director;
    private int codigo;
    private Investigador[] investigadores;
    private int cantInvestigadores = 0;
    
    public Proyecto(String nombre, String director, int codigo){
        this.nombre = nombre;
        this. director = director;
        this.codigo = codigo;
        this.investigadores = new Investigador[50];
        for (int i = 0; i < 50; i++) {
            investigadores[i] = null;
        }   
    }

    public int getCantInvestigadores() {
        return cantInvestigadores;
    }

    public Investigador[] getInvestigadores() {
        return investigadores;
    }
    
    public void agregarInvestigador(Investigador unInvestigador){
        this.investigadores[this.cantInvestigadores] = unInvestigador;
        this.cantInvestigadores++;
    }
    
    public double dineroTotalOtorgado(){
        double total = 0;
        for (int i = 0; i < this.cantInvestigadores; i++) {
            total += investigadores[i].getMontoTotal();
        }
        return total;
    }
    
    public int cantidadDeSubsidios(String unNombreApellido){
        int cant = 0;
        for (int i = 0; i < this.cantInvestigadores; i++) {
            if (this.investigadores[i].getNombreApellido().equals(unNombreApellido)){
                cant = this.investigadores[i].getCantSubsidios();
            }
        }  
        return cant;
    }
    
    public void otorgarTodos(String unNombreApellido){

        for (int i = 0; i < this.cantInvestigadores; i++) {
            if (this.investigadores[i].getNombreApellido().equals(unNombreApellido)){
                for (int j = 0; j < this.investigadores[i].getCantSubsidios(); j++) {
                    this.investigadores[i].otorgarSubsidio(j);
                }
            }
        }
    }
    
    
    @Override
    public String toString(){
        return "Al proyecto "+this.nombre+", dirigido por el dr. "+this.director+" le fueron otorgados $"+
                this.dineroTotalOtorgado()+" para su realización. Los investigadores encargados de realizarlo fueron ";
    }
}
