package com.johannad.appStel.entity;
import com.fasterxml.jackson.annotation.JsonIgnore;
import jakarta.persistence.*;
import lombok.Data;

//import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;
import java.util.List;
@Entity
@Table(name = "tblResidente")
@Data
@AllArgsConstructor
@NoArgsConstructor    
public class Resident implements Serializable{
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(name = "nomResidente", length = 35)
    private String nomResidente;

    @Column(name = "cedResidente", length = 11)
    private int cedResidente;

    @Column(name = "emaResidente", length = 40)
    private String emaResidente;

    @Column(name = "celResidente", length = 11)
    private int celResidente;

    @Column(name = "mascResidente")
    private boolean mascResidente;

    @Column(name = "nmascResidente", length = 11)
    private int nmascResidente;

    @Column(name = "fnacResidente")
    private Date fnacResidente;

    @Column(name = "edadResidente", length = 11)
    private int edadResidente;

    @ManyToOne
    @JoinColumn (name = "fkidParqueadero")
    private Parking parking;

    @ManyToOne
    @JoinColumn(name = "fkidRol")
    private Role role;



}
