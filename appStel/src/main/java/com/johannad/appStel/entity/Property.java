package com.johannad.appStel.entity;
import com.fasterxml.jackson.annotation.JsonIgnore;
import jakarta.persistence.*;
import lombok.Data;

//import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;
import java.util.List;
@Entity
@Table(name = "tbl_Inmueble")
@Data
public class Property implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(name = "andInmueble", length = 11)//anden donde se ubica el inmueble
    private int andInmueble;

    @Column(name = "numInmueble", length = 11)//numero del inmueble
    private int numInmueble;

    @OneToMany (mappedBy = "property")
    private  List<Fine> fineList;

    @OneToMany (mappedBy = "property")
    private List<WalletStatus> walletStatusList;

    @ManyToMany(fetch = FetchType.EAGER)
    @JoinTable(
            name = "Property_Correspondence",
            joinColumns = @JoinColumn(name = "fkidInmueble", nullable = false),
            inverseJoinColumns = @JoinColumn(name = "fkidCorrespondencia", nullable = false)
    )
    private List<Correspondence> correspondence;
}
