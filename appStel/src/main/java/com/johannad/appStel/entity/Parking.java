package com.johannad.appStel.entity;
import com.fasterxml.jackson.annotation.JsonIgnore;
import jakarta.persistence.*;
import lombok.Data;

//import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;
import java.util.List;
@Entity
@Table(name = "tblParqueadero")
@Data
@AllArgsConstructor
@NoArgsConstructor    
public class Parking implements Serializable{
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(name = "tipoParqueadero", length = 30)
    private String tipoParqueadero;

    @Column(name = "estadoParqueadero", length = 30)
    private String estadoParqueadero;

    @Column(name = "fecParqueadero")
    private Date fecParqueadero;

    @Column(name = "dvteParqueadero", length = 45)
    private String dvteParqueadero;

    @Column(name = "cupParqueadero", length = 11)
    private int cupParqueadero;

    @Column(name = "horaSalida")
    private Date horaSalida;

    @Column(name = "tarParqueadero", length = 11)
    private int tarParqueadero;

    @OneToMany (mappedBy = "parking")
    private List<Resident> residentList;

    @OneToMany (mappedBy = "parking")
    private List<Visitor> visitorList;

}
