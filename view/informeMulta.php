<?php
session_start();
if (!isset($_SESSION['usuario'])) {
    //si no existe usuario
    header('Location: ../view/AccesoDenegado.php');
}else { ?>
    <?php include ("../model/conexion.php");
    echo '<h3> Puede ver la información de las multas</h3>';
    echo '<h3> si desea descargar el informe en excel, de clic en el boton GENERAR</h3>';	
    $consulta = "call proc_multa()";
    $resultado = mysqli_query($conn, $consulta);
    $filas=mysqli_num_rows($resultado);

    echo '<table border=2>';
    echo '<tr><th>Documento</th>
    <th align="center">Nombre</th>
    <th align="center">Email</th>
    <th align="center">numero_anden</th>
    <th align="center">numero_inmueble</th>
    <th align="center">tipo_multa</th>
    <th align="center">fecha_multa</th>
    <th align="center">valor_multa</th>
    <th align="center">estado</th>
    <th align="center">Cargo</th>
    <th align="center">nombre_administrador</th>';

    while ($filas=mysqli_fetch_row($resultado))
    {
        echo '<tr><td class="td-center">'.$filas[0].'</td><td class="td-center">'.$filas[1].'</td><td>'.$filas[2].'</td><td>'.$filas[3].'</td><td>'.$filas[4].'</td><td>'.$filas[5].'</td><td>'.$filas[6].'</td><td>'.$filas[7].'</td><td>'.$filas[8].'</td><td>'.$filas[9].'</td><td>'.$filas[10].'</td><tr>';
        
    }
    echo '</table>';
    echo '<table><tr><td><form action="../view/informe1Multa.php" method="post">
            <input type="submit" value="GENERAR"></form></table>';   

    ?>
<?php
}
?>    
