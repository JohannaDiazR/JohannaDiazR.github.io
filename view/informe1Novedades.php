<?php
session_start();
if (!isset($_SESSION['usuario'])) {
    //si no existe usuario
    header('Location: ../view/AccesoDenegado.php');
}else { ?>
    <?php include ("../model/conexion.php");

    $consulta = "SELECT * from tbl_novedades";
    header("content-type: aplication/vnd.ms-excel; charset=utf-8");
    header("content-Disposition: attachment; filename=datos-Novedades.xls");
    ?>

    <table border="1">
        <b><caption>Listado de Novedades</caption></b>
        <tr>
            <th>Remitente</th>
            <th>Encargado</th>
            <th>Asunto</th>
            <th>Descripcion</th>
            <th>Fecha</th>
            <th>Respuesta</th>
            <th>Estado</th>
        </tr>

    <?php
    $resultado = mysqli_query($conn, $consulta);
    while ($filas = mysqli_fetch_assoc($resultado))
    {
        ?>
        <tr>
            <td> <?php echo $filas["remNovedades"]; ?></td>
            <td> <?php echo $filas["TipoNovedad"]; ?></td>
            <td> <?php echo $filas["asuntoNovedades"]; ?></td>
            <td> <?php echo $filas["descNovedades"]; ?></td>
            <td> <?php echo $filas["fecNovedades"]; ?></td>
            <td> <?php echo $filas["resNovedades"]; ?></td>
            <td> <?php echo $filas["estNovedades"]; ?></td>
            
        </tr>
    <?php } ?>    
    </table>
<?php
}
?>