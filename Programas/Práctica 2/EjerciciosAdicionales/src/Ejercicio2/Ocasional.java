package Ejercicio2;

public class Ocasional extends Recital {
    private String motivo;
    private String persona;
    private int dia;
    private boolean hecho;
    
    public Ocasional(String nombreBanda, int cantTemas, String motivo, String persona, int dia){
        super(nombreBanda,cantTemas);
        this.motivo = motivo;
        this.persona = persona;
        this.dia = dia;
        this.hecho = false;
    }
    
    @Override
    public void actuar(){
        if (null != this.motivo)switch (this.motivo) {
            case "show de beneficencia":
                System.out.println("Recuerden colaborar con "+this.persona+"");
                break;
            case "show de tv":
                System.out.println("¡Saludos amigos televidentes!");
                break;
            case "show privado":
                System.out.println("¡Un feliz cumpleaños para "+this.persona+"!");
                break;
            default:
                break;
        }
        super.actuar();
        this.hecho = true;
    }

    @Override
    public boolean finalizado() {
        return this.hecho;
    }

    @Override
    public double calcularCosto() {
        if (this.motivo.equals("show de beneficencia")){
            return 0;
        } else {
            if (this.motivo.equals("show de TV")){
                return 50000;
            } else {
                return 150000;
            }
        }
    }
    
    
}
