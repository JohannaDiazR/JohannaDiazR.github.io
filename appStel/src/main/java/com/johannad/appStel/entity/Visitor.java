package com.johannad.appStel.entity;
import com.fasterxml.jackson.annotation.JsonIgnore;
import jakarta.persistence.*;
import lombok.Data;
import org.hibernate.jdbc.Work;

//import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;
import java.util.List;
@Entity
@Table(name = "tbl_visitantes")
@Data
@AllArgsConstructor
@NoArgsConstructor    
public class Visitor implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(name = "nomVisitante", length = 35)
    private String nomVisitante; // Nombre del visitante

    @Column(name = "cedVisitante", length = 11)
    private int cedVisitante; // Cedula del visitante

    @Column(name = "nunInmueble")
    private int nunInmueble; // Número del inmueble

    @Column(name = "nomResidente", length = 35)
    private String nomResidente; // Nombre del residente

    @Column(name = "carVisitante")
    private boolean carVisitante; // Carro del visitante

    @Column(name = "ingrVisitante")
    private boolean ingrVisitante; // Ingreso del visitante

    @Column(name = "fecVisitante")
    private Date fecVisitante; // Fecha ingreso del visitante

    @ManyToOne
    @JoinColumn(name = "fkidTrabajador")
    private Worker worker;

    @ManyToOne
    @JoinColumn (name = "fkidParqueadero")
    private Parking parking;
}
