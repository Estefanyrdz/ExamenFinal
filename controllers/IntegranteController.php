<?php
	class IntegranteController extends Integrante{
		
		public $muestra_errores = false;
		function __construct(){
			 parent::Integrante();
		}
		public function insertaIntegrante($datos){
		
			//$int = new Integrante();
			$this->set_nombre($datos['nombre']); 
		    $this->set_idequipo($datos['idequipo']); 
		    $this->set_apellido($datos['apellido']); 
		    $this->set_peso($datos['peso']); 
		    $this->set_edad($datos['edad']); 
		    $this->set_estatura($datos['estatura']); 
		  $this->set_foto($_FILES['foto']['name']);
		     move_uploaded_file($_FILES['foto']['tmp_name'],"../img/".$_FILES['foto']['name']);
		   if(count($this->errores)>0){
		   	    $this->muestra_errores=true;
		   }else{
		   	$this->inserta($this->get_atributos()); 
		   }
		  

		}
	}


?>