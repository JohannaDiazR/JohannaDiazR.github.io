<?php include("../model/conexion.php");  
    session_start();

    $usuario = $_POST['usuario'];
    $clave = $_POST['password'];

    $_SESSION['usuario']=$usuario;

    if (!preg_match('/^(\w*\d+|\w*)(@)(gmail|yahoo|hotmail|outlook)(\.)(com\.co|com)$/', $usuario)){
        // El "correo" es incorrecto
    }

    if (!preg_match('/[A-Z]{1}[A-Za-z0-9\W]{8,12}/', $clave)){
        // La "clave" es incorrecta
    }
    
	
    
    
    $consulta = "SELECT fkidRol FROM tbl_usuarios WHERE usuario='$usuario' AND contraseña = '$clave';";
    $resultado = mysqli_query($conn, $consulta);

    $filas=mysqli_num_rows($resultado);
    if ($filas>0)
    {
        while($filas=$resultado->fetch_array())
        {
            $perfil=$filas['fkidRol'];
        }
        switch ($perfil)
        {
            case 1:
                echo "<script>alert('Bienvenido RESIDENTE al sistema');
                    location.href='../view/residente.php';
                </script>";
            break;
            case 2:
                echo "<script>alert('Bienvenido ADMINISTRADOR al sistema');
                    location.href='../view/resumenDatos.php';
                </script>";
            break;
            case 3:
                echo "<script>alert('Bienvenido VIGILANTE al sistema');
                    location.href='vigilante.html';
                </script>";
            break;
            case 4:
                echo "<script>alert('Bienvenido TODERO al sistema');
                    location.href='todero.html';
                </script>";
            break;
        }
    }
    else
    {
        echo "<script>alert('Nombre de usuario y/o contraseña incorrectos');
                    location.href='../view/ingresar.php';
                </script>";
    }

   
?>