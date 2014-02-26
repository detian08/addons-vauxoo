<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<html>
<head>
    <style type="text/css">
        ${css}
    </style>
</head>
<body>
    %for o in objects :
        ${set_global_data(o)}
        <% dict_data = set_dict_data(o) %>
        <table class="basic_table">
            <tr>
                <td style="vertical-align: top;">
                    ${helper.embed_image('jpeg',str(o.company_id.logo),180, 85)}
                </td>
                <td>
                    <table class="basic_table">
                        <tr>
                            <td width='50%'>
                                <div class="title">${o.company_id.address_invoice_parent_company_id.name or ''|entity}</div>
                            </td>
                            <td width='20%'>
                                %if dict_data['@tipoDeComprobante'] == 'ingreso':
                                    <div class="invoice">${_("Factura:")}
                                %elif dict_data['@tipoDeComprobante'] == 'egreso':
                                    <div class="refund">${_("NOTA DE CREDITO:")}
                                %endif
                            </td>
                        </tr>
                        <tr>
                            <td class="td_data_exp">
                                <div class="emitter">
                                    <br/>${ dict_data['Emisor']['DomicilioFiscal']['@calle'] or ''|entity}
                                    ${ dict_data['Emisor']['DomicilioFiscal']['@noExterior'] or ''|entity}
                                    ${ dict_data['Emisor']['DomicilioFiscal']['@noInterior'] or ''|entity}
                                    ${ dict_data['Emisor']['DomicilioFiscal']['@colonia'] or ''|entity}
                                    ${ dict_data['Emisor']['DomicilioFiscal']['@codigoPostal'] or ''|entity}
                                    <br/>${ _("Localidad:")} ${ dict_data['Emisor']['DomicilioFiscal']['@localidad'] or ''|entity}                                    
                                    <br/>${ dict_data['Emisor']['DomicilioFiscal']['@municipio'] or ''|entity}                                    
                                    , ${ dict_data['Emisor']['DomicilioFiscal']['@estado'] or ''|entity}                                    
                                    , ${ dict_data['Emisor']['DomicilioFiscal']['@pais'] or ''|entity}
                                    <br/><b>${_("RFC:")} ${dict_data['Emisor']['@rfc'] or ''|entity}</b>
                                    <br/>${ dict_data['Emisor']['RegimenFiscal']['@Regimen'] or ''|entity }
                                 </div>
                            </td>
                            <td class="td_data_exp">
                                <div class="fiscal_address">
                                    <br/>Expedido en:
                                        <br/>${ dict_data['Emisor']['ExpedidoEn']['@calle'] or ''|entity}
                                        ${ dict_data['Emisor']['ExpedidoEn']['@noExterior'] or ''|entity}
                                        ${ dict_data['Emisor']['ExpedidoEn']['@noInterior'] or ''|entity}
                                        ${ dict_data['Emisor']['ExpedidoEn']['@colonia'] or ''|entity}
                                        ${ dict_data['Emisor']['ExpedidoEn']['@codigoPostal'] or ''|entity}
                                        <br/>Localidad: ${ dict_data['Emisor']['ExpedidoEn']['@localidad'] or ''|entity}
                                        <br/>${ dict_data['Emisor']['ExpedidoEn']['@municipio'] or ''|entity}
                                        ${ dict_data['Emisor']['ExpedidoEn']['@estado'] or ''|entity}
                                        ${ dict_data['Emisor']['ExpedidoEn']['@pais'] or ''|entity}
                                <div/>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>        
        <table class="line" width="100%" border="1"></table>
        <table class="basic_table" style="font-size:11;">
            <tr>
                <td width="80%">
                    <table class="basic_table">
                        <tr>
                            <td class="cliente"><b>Receptor:</b></td>
                            <td width="64%" class="cliente">${ dict_data['Receptor']['@nombre'] or ''|entity}</td>
                            <td class="cliente"><b>R. F. C.:</b></td>
                            <td width="16%" class="cliente"><b>${ dict_data['Receptor']['@rfc'] or ''|entity}</b></td>
                        </tr>
                    </table>
                    <table class="basic_table">
                        <tr>
                            <td width="7%" class="cliente"><b>Calle:</b></td>
                            <td class="cliente">${ dict_data['Receptor']['Domicilio']['@calle'] or ''|entity}</td>
                            <td width="9%" class="cliente"><b>No. Ext:</b></td>
                            <td width="9%" class="cliente">${ dict_data['Receptor']['Domicilio']['@noExterior'] or ''|entity}</td>
                            <td width="9%" class="cliente"><b>No. Int:</b></td>
                            <td width="9%" class="cliente">${ dict_data['Receptor']['Domicilio']['@noInterior'] or ''|entity}</td>
                        </tr>
                    </table>
                    <table class="basic_table">
                        <tr>
                            <td width="10%" class="cliente"><b>Colonia:</b></td>
                            <td class="cliente">${ dict_data['Receptor']['Domicilio']['@colonia'] or ''|entity}</td>
                            <td width="7%" class="cliente"><b>C.P.:</b></td>
                            <td class="cliente">${ dict_data['Receptor']['Domicilio']['@codigoPostal'] or ''|entity}</td>
                            <td width="12%" class="cliente"><b>Localidad:</b></td>
                            <td class="cliente">${ dict_data['Receptor']['Domicilio']['@localidad'] or ''|entity}</td>
                        </tr>
                    </table>
                    <table class="basic_table" style="border-bottom:1px solid #002966;">
                        <tr>
                            <td width="9%" class="cliente"><b>Lugar:</b></td>
                            <td class="cliente">
                                ${ dict_data['Receptor']['Domicilio']['@municipio'] or ''|entity},
                                ${ dict_data['Receptor']['Domicilio']['@estado'] or ''|entity},
                                ${ dict_data['Receptor']['Domicilio']['@pais'] or ''|entity}
                            </td>
                        </tr>
                    </table>
                </td>
                <td width="1%"></td>
                <td width="19%" align="center">
                    ${ dict_data['@LugarExpedicion'] or ''|entity}
                    <% from datetime import datetime %>
                    <br/>${_("a")} ${datetime.strptime(dict_data['@fecha'].encode('ascii','replace'), '%Y-%m-%dT%H:%M:%S').strftime('%d/%m/%Y %H:%M:%S') or ''|entity}
                    <br/>${_("Serie:")} ${ dict_data['@serie'] or _("Sin serie")|entity}
                </td>
            </tr>
        </table>
        <br/>   
        <table class="basic_table" style="color:#121212">
            <tr class="firstrow">
                <th width="10%">${_("Cant.")}</th>
                <th width="10%">${_("Unidad")}</th>
                <th>${_("Descripci&oacute;n")}</th>
                <th width="9%" >${_("P.Unitario")}</th>
                <th width="15%">${_("Importe")}</th>
            </tr>
            <%row_count = 1%>
            %for dict in range(0,len(dict_data['Conceptos']['Concepto'])):
                %if (row_count%2==0):
                    <tr  class="nonrow">
                %else:
                    <tr>
                %endif
                    <td width="10%" class="number_td"><% qty = dict_data['Conceptos']['Concepto'][dict]['@cantidad'] %>${ qty or '0.0'}</td>
                    <td width="10%" class="basic_td"><% uni = dict_data['Conceptos']['Concepto'][dict]['@unidad'] %>${ uni or '0.0'}</td>
                    <td class="basic_td"><% desc = dict_data['Conceptos']['Concepto'][dict]['@descripcion'] %>${ desc or '0.0'}</td>
                    <td width="9%" class="number_td"><% vuni = dict_data['Conceptos']['Concepto'][dict]['@valorUnitario'] %>${ vuni or '0.0'}</td>
                    <td width="15%" class="number_td"><% imp = dict_data['Conceptos']['Concepto'][dict]['@importe'] %>${ imp or '0.0'}</td>
                </tr>
                <%row_count+=1%>
            %endfor
        </table>
        <table align="right" width="30%" style="border-collapse:collapse">
            <tr>
                <td class="total_td">${_("Sub Total:")}</td>
                <td align="right" class="total_td">$ ${ dict_data['@subTotal'] or ''|entity}</td>
            </tr>
            %for imp in range(0,len(dict_data['Impuestos']['Traslados']['Traslado'])):
            <tr>
                <td class="tax_td"><% imp_name = dict_data['Impuestos']['Traslados']['Traslado'][imp]['@impuesto'] %>
                                    <% tasa = dict_data['Impuestos']['Traslados']['Traslado'][imp]['@tasa'] %>
                                    <% text = imp_name+' ('+tasa+') %' %>${ text or '0.0'}</td>
                <td class="tax_td" align="right"><% importe = dict_data['Impuestos']['Traslados']['Traslado'][imp]['@importe'] %>${importe or ''|entity}</td>
            </tr>
            %endfor       
            <tr align="left">
                <td class="total_td"><b>${_("Total:")}</b></td>
                <td class="total_td" align="right"><b>$ ${ dict_data['@total'] or ''|entity}</b></td>
            </tr>
        </table>
        <br clear="all" />
        <table class="basic_table">
            <tr>
                <td class="tax_td">
                    ${_("IMPORTE CON LETRA:")}
                </td>
            </tr>
            <tr>
                <td class="center_td">
                    <i>${'AGREGAR IMPORTE EN LETRAS' or ''|entity}</i>
                </td>
            </tr>
            <tr>
                <td class="center_td">
                    ${_('PAGO EN UNA SOLA EXHIBICI&Oacute;N - EFECTOS FISCALES AL PAGO')}
                </td>
            </tr>            
        </table>
        <table class="basic_table" rules="cols" style="border:1.5px solid grey;">
                <tr>
                    <th width="33%"> ${_('Certificado del SAT')}</th>
                    <th> ${_('Fecha de Timbrado')}</th>
                    <th width="33%"> ${_('Folio Fiscal')}</th>
                </tr>
                <tr>
                    <td width="33%" class="center_td"> ${ dict_data['Complemento']['TimbreFiscalDigital']['@noCertificadoSAT'] or 'No identificado'|entity }</td>
                    <td width="34%" class="center_td"> ${ datetime.strptime(dict_data['Complemento']['TimbreFiscalDigital']['@FechaTimbrado'].encode('ascii','replace'), '%Y-%m-%dT%H:%M:%S').strftime('%d/%m/%Y %H:%M:%S') or 'No identificado'|entity }</td>
                    <td width="33%" class="center_td"> ${ dict_data['Complemento']['TimbreFiscalDigital']['@UUID'] or 'No identificado'|entity }</td>
                </tr>
        </table>
        <table class="basic_table" rules="cols" style="border:1.5px solid grey;">
                <tr>
                    <th width="33%">${_('Certificado del emisor')}</th>
                    <th width="34%">${_('M&eacute;todo de Pago')}</th>
                    <th width="33%">${_('&Uacute;ltimos 4 d&iacute;gitos de la cuenta bancaria')}</th>
                </tr>
                <tr>
                    <td class="center_td">${ dict_data['@noCertificado'] or 'No identificado'|entity }</td>
                    <td class="center_td">${ dict_data['@metodoDePago'] or 'No identificado'|entity }</td>
                    <td class="center_td">${ dict_data['@NumCtaPago'] or 'No identificado'|entity }</td>
                </tr>
        </table>
    <p style="page-break-after:always"></p>
    %endfor
</body>
</html>

