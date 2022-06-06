(function () {
    'use strict';

    angular.module(appName)
        .controller('inicioController', inicioController);

    inicioController.$inject = ['$scope', '$http', '$rootScope'];

    function inicioController($scope, $http, $rootScope) {
        var service = $Ex;
        service.Http = $http;
        var vm = this;
        vm.viewDetail = false;
        vm.titulo = Ex.GetResourceValue("Titulo") || '';
        vm.isValid = true;
        vm.principal = [];
        vm.resultado = [];
        vm.usuario = {};
        vm.usuario.EsAprobador = EsAprobadorInfo;
        vm.usuario.EsCaptura = EsCapturaInfo;
        vm.usuario.Loggeado = LoggeadoInfo;
        vm.evidenciaAbierta = false;
        vm.rojo = 0;
        vm.amarillo = 0;
        vm.verde = 0;

        


        var date = new Date();
        var dd = date.getDate();
        var mm = date.getMonth();
        var aaaa = date.getFullYear();        
        vm.diaHoy = new Date(aaaa, mm, dd);


        $scope.fileOptionsDetalle = {
            url: "../Codes/UploadFile.ashx",
            autoUpload: true,
            validExtensions: Ex.GetResourceValue('validExtensions'),
            maxFilesize: Ex.GetResourceValue('maxFileSize'),
            puedeEliminar: vm.usuario.EsCaptura ? true : false
        };


        $scope.fileParameters = { Folder: Ex.GetResourceValue("folderArchivos") };



        $scope.openDocumento = function (info, num) {
            try {

                if (num == 1) {
                    info.NombreArchivoNuevo = info.na_punto_quiebre;
                    info.RutaArchivo = info.ra_punto_quiebre;
                } else if (num == 2) {
                    info.NombreArchivoNuevo = info.na_causa_raiz;
                    info.RutaArchivo = info.ra_causa_raiz;
                } else if (num == 3) {
                    info.NombreArchivoNuevo = info.na_acciones_correctivas;
                    info.RutaArchivo = info.ra_acciones_correctivas;
                } else if (num == 4) {
                    info.NombreArchivoNuevo = info.na_quality_focus;
                    info.RutaArchivo = info.ra_quality_focus;
                } else if (num == 5) {
                    info.NombreArchivoNuevo = info.na_deteccion;
                    info.RutaArchivo = info.ra_deteccion;
                } else if (num == 6) {
                    info.NombreArchivoNuevo = info.na_auditoria_capas;
                    info.RutaArchivo = info.ra_auditoria_capas;
                } else if (num == 7) {
                    info.NombreArchivoNuevo = info.na_validacion_acciones;
                    info.RutaArchivo = info.ra_validacion_acciones;
                } else if (num == 8) {
                    info.NombreArchivoNuevo = info.na_plan_control;
                    info.RutaArchivo = info.ra_plan_control;
                } else if (num == 9) {
                    info.NombreArchivoNuevo = info.na_actualizacion_hioe;
                    info.RutaArchivo = info.ra_actualizacion_hioe;
                } else if (num == 10) {
                    info.NombreArchivoNuevo = info.na_lecciones_aprendidas;
                    info.RutaArchivo = info.ra_lecciones_aprendidas;
                }


                vm.evidenciaAbierta = true;

                document.body.style.cursor = 'wait';
                var url = '../Documentos/' + $scope.fileParameters.Folder + '/' + info.RutaArchivo + '?' + $scope.numeroAleatorio(1, 1000);
                window.open(url);
                document.body.style.cursor = '';
                return false;

            //    $Ex.Execute("OpenDocumento", info, function (response, isInvalid) {
            //        if (response.d) {
            //            window.location = "DownLoadPage.aspx?d=" + getRandom();
            //        }
            //        else {
            //            Ex.mensajes(Ex.GetResourceValue("msgArchivoNoEncontrado"));
            //        }
            //    });
            } catch (ex) {
                Ex.mensajes(ex.message, 4);
            }
        };

        $scope.numeroAleatorio = function (min, max) {
            return Math.round(Math.random() * (max - min) + min);
        }


        $scope.setParametrosArchivo = function (response, item, num) {

            if (num == 1) {
                item.UID_punto_quiebre = response.UID;
                item.ra_punto_quiebre = response.NombreArchivo;
                item.EsArchivoNuevo_punto_quiebre = response.EsNuevo;
            } else if (num == 2) {
                item.UID_causa_raiz = response.UID;
                item.ra_causa_raiz = response.NombreArchivo;
                item.EsArchivoNuevo_causa_raiz = response.EsNuevo;
            } else if (num == 3) {
                item.UID_acciones_correctivas = response.UID;
                item.ra_acciones_correctivas = response.NombreArchivo;
                item.EsArchivoNuevo_acciones_correctivas = response.EsNuevo;
            } else if (num == 4) {
                item.UID_quality_focus = response.UID;
                item.ra_quality_focus = response.NombreArchivo;
                item.EsArchivoNuevo_quality_focus = response.EsNuevo;
            } else if (num == 5) {
                item.UID_deteccion = response.UID;
                item.ra_deteccion = response.NombreArchivo;
                item.EsArchivoNuevo_deteccion = response.EsNuevo;
            } else if (num == 6) {
                item.UID_auditoria_capas = response.UID;
                item.ra_auditoria_capas = response.NombreArchivo;
                item.EsArchivoNuevo_auditoria_capas = response.EsNuevo;
            } else if (num == 7) {
                item.UID_validacion_acciones = response.UID;
                item.ra_validacion_acciones = response.NombreArchivo;
                item.EsArchivoNuevo_validacion_acciones = response.EsNuevo;
            } else if (num == 8) {
                item.UID_plan_control = response.UID;
                item.ra_plan_control = response.NombreArchivo;
                item.EsArchivoNuevo_plan_control = response.EsNuevo;
            } else if (num == 9) {
                item.UID_actualizacion_hioe = response.UID;
                item.ra_actualizacion_hioe = response.NombreArchivo;
                item.EsArchivoNuevo_actualizacion_hioe = response.EsNuevo;
            } else if (num == 10) {
                item.UID_lecciones_aprendidas = response.UID;
                item.ra_lecciones_aprendidas = response.NombreArchivo;
                item.EsArchivoNuevo_lecciones_aprendidas = response.EsNuevo;
            }


        };

        vm.guardar = function () {
            try {
                Ex.load(true);
                var datos = [];
                datos.InformacionPrincipal = vm.principal;
                service.Execute('Guardar', datos, function (response) {
                    if (response.d) {
                        Ex.mensajes('Se guardó con exito!', 1);
                        vm.consultar();
                    }
                    Ex.load(false)
                })
            }
            catch (ex) {
                Ex.mensajes(ex.message, 4);
                Ex.load(false);
            }
        }


        vm.consultar = function () {
            try {
                Ex.load(true);
                var datos = {};
                service.Execute('GetInformacion', datos, function (response) {
                    if (response.d) {
                        vm.principal = response.d.InformacionPrincipal;
                        vm.resultado = response.d.Resultado;
                        vm.principal_ = angular.copy(vm.principal);

                        var rojo = _.filter(vm.resultado, { 'estatus_global': 'fondo_rojo' })
                        vm.rojo = rojo.length;

                        var amarillo = _.filter(vm.resultado, { 'estatus_global': 'fondo_amarillo' })
                        vm.amarillo = amarillo.length;

                        var verde = _.filter(vm.resultado, { 'estatus_global': 'fondo_verde' })
                        vm.verde = verde.length;

                    }
                    Ex.load(false)
                })
            }
            catch (ex) {
                Ex.mensajes(ex.message, 4);
                Ex.load(false);
            }
        }

        vm.aprobar = function (accionAprobador, item, num) {
            try {


                // var esRechazar = accionAprobador !== "Aprobar";

                if (vm.evidenciaAbierta) {
                    var mensaje = Ex.GetResourceValue('msgConfirmar' + accionAprobador);

                    //if (esRechazar && !$scope.notaCredito.Comentario) {
                    //    $scope.comentarioRequerido = true;
                    //    Ex.mensajes(Ex.GetResourceValue(esRechazar ? "msgComentarioRequerdio" : "msgMotivoNotaRequerdio"));
                    //} else {
                    Ex.mensajes(mensaje, 2, null, null, null, function () {
                        if (num == 1) {
                            item.es_punto_quiebre = accionAprobador;
                        } else if (num == 2) {
                            item.es_causa_raiz = accionAprobador;
                        } else if (num == 3) {
                            item.es_acciones_correctivas = accionAprobador;
                        } else if (num == 4) {
                            item.es_quality_focus = accionAprobador;
                        } else if (num == 5) {
                            item.es_deteccion = accionAprobador;
                        } else if (num == 6) {
                            item.es_auditoria_capas = accionAprobador;
                        } else if (num == 7) {
                            item.es_validacion_acciones = accionAprobador;
                        } else if (num == 8) {
                            item.es_plan_control = accionAprobador;
                        } else if (num == 9) {
                            item.es_actualizacion_hioe = accionAprobador;
                        } else if (num == 10) {
                            item.es_lecciones_aprendidas = accionAprobador;
                        }
                        $Ex.Execute("AprobarRechazar", item, function (response, isInvalid) {
                            vm.consultar();
                            if (response.d.hasOwnProperty("ErrorParaUsuario")) {
                                Ex.mensajes(response.d.ErrorParaUsuario);
                                console.log(response.d.ErrorParaTi);
                            }
                        });
                    }, function () { }, null);
                    //}
                }
                else {
                    Ex.mensajes(Ex.GetResourceValue("msgAbrirEvidencia"));
                }
            } catch (ex) {
                Ex.mensajes(ex.message, 4);
            }
        }

        var init = function () {
            vm.consultar();
        }


        init();


    }
})();