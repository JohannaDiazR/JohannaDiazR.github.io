package com.johannad.appStel.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
import jakarta.persistence.*;
import lombok.Data;

//import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;
import java.util.List;

@Entity
@Table(name = "tbl_correspondencia")
@Data
@AllArgsConstructor
@NoArgsConstructor    
public class Correspondence  implements Serializable{

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY )
    int id;
    @Column(name = "tipoCorrespondencia", length = 30)
    String tipoCorrespondencia; //Tipo correspondencia paquete/carta/recibo
    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "frecCorrespodencia")
    Date frecCorrespondencia; //Fecha en la que ingresa la correspondencia al conjunto
    @Column(name = "estCorrespondencia", length = 20)
    String estCorrespondencia; //Estado de correspondencia entregado/no entregado
    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "fentrCorrespondencia")
    Date fentrCorrespondencia; //Fecha en la que se entrega la correspondencia

    //@JsonIgnore
    @ManyToOne
    @JoinColumn(name = "fkidTrabajador")
    private Worker worker;

    @ManyToMany(mappedBy = "correspondence", fetch = FetchType.LAZY)
    private List<Property> propertyList;


}
