package C_Desarrollo_de_Clases;

public class E3P2parte2 {

    public static void main(String[] args) {
        Autor autor;
        
        //No puse los datos por teclado únicamente porque me daba pereza y el funcionamiento es el mismo
        autor = new Autor("Edgar Allan Poe","El almohadon de plumas me traumó");
        Libro libro1= new  Libro( "Java: A Beginner's Guide", "Mcgraw-Hill", 
                                    2014, autor, "978-0071809252", 21.72);
        
        autor = new Autor("DiGiusti","Con mi libro aprobó la promoción Ezequiel");
        Libro libro2= new Libro("Learning Java by Building Android Games",  
                                "CreateSpace Independent Publishing", autor, "978-1512108347");
        
        System.out.println(libro1.toString());
        System.out.println(libro2.toString());
        System.out.println("Precio del libro2: " +libro2.getPrecio());
        System.out.println("Año edición del libro2: " +libro2.getAñoEdicion());
        Libro libro3= new Libro(); 
    }
    
}
