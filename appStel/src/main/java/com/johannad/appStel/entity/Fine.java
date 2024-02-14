package com.johannad.appStel.entity;
import com.fasterxml.jackson.annotation.JsonIgnore;
import jakarta.persistence.*;
import lombok.Data;

//import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;
import java.util.List;

@Entity
@Table(name = "tbl_multa")
@Data

public class Fine implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY )
    int id;
    @Column(name = "ninmMulta", nullable = false)
    int ninmMulta; //numero de inmueble
    @Column(name = "tipoMulta", length = 30)
    String tipoMulta; //tipo multa razon de la multa
    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "fecMulta")
    Date fecMulta; //Fecha en la que se pone la multa
    @Column(name = "evidMulta", length = 35)
    String evidMulta; //evidencia de la multa
    @Column(name = "valMulta", nullable = false)
    int valMulta; //Valor a pagar la multa
    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "fpagMulta")
    Date fpagMulta;

    //Foraneas
    //fkidInmueble
    @ManyToOne
    @JoinColumn (name = "fkidInmueble")
    private Property property;
    //fkidTrabajador
    @ManyToOne
    @JoinColumn (name = "fkidTrabajador")
    private Worker worker;
}
