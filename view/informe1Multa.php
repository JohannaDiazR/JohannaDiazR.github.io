<?php
session_start();
if (!isset($_SESSION['usuario'])) {
    //si no existe usuario
    header('Location: ../view/AccesoDenegado.php');
}else { ?>
    <?php include ("../model/conexion.php");

    $consulta = "call proc_multa()";
    header("content-type: aplication/vnd.ms-excel; charset=utf-8");
    header("content-Disposition: attachment; filename=datos-Multa.xls");
    ?>

    <table border="1">
        <caption>Listado de Multas</caption>
        <tr>
            <th>Documento</th>
            <th>Nombre</th>
            <th>Email</th>
            <th>numero_anden</th>
            <th>numero_inmueble</th>
            <th>tipo_multa</th>
            <th>fecha_multa</th>
            <th>valor_multa</th>
            <th>estado</th>
            <th>Cargo</th>
            <th>nombre_administrador</th>
        </tr>

    <?php
    $resultado = mysqli_query($conn, $consulta);
    while ($filas = mysqli_fetch_assoc($resultado))
    {
        ?>
        <tr>
            <td> <?php echo $filas["documento"]; ?></td>
            <td> <?php echo $filas["nombre"]; ?></td>
            <td> <?php echo $filas["email"]; ?></td>
            <td> <?php echo $filas["numero_anden"]; ?></td>
            <td> <?php echo $filas["numero_inmueble"]; ?></td>
            <td> <?php echo $filas["tipo_multa"]; ?></td>
            <td> <?php echo $filas["fecha_multa"]; ?></td>
            <td> <?php echo $filas["valor_multa"]; ?></td>
            <td> <?php echo $filas["estado"]; ?></td>
            <td> <?php echo $filas["Cargo"]; ?></td>
            <td> <?php echo $filas["nombre_administrador"]; ?></td>

        </tr>
    <?php } ?>    
    </table>
<?php
}
?>