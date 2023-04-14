package B_Introducción_a_POO;


public class E3P1parte2QueImprimeB {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        persona p1; 
        persona p2;
        p1 = new persona();
        p1.setNombre("Pablo Sotile");
        p1.setDNI(11200413);
        p1.setEdad(40);
        p2 = new persona();
        p2.setNombre("Julio Toledo");
        p2.setDNI(22433516);
        p2.setEdad(51);
        p1 = p2;
        p1.setEdad( p1.getEdad() + 1 );
        System.out.println(p2.toString());
        System.out.println(p1.toString());
        System.out.println( (p1 == p2) );
    }
    
}
