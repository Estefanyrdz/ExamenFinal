<?php  
	include ('../../libs/security.php');
    include ('../../libs/adodb5/adodb-pager.inc.php');
    include ('../../libs/adodb5/adodb.inc.php');
    include ('../../models/Conexion.php');
    include ('../../models/Modelo.php');
    include ('../../models/Pais.php');
    include ('../../controllers/PaisController.php');
    include ('../../libs/Er.php');
	include ('../../libs/Fun.php');
	include ('../layouts/header.php');
	
  $funErrores = new FunErrores();

     $paisC = new PaisController();
  if (isset($_POST['nombre'])) {   
    $paisC->insertaPais($_POST,$_FILES);

  } 
?>
<link href="css/bootstrap.min.css" rel="stylesheet">
 <link rel="shortcut icon" href="../ima/icono.ico">
        <body background="banderas.jpg">

<div class="container">
     <div class="row">
         <div class="col-md-12">
           <h1 class="text-center"> 
            <span class="glyphicon glyphicon-arrow-up"><span> Registro Pais
            </h1>
          </div>
       </div>
       <div class="row">
         <div class="col-md-4"> 
             <form method="POST" id="formulari" role="form" enctype="multipart/form-data">
                <div class="form-group" id="formulario" name="formulario">
                  <label for="nombre">Nombre:</label>
                  <input type="text" class="form-control" id="nombre" name="nombre" placeholder="nombre">
                </div>
                <div class="form-group" id="integer" name="integer">
                  <label for="nombre">ID CONTINENTE:</label>
                  <input type="text" class="form-control" id="idcontinente" name="idcontinente" placeholder="id continente">
                </div>
                      <label for="">Agregar bandera:</label>
                      <input type="file" class="form-control" id="bandera" name="bandera" placeholder="ARTICULO" required>
                       <button type="submit" class="btn btn-primary">Guardar</button>
              </form>
			</div>
		</div>
  </div>

<?