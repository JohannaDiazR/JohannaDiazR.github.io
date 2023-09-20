<?php
session_start();
if (!isset($_SESSION['usuario'])) {
    //si no existe usuario
    header('Location: ../view/AccesoDenegado.php');
}else { ?>
    <?php include ("../model/conexion.php");
    echo '<h3> Puede ver la información de las novedades</h3>';
    echo '<h3> si desea descargar el informe en excel, de clic en el boton GENERAR.</h3>';	
    echo '<table><tr><td><form action="../view/informe1Novedades.php" method="post">
            <input type="submit" value="GENERAR"></form></table>';   
    $consulta = "SELECT * FROM tbl_novedades";
    $resultado = mysqli_query($conn, $consulta);
    $filas=mysqli_num_rows($resultado);

    echo '<table border=2>';
    echo '<tr><th>Remitente</th>
    <th align="center">Encargado</th>
    <th align="center">Asunto</th>
    <th align="center">Descripcion</th>
    <th align="center">Fecha</th>
    <th align="center">Respuesta</th>
    <th align="center">Estado</th>';

    while ($filas=mysqli_fetch_row($resultado))
    {
        echo '<tr><td class="td-center">'.$filas[1].'</td><td class="td-center">'.$filas[2].'</td><td>'.$filas[3].'</td><td>'.$filas[4].'</td><td>'.$filas[6].'</td><td>'.$filas[7].'</td><td>'.$filas[8].'</td><tr>';
        
    }
    echo '</table>';

    ?>
<?php
}
?>    
