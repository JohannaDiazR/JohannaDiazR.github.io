package com.johannad.appStel.entity;
import com.fasterxml.jackson.annotation.JsonIgnore;
import jakarta.persistence.*;
import lombok.Data;

//import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;
import java.util.List;

@Entity
@Table(name = "tbl_trabajador")
@Data
@AllArgsConstructor
@NoArgsConstructor    
public class Worker  implements Serializable{

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY )
    int id;
    @Column(name = "nomTrabajador", length = 35)
    String nomTrabajador;
    @Column(name = "ccTrabajador", nullable = false)
    int ccTrabajador;
    @Column(name = "celTrabajador", nullable = false)
    int celTrabajador;
    @Column(name = "emaTrabajador", length = 40)
    String emaTrabajador;
    @Column(name ="tpcoTrabajador", length = 40)
    String tpcoTrabajador; //Tipo de contrato indefinido/fijo/prestacion servicios
    @Column(name = "contTrabajador", length = 50)
    String conTrabajador; //contrato del trabajador
    @Column(name = "cargTrabajador", length = 30)
    String cargTrabajador; //Administrador, Todero, Vigilante
    @Column(name = "empTrabajador", length = 30)
    String empTrabajador; //Nombre de la empresa

    @OneToMany (mappedBy = "worker")
    private List<Correspondence> correspondenceList;

    @OneToMany (mappedBy = "worker")
    private List<Visitor> visitorList;

    @OneToMany (mappedBy = "worker")
    private List<Fine> fineList;

    @OneToMany (mappedBy = "worker")
    private List<WalletStatus> walletStatusList;

    @OneToMany (mappedBy = "worker")
    private List<AdminDocs> adminDocsList;

    @ManyToOne
    @JoinColumn(name = "fkidRol")
    private Role role;
}
