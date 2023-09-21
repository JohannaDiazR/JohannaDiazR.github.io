<?php
session_start();
if (!isset($_SESSION['usuario'])) {
    //si no existe usuario
    header('Location: ../view/AccesoDenegado.php');
}else { ?>
    <?php include ("../model/conexion.php");
        $id = $_GET['pkidNovedades'];
        
        $sql = $conn->query("SELECT * FROM tbl_novedades WHERE pkidNovedades = $id");
    ?>

    <!DOCTYPE html>
    <html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta charset="utf-8">
            <meta name="viewport" content="width=device-width, initial-scale=1">
            <title>STEL</title>
            
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
            <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
            <link rel="shortcout icon" href="0. Imagenes/0. Logos/3. logo sin  nombre blanco.png">
            <link rel="stylesheet" type="text/css" href="1. CSS/2. Modulos.css">

            <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.2.0/css/bootstrap.min.css">
            <link rel="stylesheet" href="https://cdn.datatables.net/1.13.4/css/dataTables.bootstrap5.min.css">
            <link rel="stylesheet" type="text/css" href="1. CSS/2. Modulos.css">

            <script src="https://code.jquery.com/jquery-3.5.1.js" defer></script>
            <script src="https://cdn.datatables.net/1.13.4/js/jquery.dataTables.min.js" defer></script>
            <script src="https://cdn.datatables.net/1.13.4/js/dataTables.bootstrap5.min.js" defer></script>
            <script src="2. JavaScript/modulos.js" defer></script>
        
    </head>
    <body>

        <div class="container d-text-center pt-4 ">

                        
            <div class="row justify-content-center">

                <div class="col">

                        <h2> Modificar Novedad</h2>
                        <hr>
                        <form action="../controller/editarNovedad1.php" method="post">

                    
                        <?php
                        include ("../controller/editarNovedad1.php");

                        // Obtén el registro a editar
                        if(isset($_GET["pkidNovedades"])) {
                            $pkidNovedades = $_GET["pkidNovedades"];
                            $sql = $conn->query("SELECT * FROM tbl_novedades WHERE pkidNovedades = $pkidNovedades");
                            $datos = $sql->fetch_object();
                        }
                        ?>

                            <form method="post" action="tu_script_de_actualizacion.php">
                            <input type="hidden" name="id" value="<?php echo $datos->pkidNovedades; ?>">

                            <label for="remitenteNovedad" class="form-label" style="margin-top: 15px; margin-bottom: 15px; font-weight: 700; color:#23518C">Nombre Remitente</label>
                            <input type="text" class="form-control" name="remNovedades" aria-describedby="Remitente" maxlength="15" placeholder="Nombre" value="<?php echo $datos->remNovedades; ?>">

                            <!-- Tipo novedad -->

                            <label for="tipoNovedad1" style="margin-top: 15px; margin-bottom: 10px; font-weight: 700; color:#23518C">Tipo de Novedad</label>
                            <select name="TipoNovedad" class="form-select" aria-label="Tipo de novedad">
                                <option value="Vigilante" <?php if ($datos->TipoNovedad === 'Vigilante') echo 'selected'; ?>>Vigilante</option>
                                <option value="Residente" <?php if ($datos->TipoNovedad === 'Residente') echo 'selected'; ?>>Residente</option>
                                <option value="Todero" <?php if ($datos->TipoNovedad === 'Todero') echo 'selected'; ?>>Todero</option>
                                <option value="Administrador" <?php if ($datos->TipoNovedad === 'Administrador') echo 'selected'; ?>>Administrador</option>
                            </select>
                            
                            <!-- Asunto de Novedad -->

                            <!-- Asunto de Novedad -->

                            <label for="asuntonovedad" class="form-label" style="margin-top: 15px; margin-bottom: 10px; font-weight: 700; color:#23518C">Asunto Novedad</label>
                            <select name="asuntoNovedades" class="form-select" aria-label="Asunto">
                                <option value="Solicitud Inmueble" <?php if ($datos->asuntoNovedades === 'Solicitud Inmueble') echo 'selected'; ?>>Solicitud permiso laboral</option>
                                <option value="Solicitud zonas comunes" <?php if ($datos->asuntoNovedades === 'Solicitud zonas comunes') echo 'selected'; ?>>Solicitud zonas comunes</option>
                                <option value="Solicitud camaras de seguridad" <?php if ($datos->asuntoNovedades === 'Solicitud camaras de seguridad') echo 'selected'; ?>>Solicitud camaras de seguridad</option>
                                <option value="Solicitud reunión con administrador" <?php if ($datos->asuntoNovedades === 'Solicitud reunión con administrador') echo 'selected'; ?>>Solicitud reunión con administrador</option>
                                <option value="Solicitud reunión con vecino" <?php if ($datos->asuntoNovedades === 'Solicitud reunión con vecino') echo 'selected'; ?>>Solicitud reunión con vecino</option>
                            </select>


                            <!-- Descripción -->

                            <label for="descripcionNovedad" class="form-label" style="margin-top: 15px; margin-bottom: 15px; font-weight: 700; color:#23518C" >Descripción novedad</label>
                            <div class="form-floating">
                                <textarea class="form-control" placeholder="Leave a comment here" name="descNovedades" style="height: 100px" maxlength="180"><?php echo $datos->descNovedades; ?></textarea>
                                <label for="descripcionNovedad" style="font-size: 13px;">Razon</label>
                            </div>

                            <!-- Documento Novedad -->

                            <label for="documentoNovedad" class="form-label" style="margin-top: 15px; margin-bottom: 15px; font-weight: 700; color:#23518C;" >Documento Novedad</label>
                            <input type="file" class="form-control" name="docNovedades"><br>

                            <!-- Fecha Evidencia -->

                            <label for="fechaNovedades" class="form-label" style="margin-top: 15px; margin-bottom: 15px; font-weight: 700; color:#23518C;" >Fecha Novedad</label>
                            <input type="date" class="form-control" name="fecNovedades" aria-describedby="fecha_de_asignacion_Novedad" value="<?php echo $datos->fecNovedades; ?>">
 
                            <!-- Respuesta Novedad -->

                            <label for="respuestanovedad" style="margin-top: 15px; margin-bottom: 10px; font-weight: 700; color:#23518C">Respuesta Novedad</label>
                            <select name="resNovedades" class="form-select" aria-label="Respuesta Novedad">
                                <option value="Revisar cronograma" <?php if ($datos->resNovedades === 'Revisar cronograma') echo 'selected'; ?>>Revisar cronograma</option>
                                <option value="verificar estado zona" <?php if ($datos->resNovedades === 'verificar estado zona') echo 'selected'; ?>>verificar estado zona</option>
                                <option value="conciliacion con vecinos" <?php if ($datos->resNovedades === 'conciliacion con vecinos') echo 'selected'; ?>>conciliación con vecinos</option>
                                <option value="Revision turnos" <?php if ($datos->resNovedades === 'Revision turnos') echo 'selected'; ?>>Revision turnos</option>
                                <option value="citar vecinos" <?php if ($datos->resNovedades === 'citar vecinos') echo 'selected'; ?>>citar vecinos</option>
                                <option value="programar reunion" <?php if ($datos->resNovedades === 'programar reunion') echo 'selected'; ?>>programar reunion</option>
                                <option value="programar revision camaras" <?php if ($datos->resNovedades === 'programar revision camaras') echo 'selected'; ?>>programar revision camaras</option>
                                <option value="Convocar reunion anden" <?php if ($datos->resNovedades === 'Convocar reunion anden') echo 'selected'; ?>>Convocar reunion anden</option>
                                <option value="dialogar con vecino" <?php if ($datos->resNovedades === 'dialogar con vecino') echo 'selected'; ?>>dialogar con vecino</option>

                            </select>
                            
                           <!-- Estado novedad -->

                            <label for="estadoNovedad" style="margin-top: 15px; margin-bottom: 10px; font-weight: 700; color:#23518C">Estado Novedad</label>
                            <select name="estNovedades" class="form-select" aria-label="Estado Novedad">
                                <option value="Espera" <?php if ($datos->estNovedades === 'Espera') echo 'selected'; ?>>Espera</option>
                                <option value="Solicitud Atendida" <?php if ($datos->estNovedades === 'Solicitud Atendida') echo 'selected'; ?>>Solicitud Atendida</option>
                                <option value="Solicitud No atendida" <?php if ($datos->estNovedades === 'Solicitud No atendida') echo 'selected'; ?>>Solicitud No atendida</option>
                            
                            </select>

                            <button type="submit" class="btn btn-primary mb-3" style="margin-top: 30px; background-color: #0d0d0d; color: #f2ebdc; border: 1px solid rgba(0,0,0,0.15);" name="Actualizar">Actualizar Novedad </button>
                        </form>
                     






                    
            
                </div>
            
                <!-- Imagen -->
                
                <div class="col">

                    <img src="0. Imagenes/21. Novedades/2-NovResidenteForm.png" alt="" style="border-radius: 10px; margin-left: 90px; margin-top: 20px;">

                </div>


            </div>

        </div>
                                
    </body>
    </html>
<?php
}
?>