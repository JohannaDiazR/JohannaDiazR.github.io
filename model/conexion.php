<?php
    $servidor = '127.0.0.1';
        $user = 'root';
        $clave = '';
        $dbname = 'bd_stel';
        $conn = mysqli_connect($servidor,$user,$clave,$dbname);


        if(!$conn){
            die("Error de conexión ".mysqli_connect_error());  
        }else{
            echo "Conexión exitosa :D <br>";
        }

?>