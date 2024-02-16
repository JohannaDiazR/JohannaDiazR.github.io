package com.johannad.appStel.entity;
import jakarta.persistence.*;
import lombok.Data;

//import javax.persistence.*;
import java.io.Serializable;
import java.util.List;
@Entity
@Table(name = "tbl_Rol")
@Data
@AllArgsConstructor
@NoArgsConstructor    
public class Role implements Serializable{
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(name = "nombreRol", length = 30)//Rol
    private String nombreRol;

    @ManyToMany(mappedBy = "roleList", fetch = FetchType.LAZY)
    private List<News> newList;

    @OneToMany(mappedBy = "role")
    private List<User> userList;

    @OneToMany (mappedBy = "role")
    private List<Worker> workerList;

    @OneToMany (mappedBy = "role")
    private List<Resident> residentList;

}
