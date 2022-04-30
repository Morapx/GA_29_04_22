<?php

namespace App\Http\Controllers\Api;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;


use App\CapturaEncuesta;
use App\SintomaCaptura;

class CapturasController extends Controller
{
    public function store(Request $request) {
        $respuesta = array();
        $respuesta['exito'] = false;
        
        $nuevaCaptura = new CapturaEncuesta();
        $idTipoUsuario = intval($request->input('id_tipo_usuario'));
        $nuevaCaptura->id_tipo_usuario = 
            $idTipoUsuario;
//4 - Alumno, 5 - Profesor, 6 - Empleado
        if ($idTipoUsuario == 4) {
            $nuevaCaptura->matricula =
                $request->input('matricula');

        } else if ($idTipoUsuario == 5) {
            $nuevaCaptura->numero_profesor =
                $request-> input('numero_profesor');

        
        } else {
            $nuevaCaptura->numero_empleado =
                $request->input('numero_empleados');
        }
        $nuevaCaptura->nombre = 
            $request->input('nombre');
        $nuevaCaptura->correo =
            $request->input('correo');
        $nuevaCaptura->contacto_covid =
            $request->input('contacto_covid');
        $nuevaCaptura->vacunado =
            $request->input('vacunado');

        $nuevaCaptura->cadena_qr = "123456789";

        $sintomas = $request->input('sintomas');

        


        if ($nuevaCaptura->save()) {
            if ($sintomas != NULL && count($sintomas) > 0) {
                foreach($sintomas as $sintoma) {
                        $nuevoSintomaCaptura =
                            new SintomaCaptura();
                            $nuevoSintomaCaptura ->id_sintoma = 
                                $sintoma;
                            $nuevoSintomaCaptura->id_captura =
                                $nuevaCaptura->id;
                            $nuevoSintomaCaptura->save();
                }
            }

            $respuesta['exito'] = true;
            $respuesta['cadena_qr'] =
                $nuevaCaptura->cadena_qr;
        }


        return $respuesta;
    }
}
