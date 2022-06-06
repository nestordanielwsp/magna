<%@ Page Title="" Language="C#" MasterPageFile="~/includes/magnajs.Master" AutoEventWireup="true" CodeBehind="Inicio.aspx.cs" Inherits="magnajs.Pages.Inicio" %>


<asp:Content ID="Content1" ContentPlaceHolderID="main" runat="server">
    <div class="view dashboard" ng-controller="inicioController as vm">
        <h1>{{vm.titulo}}</h1>
        <div class="row">
            <div class="col-12 col-lg-8 col-md-6"></div>
            <div class="col-12 col-lg-4 col-md-6">
                <div class="summary-boxes" layout="row" layout-align="space-between center">
                    <div class="summary-box summary-amount">
                        <div class="summary-box-main">
                            <div class="summary-value">{{vm.verde}}</div>
                        </div>
                        <div class="summary-box-footer">On Time</div>
                    </div>

                    <div class="summary-box summary-total">
                        <div class="summary-box-main">
                            <div class="summary-value">{{vm.amarillo}}</div>
                        </div>
                        <div class="summary-box-footer">On Going</div>
                    </div>



                    <div class="summary-box summary-pending">
                        <div class="summary-box-main">
                            <div class="summary-value">{{vm.rojo}}</div>
                        </div>
                        <div class="summary-box-footer">Delayed</div>
                    </div>
                </div>
            </div>
        </div>

        <div id="Home" class="mail-box padding-10 wrapper border-bottom">
            <br />
            <div class="md-whiteframe-1dp">
                <h2><%= this.GetMessage("TituloGrid") %></h2>
            </div>
            <div class="content-top clearfix">
                <div class="row">
                    <div class="col-sm-6">
                    </div>
                    <div class="btn-tpm col-sm-6">
                        <div class="padding-7">
                            <div class="btn btn-top" uib-tooltip="<%= this.GetCommonMessage("lblTooltipGuardar") %>" tooltip-placement="bottom" ng-click="vm.guardar()" ng-if="vm.usuario.Loggeado">
                                <i class="fa fa-save"></i>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div ui-table="vm.principal" st-fixed style="width: 100%">
                <table class="jsgrid-table" style="width: 3200px; min-width: 3200px"
                    st-table="vm.principal" st-safe-src="vm.principal_">
                    <thead>
                        <tr>
                            <th colspan="9"></th>
                            <th colspan="10" class="text-center" style="background-color: gainsboro; font-weight: bold;"><%= this.GetMessage("gvGeneral-TiempoObjetivo") %></th>
                            <th></th>
                            <th style="background-color: forestgreen; font-weight: bold;" class="text-center">G</th>
                            <th colspan="2" class="text-center" style="font-weight: bold;"><%= this.GetMessage("gvGeneral-Completo") %></th>
                            <th></th>
                        </tr>
                        <tr>
                            <th colspan="9"></th>
                            <th class="text-center" style="background-color: gainsboro; font-weight: bold;">24H</th>
                            <th class="text-center" style="background-color: gainsboro; font-weight: bold;">7D</th>
                            <th class="text-center" style="background-color: gainsboro; font-weight: bold;" colspan="4">14D</th>
                            <th class="text-center" style="background-color: gainsboro; font-weight: bold;">34D</th>
                            <th class="text-center" style="background-color: gainsboro; font-weight: bold;" colspan="2">35D</th>
                            <th class="text-center" style="background-color: gainsboro; font-weight: bold;">40D</th>
                            <th></th>
                            <th class="text-center" style="font-weight: bold;">N/A</th>
                            <th colspan="2" class="text-center" style="font-weight: bold;"><%= this.GetMessage("gvGeneral-NoAplica") %></th>
                            <th></th>
                        </tr>
                        <tr style="background-color: gainsboro;">
                            <th ui-field width="50" class="text-center" style="font-weight: bold;"><%= this.GetMessage("gvGeneral-Item") %></th>
                            <th ui-field width="50" class="text-center" style="font-weight: bold;"><%= this.GetMessage("gvGeneral-FechaInicio") %></th>
                            <th ui-field width="70" class="text-center" style="font-weight: bold;"><%= this.GetMessage("gvGeneral-ReportadoPor") %></th>
                            <th ui-field width="70" class="text-center" style="font-weight: bold;"><%= this.GetMessage("gvGeneral-QuienRespondio") %></th>
                            <th ui-field width="70" class="text-center" style="font-weight: bold;"><%= this.GetMessage("gvGeneral-TipoReclamo") %></th>
                            <th ui-field width="130" class="text-center" style="font-weight: bold;"><%= this.GetMessage("gvGeneral-Modelo") %></th>
                            <th ui-field width="300" class="text-center" style="font-weight: bold;"><%= this.GetMessage("gvGeneral-DescripcionProblema") %></th>
                            <th ui-field width="50" class="text-center" style="font-weight: bold;"><%= this.GetMessage("gvGeneral->ResponsableRespuesta") %></th>
                            <th ui-field width="50" class="text-center" style="font-weight: bold;"><%= this.GetMessage("gvGeneral-ProximaFecha") %></th>
                            <th ui-field width="70" class="text-center" style="font-weight: bold;"><%= this.GetMessage("gvGeneral-PuntoQuiebre") %></th>
                            <th ui-field width="70" class="text-center" style="font-weight: bold;"><%= this.GetMessage("gvGeneral-CausaRaiz") %></th>
                            <th ui-field width="70" class="text-center" style="font-weight: bold;"><%= this.GetMessage("gvGeneral-AccionesCorrectivas") %></th>
                            <th ui-field width="70" class="text-center" style="font-weight: bold;"><%= this.GetMessage("gvGeneral-QualityFocus") %></th>
                            <th ui-field width="70" class="text-center" style="font-weight: bold;"><%= this.GetMessage("gvGeneral-Deteccion") %></th>
                            <th ui-field width="70" class="text-center" style="font-weight: bold;"><%= this.GetMessage("gvGeneral-AuditoriaCapas") %></th>
                            <th ui-field width="70" class="text-center" style="font-weight: bold;"><%= this.GetMessage("gvGeneral-ValidacionAcciones") %></th>
                            <th ui-field width="70" class="text-center" style="font-weight: bold;"><%= this.GetMessage("gvGeneral-PlanControl") %></th>
                            <th ui-field width="70" class="text-center" style="font-weight: bold;"><%= this.GetMessage("gvGeneral-ActualizacionHIOE") %></th>
                            <th ui-field width="70" class="text-center" style="font-weight: bold;"><%= this.GetMessage("gvGeneral-LeccionesAprendidas") %></th>
                            <th ui-field width="100" class="text-center" style="font-weight: bold;"><%= this.GetMessage("gvGeneral-PlanAccion") %></th>
                            <th ui-field width="50" class="text-center" style="font-weight: bold;"><%= this.GetMessage("gvGeneral-FechaPropuestaCierre") %></th>
                            <th ui-field width="50" class="text-center" style="font-weight: bold;"><%= this.GetMessage("gvGeneral-FechaRealCierre") %></th>
                            <th ui-field width="50" class="text-center" style="font-weight: bold;"><%= this.GetMessage("gvGeneral-EstatusGlobal") %></th>
                            <th ui-field width="100" class="text-center" style="font-weight: bold;"><%= this.GetMessage("gvGeneral-Departamento") %></th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr ng-repeat="item in vm.principal">
                            <td st-ratio="50" class="text-center">{{item.cve}}</td>
                            <td st-ratio="50" class="text-center">{{item.fecha_creacion}}</td>
                            <td st-ratio="70" class="text-center">{{item.identifica_falla}}</td>
                            <td st-ratio="70" class="text-center">{{item.usuario_creacion}}</td>
                            <td st-ratio="70" class="text-center">{{item.nombre_alerta}}</td>
                            <td st-ratio="130" class="text-center">{{item.nombre_numero_parte}}</td>
                            <td st-ratio="300">{{item.descripcion_falla}}</td>
                            <td st-ratio="50" class="text-center">{{item.supervisor_verifico}}</td>
                            <td st-ratio="50" class="text-center">{{item.inicio_campana}}</td>
                            <td st-ratio="70" class="text-center {{item.fd_punto_quiebre}}">
                                <table width="100%">
                                    <tr>
                                        <td width="90%" style="font-weight:600;">{{item.punto_quiebre}}</td>
                                        <td class="text-center" style="padding: 0px 10px 0px 0px;">
                                            <ex-fileupload ng-model="item.na_punto_quiebre" image-button="fa-upload" ng-if="((vm.usuario.Loggeado && vm.usuario.EsAprobador && item.na_punto_quiebre != null) || (vm.usuario.Loggeado && vm.usuario.EsCaptura))"
                                                download-button="fa-paperclip" on-success="setParametrosArchivo(response, item, 1)"
                                                options="fileOptionsDetalle" parameters="fileParameters" open-file="openDocumento(item, 1)">
                                            </ex-fileupload>
                                        </td>
                                    </tr>
                                </table>
                                <table align="center" width="70px">
                                    <tr ng-if="item.es_punto_quiebre != null">
                                        <td width="90%" colspan="2" class="resultado">{{item.es_punto_quiebre}}</td>
                                    </tr>
                                    <tr ng-if="item.es_punto_quiebre == null && vm.usuario.EsAprobador && item.fs_punto_quiebre != null">
                                        <td width="50%" class="text-center">
                                            <div ng-click="vm.aprobar('Aprobado', item, 1)" tooltip-placement="bottom" ng-if="vm.usuario.EsAprobador"
                                                class="btn btn-link" uib-tooltip="<%= this.GetMessage("lblTooltipAprobar") %>">
                                                <i class="fa fa-check"></i>
                                            </div>
                                        </td>
                                        <td width="50%" class="text-center">
                                            <div ng-click="vm.aprobar('Rechazado', item, 1)" tooltip-placement="bottom" ng-if="vm.usuario.EsAprobador"
                                                class="btn btn-link" uib-tooltip="<%= this.GetMessage("lblTooltipRechazar") %>"
                                                style="color: red">
                                                <i class="fa fa-remove"></i>
                                            </div>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            <td st-ratio="70" class="text-center {{item.fd_causa_raiz}}">
                                <table width="100%">
                                    <tr>
                                        <td width="90%" style="font-weight:600;">{{item.causa_raiz}}</td>
                                        <td class="text-center" style="padding: 0px 10px 0px 0px;">
                                            <ex-fileupload ng-model="item.na_causa_raiz" image-button="fa-upload"  ng-if="((vm.usuario.Loggeado && vm.usuario.EsAprobador && item.na_causa_raiz != null) || (vm.usuario.Loggeado && vm.usuario.EsCaptura))"
                                                download-button="fa-paperclip" on-success="setParametrosArchivo(response, item, 2)"
                                                options="fileOptionsDetalle" parameters="fileParameters" open-file="openDocumento(item, 2)">
                                            </ex-fileupload>
                                        </td>
                                    </tr>
                                </table>
                                <table align="center" width="70px">
                                    <tr ng-if="item.es_causa_raiz != null">
                                        <td width="90%" colspan="2" class="resultado">{{item.es_causa_raiz}}</td>
                                    </tr>
                                    <tr ng-if="item.es_causa_raiz == null && vm.usuario.EsAprobador && item.fs_causa_raiz != null">
                                        <td width="50%" class="text-center">
                                            <div ng-click="vm.aprobar('Aprobado', item, 2)" tooltip-placement="bottom" ng-if="vm.usuario.EsAprobador"
                                                class="btn btn-link" uib-tooltip="<%= this.GetMessage("lblTooltipAprobar") %>">
                                                <i class="fa fa-check"></i>
                                            </div>
                                        </td>
                                        <td width="50%" class="text-center">
                                            <div ng-click="vm.aprobar('Rechazado', item, 2)" tooltip-placement="bottom" ng-if="vm.usuario.EsAprobador"
                                                class="btn btn-link" uib-tooltip="<%= this.GetMessage("lblTooltipRechazar") %>"
                                                style="color: red">
                                                <i class="fa fa-remove"></i>
                                            </div>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            <td st-ratio="70" class="text-center {{item.fd_acciones_correctivas}}">
                                <table width="100%">
                                    <tr>
                                        <td width="90%" style="font-weight:600;">{{item.acciones_correctivas}}</td>
                                        <td class="text-center" style="padding: 0px 10px 0px 0px;">
                                            <ex-fileupload ng-model="item.na_acciones_correctivas" image-button="fa-upload" ng-if="((vm.usuario.Loggeado && vm.usuario.EsAprobador && item.na_acciones_correctivas != null) || (vm.usuario.Loggeado && vm.usuario.EsCaptura))"
                                                download-button="fa-paperclip" on-success="setParametrosArchivo(response, item, 3)"
                                                options="fileOptionsDetalle" parameters="fileParameters" open-file="openDocumento(item, 3)">
                                            </ex-fileupload>
                                        </td>
                                    </tr>
                                </table>
                                <table align="center" width="70px">
                                    <tr ng-if="item.es_acciones_correctivas != null">
                                        <td width="90%" colspan="2" class="resultado">{{item.es_acciones_correctivas}}</td>
                                    </tr>
                                    <tr ng-if="item.es_acciones_correctivas == null && vm.usuario.EsAprobador && item.fs_acciones_correctivas != null">
                                        <td width="50%" class="text-center">
                                            <div ng-click="vm.aprobar('Aprobado', item, 3)" tooltip-placement="bottom" ng-if="vm.usuario.EsAprobador"
                                                class="btn btn-link" uib-tooltip="<%= this.GetMessage("lblTooltipAprobar") %>">
                                                <i class="fa fa-check"></i>
                                            </div>
                                        </td>
                                        <td width="50%" class="text-center">
                                            <div ng-click="vm.aprobar('Rechazado', item, 3)" tooltip-placement="bottom" ng-if="vm.usuario.EsAprobador"
                                                class="btn btn-link" uib-tooltip="<%= this.GetMessage("lblTooltipRechazar") %>"
                                                style="color: red">
                                                <i class="fa fa-remove"></i>
                                            </div>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            <td st-ratio="70" class="text-center {{item.fd_quality_focus}}">
                                <table width="100%">
                                    <tr>
                                        <td width="90%" style="font-weight:600;">{{item.quality_focus}}</td>
                                        <td class="text-center" style="padding: 0px 10px 0px 0px;">
                                            <ex-fileupload ng-model="item.na_quality_focus" image-button="fa-upload" ng-if="((vm.usuario.Loggeado && vm.usuario.EsAprobador && item.na_quality_focus != null) || (vm.usuario.Loggeado && vm.usuario.EsCaptura))"
                                                download-button="fa-paperclip" on-success="setParametrosArchivo(response, item, 4)"
                                                options="fileOptionsDetalle" parameters="fileParameters" open-file="openDocumento(item, 4)">
                                            </ex-fileupload>
                                        </td>
                                    </tr>
                                </table>
                                <table align="center" width="70px">
                                    <tr ng-if="item.es_quality_focus != null">
                                        <td width="90%" colspan="2" class="resultado">{{item.es_quality_focus}}</td>
                                    </tr>
                                    <tr ng-if="item.es_quality_focus == null && vm.usuario.EsAprobador && item.fs_quality_focus != null">
                                        <td width="50%" class="text-center">
                                            <div ng-click="vm.aprobar('Aprobado', item, 4)" tooltip-placement="bottom" ng-if="vm.usuario.EsAprobador"
                                                class="btn btn-link" uib-tooltip="<%= this.GetMessage("lblTooltipAprobar") %>">
                                                <i class="fa fa-check"></i>
                                            </div>
                                        </td>
                                        <td width="50%" class="text-center">
                                            <div ng-click="vm.aprobar('Rechazado', item, 4)" tooltip-placement="bottom" ng-if="vm.usuario.EsAprobador"
                                                class="btn btn-link" uib-tooltip="<%= this.GetMessage("lblTooltipRechazar") %>"
                                                style="color: red">
                                                <i class="fa fa-remove"></i>
                                            </div>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            <td st-ratio="70" class="text-center {{item.fd_deteccion}}">
                                <table width="100%">
                                    <tr>
                                        <td width="90%" style="font-weight:600;">{{item.deteccion}}</td>
                                        <td class="text-center" style="padding: 0px 10px 0px 0px;">
                                            <ex-fileupload ng-model="item.na_deteccion" image-button="fa-upload" ng-if="((vm.usuario.Loggeado && vm.usuario.EsAprobador && item.na_deteccion != null) || (vm.usuario.Loggeado && vm.usuario.EsCaptura))"
                                                download-button="fa-paperclip" on-success="setParametrosArchivo(response, item, 5)"
                                                options="fileOptionsDetalle" parameters="fileParameters" open-file="openDocumento(item, 5)">
                                            </ex-fileupload>
                                        </td>
                                    </tr>
                                </table>
                                <table align="center" width="70px">
                                    <tr ng-if="item.es_deteccion != null">
                                        <td width="90%" colspan="2" class="resultado">{{item.es_deteccion}}</td>
                                    </tr>
                                    <tr ng-if="item.es_deteccion == null && vm.usuario.EsAprobador && item.fs_deteccion != null">
                                        <td width="50%" class="text-center">
                                            <div ng-click="vm.aprobar('Aprobado', item, 5)" tooltip-placement="bottom" ng-if="vm.usuario.EsAprobador"
                                                class="btn btn-link" uib-tooltip="<%= this.GetMessage("lblTooltipAprobar") %>">
                                                <i class="fa fa-check"></i>
                                            </div>
                                        </td>
                                        <td width="50%" class="text-center">
                                            <div ng-click="vm.aprobar('Rechazado', item, 5)" tooltip-placement="bottom" ng-if="vm.usuario.EsAprobador"
                                                class="btn btn-link" uib-tooltip="<%= this.GetMessage("lblTooltipRechazar") %>"
                                                style="color: red">
                                                <i class="fa fa-remove"></i>
                                            </div>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            <td st-ratio="70" class="text-center {{item.fd_auditoria_capas}}">
                                <table width="100%">
                                    <tr>
                                        <td width="90%" style="font-weight:600;">{{item.auditoria_capas}}</td>
                                        <td class="text-center" style="padding: 0px 10px 0px 0px;">
                                            <ex-fileupload ng-model="item.na_auditoria_capas" image-button="fa-upload" ng-if="((vm.usuario.Loggeado && vm.usuario.EsAprobador && item.na_auditoria_capas != null) || (vm.usuario.Loggeado && vm.usuario.EsCaptura))"
                                                download-button="fa-paperclip" on-success="setParametrosArchivo(response, item, 6)"
                                                options="fileOptionsDetalle" parameters="fileParameters" open-file="openDocumento(item, 6)">
                                            </ex-fileupload>
                                        </td>
                                    </tr>
                                </table>
                                <table align="center" width="70px">
                                    <tr ng-if="item.es_auditoria_capas != null">
                                        <td width="90%" colspan="2" class="resultado">{{item.es_auditoria_capas}}</td>
                                    </tr>
                                    <tr ng-if="item.es_auditoria_capas == null && vm.usuario.EsAprobador && item.fs_auditoria_capas != null">
                                        <td width="50%" class="text-center">
                                            <div ng-click="vm.aprobar('Aprobado', item, 6)" tooltip-placement="bottom" ng-if="vm.usuario.EsAprobador"
                                                class="btn btn-link" uib-tooltip="<%= this.GetMessage("lblTooltipAprobar") %>">
                                                <i class="fa fa-check"></i>
                                            </div>
                                        </td>
                                        <td width="50%" class="text-center">
                                            <div ng-click="vm.aprobar('Rechazado', item, 6)" tooltip-placement="bottom" ng-if="vm.usuario.EsAprobador"
                                                class="btn btn-link" uib-tooltip="<%= this.GetMessage("lblTooltipRechazar") %>"
                                                style="color: red">
                                                <i class="fa fa-remove"></i>
                                            </div>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            <td st-ratio="70" class="text-center {{item.fd_validacion_acciones}}">
                                <table width="100%">
                                    <tr>
                                        <td width="90%" style="font-weight:600;">{{item.validacion_acciones}}</td>
                                        <td class="text-center" style="padding: 0px 10px 0px 0px;">
                                            <ex-fileupload ng-model="item.na_validacion_acciones" image-button="fa-upload" ng-if="((vm.usuario.Loggeado && vm.usuario.EsAprobador && item.na_validacion_acciones != null) || (vm.usuario.Loggeado && vm.usuario.EsCaptura))"
                                                download-button="fa-paperclip" on-success="setParametrosArchivo(response, item, 7)"
                                                options="fileOptionsDetalle" parameters="fileParameters" open-file="openDocumento(item, 7)">
                                            </ex-fileupload>
                                        </td>
                                    </tr>
                                </table>
                                <table align="center" width="70px">
                                    <tr ng-if="item.es_validacion_acciones != null">
                                        <td width="90%" colspan="2" class="resultado">{{item.es_validacion_acciones}}</td>
                                    </tr>
                                    <tr ng-if="item.es_validacion_acciones == null && vm.usuario.EsAprobador && item.fs_validacion_acciones != null">
                                        <td width="50%" class="text-center">
                                            <div ng-click="vm.aprobar('Aprobado', item, 7)" tooltip-placement="bottom" ng-if="vm.usuario.EsAprobador"
                                                class="btn btn-link" uib-tooltip="<%= this.GetMessage("lblTooltipAprobar") %>">
                                                <i class="fa fa-check"></i>
                                            </div>
                                        </td>
                                        <td width="50%" class="text-center">
                                            <div ng-click="vm.aprobar('Rechazado', item, 7)" tooltip-placement="bottom" ng-if="vm.usuario.EsAprobador"
                                                class="btn btn-link" uib-tooltip="<%= this.GetMessage("lblTooltipRechazar") %>"
                                                style="color: red">
                                                <i class="fa fa-remove"></i>
                                            </div>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            <td st-ratio="70" class="text-center {{item.fd_plan_control}}">
                                <table width="100%">
                                    <tr>
                                        <td width="90%" style="font-weight:600;">{{item.plan_control}}</td>
                                        <td class="text-center" style="padding: 0px 10px 0px 0px;">
                                            <ex-fileupload ng-model="item.na_plan_control" image-button="fa-upload" ng-if="((vm.usuario.Loggeado && vm.usuario.EsAprobador && item.na_plan_control != null) || (vm.usuario.Loggeado && vm.usuario.EsCaptura))"
                                                download-button="fa-paperclip" on-success="setParametrosArchivo(response, item, 8)"
                                                options="fileOptionsDetalle" parameters="fileParameters" open-file="openDocumento(item, 8)">
                                            </ex-fileupload>
                                        </td>
                                    </tr>
                                </table>
                                <table align="center" width="70px">
                                    <tr ng-if="item.es_plan_control != null">
                                        <td width="90%" colspan="2" class="resultado">{{item.es_plan_control}}</td>
                                    </tr>
                                    <tr ng-if="item.es_plan_control == null && vm.usuario.EsAprobador && item.fs_plan_control != null">
                                        <td width="50%" class="text-center">
                                            <div ng-click="vm.aprobar('Aprobado', item, 8)" tooltip-placement="bottom" ng-if="vm.usuario.EsAprobador"
                                                class="btn btn-link" uib-tooltip="<%= this.GetMessage("lblTooltipAprobar") %>">
                                                <i class="fa fa-check"></i>
                                            </div>
                                        </td>
                                        <td width="50%" class="text-center">
                                            <div ng-click="vm.aprobar('Rechazado', item, 8)" tooltip-placement="bottom" ng-if="vm.usuario.EsAprobador"
                                                class="btn btn-link" uib-tooltip="<%= this.GetMessage("lblTooltipRechazar") %>"
                                                style="color: red">
                                                <i class="fa fa-remove"></i>
                                            </div>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            <td st-ratio="70" class="text-center {{item.fd_actualizacion_hioe}}">
                                <table width="100%">
                                    <tr>
                                        <td width="90%" style="font-weight:600;">{{item.actualizacion_hioe}}</td>
                                        <td class="text-center" style="padding: 0px 10px 0px 0px;">
                                            <ex-fileupload ng-model="item.na_actualizacion_hioe" image-button="fa-upload" ng-if="((vm.usuario.Loggeado && vm.usuario.EsAprobador && item.na_actualizacion_hioe != null) || (vm.usuario.Loggeado && vm.usuario.EsCaptura))"
                                                download-button="fa-paperclip" on-success="setParametrosArchivo(response, item, 9)"
                                                options="fileOptionsDetalle" parameters="fileParameters" open-file="openDocumento(item, 9)">
                                            </ex-fileupload>
                                        </td>
                                    </tr>
                                </table>
                                <table align="center" width="70px">
                                    <tr ng-if="item.es_actualizacion_hioe != null">
                                        <td width="90%" colspan="2" class="resultado">{{item.es_actualizacion_hioe}}</td>
                                    </tr>
                                    <tr ng-if="item.es_actualizacion_hioe == null && vm.usuario.EsAprobador && item.fs_actualizacion_hioe != null">
                                        <td width="50%" class="text-center">
                                            <div ng-click="vm.aprobar('Aprobado', item, 9)" tooltip-placement="bottom" ng-if="vm.usuario.EsAprobador"
                                                class="btn btn-link" uib-tooltip="<%= this.GetMessage("lblTooltipAprobar") %>">
                                                <i class="fa fa-check"></i>
                                            </div>
                                        </td>
                                        <td width="50%" class="text-center">
                                            <div ng-click="vm.aprobar('Rechazado', item, 9)" tooltip-placement="bottom" ng-if="vm.usuario.EsAprobador"
                                                class="btn btn-link" uib-tooltip="<%= this.GetMessage("lblTooltipRechazar") %>"
                                                style="color: red">
                                                <i class="fa fa-remove"></i>
                                            </div>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            <td st-ratio="70" class="text-center {{item.fd_lecciones_aprendidas}}">
                                <table width="100%">
                                    <tr>
                                        <td width="90%" style="font-weight:600;">{{item.lecciones_aprendidas}}</td>
                                        <td class="text-center" style="padding: 0px 10px 0px 0px;">
                                            <ex-fileupload ng-model="item.na_lecciones_aprendidas" image-button="fa-upload" ng-if="((vm.usuario.Loggeado && vm.usuario.EsAprobador && item.na_lecciones_aprendidase != null) || (vm.usuario.Loggeado && vm.usuario.EsCaptura))"
                                                download-button="fa-paperclip" on-success="setParametrosArchivo(response, item, 10)"
                                                options="fileOptionsDetalle" parameters="fileParameters" open-file="openDocumento(item, 10)">
                                            </ex-fileupload>
                                        </td>
                                    </tr>
                                </table>
                                <table align="center" width="70px">
                                    <tr ng-if="item.es_lecciones_aprendidas != null">
                                        <td width="90%" colspan="2" class="resultado">{{item.es_lecciones_aprendidas}}</td>
                                    </tr>
                                    <tr ng-if="item.es_lecciones_aprendidas == null && vm.usuario.EsAprobador && item.fs_lecciones_aprendidas != null">
                                        <td width="50%" class="text-center">
                                            <div ng-click="vm.aprobar('Aprobado', item, 10)" tooltip-placement="bottom" ng-if="vm.usuario.EsAprobador"
                                                class="btn btn-link" uib-tooltip="<%= this.GetMessage("lblTooltipAprobar") %>">
                                                <i class="fa fa-check"></i>
                                            </div>
                                        </td>
                                        <td width="50%" class="text-center">
                                            <div ng-click="vm.aprobar('Rechazado' ,item, 10)" tooltip-placement="bottom" ng-if="vm.usuario.EsAprobador"
                                                class="btn btn-link" uib-tooltip="<%= this.GetMessage("lblTooltipRechazar") %>"
                                                style="color: red">
                                                <i class="fa fa-remove"></i>
                                            </div>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            <td st-ratio="100">{{item.plan_accion}}</td>
                            <td st-ratio="50" class="text-center">{{item.fecha_propuesta_cierre}}</td>
                            <td st-ratio="50" class="text-center">{{item.fecha_real_cierre}}</td>
                            <td st-ratio="50"  class="text-center {{item.estatus_global}}"></td>
                            <td st-ratio="100" class="text-center">{{item.nombre_lugar_falla}}</td>
                        </tr>
                        <tr ng-if="informaciongral.length == 0" class="nodata-row">
                            <td colspan="24" class="text-center">
                                <%=  this.GetCommonMessage("msgGridSinInformacion") %>
                            </td>
                        </tr>
                    </tbody>
                    <tfoot>
                        <tr>
                            <td colspan="18">
                                <div st-pagination="10" st-items-by-page="100" st-template="../templates/pagination.html"></div>
                            </td>
                        </tr>
                    </tfoot>
                </table>
            </div>
        </div>
        <script type="text/javascript" src="../Scripts/pages/inicioController.js?v=1.1<%=DateTime.Now.Millisecond %>"></script>
    </div>
</asp:Content>

