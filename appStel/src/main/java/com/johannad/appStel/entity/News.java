package com.johannad.appStel.entity;
import jakarta.persistence.*;
import lombok.Data;

//import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;
import java.util.List;
@Entity
@Table(name = "tblNovedades")
@Data
public class News implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(name = "remNovedades", length = 30)
    private String remNovedades;

    @Column(name = "tipoNovedad", length = 45)
    private String tipoNovedad;

    @Column(name = "asuntoNovedades", length = 65)
    private String asuntoNovedades;

    @Column(name = "descNovedades", length = 65)
    private String descNovedades;

    @Column(name = "docNovedades", length = 35)
    private String docNovedades;

    @Column(name = "fecNovedades")
    private Date fecNovedades;

    @Column(name = "resNovedades", length = 30)
    private String resNovedades;

    @Column(name = "estNovedades", length = 25)
    private String estNovedades;

    @ManyToMany(fetch = FetchType.EAGER)
    @JoinTable(
            name = "New_has_Role",
            joinColumns = @JoinColumn(name = "fkidNovedades", nullable = false),
            inverseJoinColumns = @JoinColumn(name = "fkidRol", nullable = false)
    )
    private List<Role> roleList;

}
