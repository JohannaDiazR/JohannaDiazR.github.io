<?php

    if (!empty($_GET["pkidNovedades"])){
        $pkidNovedades = $_GET["pkidNovedades"];

        $sql = $conn->query("SELECT COUNT(*) AS cantidad FROM residente_novedades WHERE pkidNovedades = $pkidNovedades");
        $row = $sql->fetch_assoc();

        if ($row["cantidad"] == 0) {
           
            $sql = $conn->query("DELETE FROM tbl_novedades WHERE pkidNovedades = $pkidNovedades");
            if ($sql==1) {
                echo '<div class ="alert alert-success"> Novedad eliminada correctamente</div>';
            }else{
                echo '<div class ="alert alert-danger">Error al eliminar la Novedad</div>';
            }
        }else{
          
            $sql = $conn->query("DELETE FROM residente_novedades  WHERE pkidNovedades = $pkidNovedades");
            if ($sql==1) {
               
                $sql = $conn->query("DELETE FROM tbl_novedades WHERE pkidNovedades = $pkidNovedades");
                if ($sql==1) {
                    echo '<div class ="alert alert-success"> Novedad eliminada correctamente</div>';
                }else{
                    echo '<div class ="alert alert-danger">Error al eliminar la Novedad</div>';
                }
            }else{
              
                echo '<div class ="alert alert-danger">No se puede eliminar la Novedad. Tiene registros relacionados</div>';
            }
        }

    }




?>