package com.johannad.appStel.entity;
import com.fasterxml.jackson.annotation.JsonIgnore;
import jakarta.persistence.*;
import lombok.Data;

//import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;
import java.util.List;
@Entity
@Table(name = "tblDocsadmin")
@Data
@AllArgsConstructor
@NoArgsConstructor
public class AdminDocs implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(name = "classDocsadmin", length = 30)
    private String classDocsAdmin;

    @Column(name = "petiDocsadmin", length = 30)
    private String petiDocsAdmin;

    @ManyToOne
    @JoinColumn(name = "fkidTrabajador")
    private Worker worker;
}
