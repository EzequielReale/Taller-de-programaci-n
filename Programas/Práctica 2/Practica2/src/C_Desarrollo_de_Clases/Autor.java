package C_Desarrollo_de_Clases;

public class Autor {
    private String nombre, biografia;
    
    public Autor(){
        
    }
    
    public Autor(String unNombre, String unaBiografia){
        this.nombre = unNombre;
        this.biografia = unaBiografia;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getBiografia() {
        return biografia;
    }

    public void setBiografia(String biografia) {
        this.biografia = biografia;
    }
    
    public String toString(){
        String aux = " por "+this.nombre+
                     ", cuya biografía es: ''"+this.biografia+"''.";
        return aux;
    }
}
