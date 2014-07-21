<?php
 

	class ControllerPais extends Pais{
		
		public $muestra_errores = false;
		function __construct(){
			
		}



        public function insertaPais($datos){
        	echo "<pre>datos:";
        	print_r($datos);
        	echo "</pre>";
        	$equipo = new Pais();
        	$equipo -> set_idpais($datos['idpais']);
        	$equipo -> set_nombre($datos['nombre']);
        	$equipo -> set_bandera($datos['bandera']);
        	if(count($pais->errores)>0){
        		print_r($pais->errores);
        	} 
        	die();
        }


        
		
		public function validaPais($datos){
			$rs = $this->consulta_sql(" select * from pais where nombre = '".$datos['nombre']."'  ");
        	$rows = $rs->GetArray();
        	if(count($rows) > 0){
        		if ($rows['0']['nombre']== md5($datos['nombre'])) {
        			$this->iniciarSesion($rows['0']['nombre'],$rows['0']['nombre']);
        		}else{
		     		$this->muestra_errores = true;
		     		$this->errores[] = 'Password incorrecto';
		     	}
	     	}else{
	     		$this->muestra_errores = true;
	     		$this->errores[] = 'este email no existe';
	     	}

		}

		

	}


?>