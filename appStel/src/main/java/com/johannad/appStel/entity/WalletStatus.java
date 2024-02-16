package com.johannad.appStel.entity;
import com.fasterxml.jackson.annotation.JsonIgnore;
import jakarta.persistence.*;
import lombok.Data;

//import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;
import java.util.List;

@Entity
@Table(name = "tbl_estcartera")
@Data
@AllArgsConstructor
@NoArgsConstructor    
public class WalletStatus implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY )
    int id;
    @Column(name = "docEstCartera", length = 50)
    String docEstCartera; //documento del estado //paz y salvo/acuerdo de pago
    @Column(name = "estCartera", length = 30)
    String estCartera; //estado de cartera mora//paz y salvo
    @Column(name = "taccEstCartera", length = 20)
    String taccEstCartera; //tipo de acceso permitido/bloqueado
    @Column(name = "notiEstCartera", length = 35)
    String notiEstCartera; //Notificar al residente

    //Llaves foraneas
    //fkidInmueble
    @ManyToOne
    @JoinColumn(name = "fkidInmueble")
    private Property property;

    //fkidTrabajador
    @ManyToOne
    @JoinColumn(name = "fkidTrabajador")
    private Worker worker;
}
