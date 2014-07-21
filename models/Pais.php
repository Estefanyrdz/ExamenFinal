<?php

class Pais extends Modelo{
    public $nombre_tabla = 'pais';
    public $pk = 'idpais';
    
    
    public $atributos = array(
        'nombre'=>array(),
        'idcontinente'=>array(),
        'bandera'=>array(),        
    );
    
    public $errores = array( );
    
    private $nombre;
    private $idcontinente;
    private $bandera;
       
    
    function Pais(){
        parent::Modelo();
    }
    
    public function get_atributos(){
        $rs = array();
        foreach ($this->atributos as $key => $value) {
            $rs[$key]=$this->$key;
        }
        return $rs;
    }
    
    
    public function get_nombre(){
        return $this->nombre;
    } 

    public function set_nombre($valor){

        $er = new Er();
        
        if ( !$er->valida_nombre($valor) ){
            $this->errores[] = "Este nombre (".$valor.") no es valido";
        }

        $this->nombre = trim($valor);
    }

    public function get_idcontinente(){
        return $this->idcontinente;
    } 

    public function set_idcontinente($valor){

        $er = new Er();
        
        if ( !$er->valida_numero($valor) ){
            $this->errores[] = "Este valor (".$valor.") no es valido";
        }

        $this->idcontinente = trim($valor);
    }
     public function get_bandera(){
        return $this->foto;
    } 

    public function set_bandera($valor){

        $er = new Er();
        
        if ( !$er->valida_imagen($valor['name']) ){
            $this->errores[] = "Este foto (".$valor['name'].") no es valido";
        }
         //agregar funcion para validar tipo y tamaño del archivo
        $this->bandera = trim($valor['name']);
    }


}

?>
