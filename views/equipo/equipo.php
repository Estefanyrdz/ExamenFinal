<?php 
	include ('../../libs/security.php');
    include ('../../libs/adodb5/adodb-pager.inc.php');
    include ('../../libs/adodb5/adodb.inc.php');
    include ('../../models/Conexion.php');
    include ('../../models/Modelo.php');
    include ('../../models/Equipo.php');
    include ('../../controllers/EquipoController.php');
    include ('../../libs/Er.php');
	include ('../layouts/header.php');
	include ('../../libs/Fun.php');
	
	$funciones = new FunErrores();
	
	$equipoC = new EquipoController();
	if(isset($_POST['nombre'])){
		$equipoC->insertaEquipo($_POST, $_FILES);
	}
?>	

<div class=row>
		<div class="col-md-6" id="Formularioequipo">
		
		<?php
		 if($equipoC->muestra_errores){
		 ?>
			 <div class="alert alert-danger">
					<?php
						foreach ($equipoC->errores as $value) {
							echo "<p>$value</p>";
						}
					?>
				</div>
			 <?php
				}
			?>
		 
			<form role="form" id="equipo" action="" method="POST" enctype="multipart/form-data">
				<div class="form-group">
					<label for="nombre">Nombre: </label>
					<input type="text" class="form-control" id="nombre" name="nombre" value="<?php echo $equipoC->get_nombre();?>" placeholder="Nombre del equipo">
				</div>
				<div class="form-group">
					<label for="idpais">Id Pais: </label>
					<?php echo $equipoC->getDropDown ('pais', 'idpais','idpais'); ?>
				</div>
				<div class="form-group">
					<label for="escudo">Escudo: </label>
					<input type="file" id="escudo" name="escudo">
				</div>
				<div>
				<button type="submit" class="btn btn-primary">Guardar</button>
				</div>
				<div class="col-md-6">
					<h4>¿No se encuentra el pais que deseas en la lista?</h4>
					<h4>Ingresalo <a href="pais.php">Aqui<a></h4>
				</div>
			</form>
		</div>
		<div class="col-md-6">
			<h2 class="text-center">Lista equipos</h2>
			<?php $equipoC->show_grid(); ?>
		</div>
		<div class=row>
			
		</div>
</div>
<?php include ('../layouts/footer.php'); ?>