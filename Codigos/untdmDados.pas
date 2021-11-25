//////////////////////////////////////////////////////////////////////////
// Criacao...........: 08/2008
// Sistema...........: Atena - Automacao Clinica Odontologica
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit untdmDados;

interface

uses
  SysUtils, Classes, DB, IBCustomDataSet, IBDatabase, IBTable, IBSQL,
  IBQuery, DBTables, ELibFnc;

type
  TdmDados = class(TDataModule)
    dsPais: TDataSource;
    dsVisEstado: TDataSource;
    dsVisCidade: TDataSource;
    dsCargo: TDataSource;
    dsFuncionario: TDataSource;
    dsConvenio: TDataSource;
    dsPaciente: TDataSource;
    dsProfissional: TDataSource;
    dsProtetico: TDataSource;
    dsFornecedor: TDataSource;
    dsCidade: TDataSource;
    dsEstado: TDataSource;
    dsGrupo: TDataSource;
    dsSubGrupo: TDataSource;
    dsUnidade: TDataSource;
    dsMarca: TDataSource;
    dsMovEstoque: TDataSource;
    dsMaterial: TDataSource;
    dsAgenda: TDataSource;
    dsHorario: TDataSource;
    dsSalaEspera: TDataSource;
    dsTipoAtende: TDataSource;
    BaseDados: TDatabase;
    tbPais: TTable;
    tbEstado: TTable;
    tbCidade: TTable;
    tbPaisPAI_SIGLA: TStringField;
    tbPaisPAI_NOME: TStringField;
    tbEstadoEST_SIGLA: TStringField;
    tbEstadoEST_NOME: TStringField;
    tbEstadoPAI_SIGLA: TStringField;
    tbCidadeCID_CODIGO: TAutoIncField;
    tbCidadeCID_NOME: TStringField;
    tbCidadeEST_SIGLA: TStringField;
    tbVisEstado: TTable;
    tbVisCidade: TTable;
    tbVisCidadeCID_CODIGO: TAutoIncField;
    tbVisCidadeCID_NOME: TStringField;
    tbVisCidadeEST_SIGLA: TStringField;
    tbVisEstadoEST_SIGLA: TStringField;
    tbVisEstadoEST_NOME: TStringField;
    tbVisEstadoPAI_SIGLA: TStringField;
    tbCargo: TTable;
    tbCargoCAR_CODIGO: TAutoIncField;
    tbCargoCAR_CARGO: TStringField;
    tbFuncionario: TTable;
    tbFuncionarioFUN_CODIGO: TAutoIncField;
    tbFuncionarioFUN_NOME: TStringField;
    tbFuncionarioFUN_DTADMIS: TDateField;
    tbFuncionarioCAR_CODIGO: TIntegerField;
    tbFuncionarioFUN_SALFIXO: TCurrencyField;
    tbFuncionarioFUN_DTNASC: TDateField;
    tbFuncionarioFUN_CPF: TStringField;
    tbFuncionarioFUN_RG: TStringField;
    tbFuncionarioFUN_RUA: TStringField;
    tbFuncionarioFUN_NUM: TSmallintField;
    tbFuncionarioFUN_COMPLE: TStringField;
    tbFuncionarioFUN_BAIRRO: TStringField;
    tbFuncionarioFUN_CEP: TStringField;
    tbFuncionarioCID_CODIGO: TIntegerField;
    tbFuncionarioFUN_TIPOTEL1: TStringField;
    tbFuncionarioFUN_TEL1: TStringField;
    tbFuncionarioFUN_TIPOTEL2: TStringField;
    tbFuncionarioFUN_TEL2: TStringField;
    tbFuncionarioFUN_TIPOTEL3: TStringField;
    tbFuncionarioFUN_TEL3: TStringField;
    tbFuncionarioFUN_FOTO: TGraphicField;
    tbFuncionarioFUN_OBS: TMemoField;
    tbFuncionarioFUN_DATACAD: TDateField;
    tbFuncionariolkUF: TStringField;
    tbFuncionarioIdade: TStringField;
    tbGrupo: TTable;
    tbGrupoGRU_CODIGO: TAutoIncField;
    tbGrupoGRU_NOME: TStringField;
    tbSubGrupo: TTable;
    tbUnidade: TTable;
    tbUnidadeUNI_SIGLA: TStringField;
    tbUnidadeUNI_NOME: TStringField;
    tbMarca: TTable;
    tbMaterial: TTable;
    tbMarcaMAR_CODIGO: TAutoIncField;
    tbMarcaMAR_NOME: TStringField;
    tbMaterialMAT_CODIGO: TStringField;
    tbMaterialMAT_NOME: TStringField;
    tbMaterialSBG_CODIGO: TIntegerField;
    tbMaterialMAR_CODIGO: TIntegerField;
    tbMaterialUNI_SIGLA: TStringField;
    tbMaterialMAT_ESTOMIN: TFloatField;
    tbMaterialMAT_ESTOMAX: TFloatField;
    tbMaterialMAT_ESTOATUAL: TFloatField;
    tbMaterialMAT_PRECOMPRA: TCurrencyField;
    tbMaterialMAT_FOTO: TGraphicField;
    tbMaterialMAT_DATACAD: TDateField;
    tbMaterialMAT_ULTIMACOMP: TDateField;
    tbMateriallkGrupo: TStringField;
    tbSubGrupoSBG_CODIGO: TIntegerField;
    tbSubGrupoGRU_CODIGO: TIntegerField;
    tbSubGrupoSBG_NOME: TStringField;
    tbSubGrupolkGrupo: TStringField;
    tbMovEstoque: TTable;
    tbMovEstoqueMVE_CODIGO: TAutoIncField;
    tbMovEstoqueMAT_CODIGO: TStringField;
    tbMovEstoqueFUN_CODIGO: TIntegerField;
    tbMovEstoqueMVE_QTD: TFloatField;
    tbMovEstoqueMVE_TIPO: TStringField;
    tbMovEstoqueMVE_MOTIVO: TMemoField;
    tbMovEstoqueMVE_DATA: TDateField;
    tbMovEstoqueMVE_HORA: TTimeField;
    tbConvenio: TTable;
    tbConvenioCON_CODIGO: TAutoIncField;
    tbConvenioCON_DESCRICAO: TStringField;
    tbConvenioCON_RETORNO: TStringField;
    tbConvenioCON_RUA: TStringField;
    tbConvenioCON_NUM: TSmallintField;
    tbConvenioCON_COMPLE: TStringField;
    tbConvenioCON_BAIRRO: TStringField;
    tbConvenioCON_CEP: TStringField;
    tbConvenioCID_CODIGO: TIntegerField;
    tbConvenioCON_EMAIL: TStringField;
    tbConvenioCON_CONTATO: TStringField;
    tbConvenioCON_TIPOTEL1: TStringField;
    tbConvenioCON_TEL1: TStringField;
    tbConvenioCON_TIPOTEL2: TStringField;
    tbConvenioCON_TEL2: TStringField;
    tbConvenioCON_TIPOTEL3: TStringField;
    tbConvenioCON_TEL3: TStringField;
    tbConvenioCON_OBS: TMemoField;
    tbConvenioCON_INDPROCED: TFloatField;
    tbConvenioCON_TABPROCED: TStringField;
    tbConvenioCON_INDMATE: TFloatField;
    tbConvenioCON_TABMATE: TStringField;
    tbConvenioCON_INDTAXA: TFloatField;
    tbConvenioCON_TABTAXA: TStringField;
    tbConvenioCON_DATACAD: TDateField;
    tbConveniolkUF: TStringField;
    tbPaciente: TTable;
    tbPacientePAC_CODIGO: TAutoIncField;
    tbPacientePAC_NOME: TStringField;
    tbPacientePAC_PAI: TStringField;
    tbPacientePAC_MAE: TStringField;
    tbPacientePAC_COR: TStringField;
    tbPacientePAC_NASC: TDateField;
    tbPacientePAC_ARCADA: TStringField;
    tbPacientePAC_INDICADO: TStringField;
    tbPacientePAC_ESTCIVIL: TStringField;
    tbPacienteCON_CODIGO: TIntegerField;
    tbPacientePAC_PROFISSAO: TStringField;
    tbPacientePAC_RUA: TStringField;
    tbPacientePAC_NUM: TSmallintField;
    tbPacientePAC_COMPLE: TStringField;
    tbPacientePAC_BAIRRO: TStringField;
    tbPacientePAC_CEP: TStringField;
    tbPacienteCID_CODIGO: TIntegerField;
    tbPacientePAC_EMAIL: TStringField;
    tbPacientePAC_TIPOTEL1: TStringField;
    tbPacientePAC_TEL1: TStringField;
    tbPacientePAC_TIPOTEL2: TStringField;
    tbPacientePAC_TEL2: TStringField;
    tbPacientePAC_TIPOTEL3: TStringField;
    tbPacientePAC_TEL3: TStringField;
    tbPacientePAC_RG: TStringField;
    tbPacientePAC_CPF: TStringField;
    tbPacientePAC_ULTCONS: TDateField;
    tbPacientePAC_FOTO: TGraphicField;
    tbPacientePAC_OBS: TMemoField;
    tbPacientePAC_DATACAD: TDateField;
    tbPacientelkUF: TStringField;
    tbPacienteIdade: TStringField;
    tbPacienteConvenio: TStringField;
    tbProfissional: TTable;
    tbProfissionalPRO_CODIGO: TAutoIncField;
    tbProfissionalPRO_NOME: TStringField;
    tbProfissionalPRO_REGISTRO: TStringField;
    tbProfissionalPRO_ESPE1: TStringField;
    tbProfissionalPRO_ESPE2: TStringField;
    tbProfissionalPRO_ESPE3: TStringField;
    tbProfissionalPRO_RUA: TStringField;
    tbProfissionalPRO_NUM: TSmallintField;
    tbProfissionalPRO_COMPLE: TStringField;
    tbProfissionalPRO_BAIRRO: TStringField;
    tbProfissionalPRO_CEP: TStringField;
    tbProfissionalCID_CODIGO: TIntegerField;
    tbProfissionalPRO_EMAIL: TStringField;
    tbProfissionalPRO_TIPOTEL1: TStringField;
    tbProfissionalPRO_TEL1: TStringField;
    tbProfissionalPRO_TIPOTEL2: TStringField;
    tbProfissionalPRO_TEL2: TStringField;
    tbProfissionalPRO_TIPOTEL3: TStringField;
    tbProfissionalPRO_TEL3: TStringField;
    tbProfissionalPRO_RG: TStringField;
    tbProfissionalPRO_CPF: TStringField;
    tbProfissionalPRO_FOTO: TGraphicField;
    tbProfissionalPRO_OBS: TMemoField;
    tbProfissionalPRO_DATACAD: TDateField;
    tbProfissionallkUF: TStringField;
    tbProtetico: TTable;
    tbProteticoPRT_CODIGO: TAutoIncField;
    tbProteticoPRT_NOME: TStringField;
    tbProteticoPRT_RUA: TStringField;
    tbProteticoPRT_NUM: TSmallintField;
    tbProteticoPRT_COMPLE: TStringField;
    tbProteticoPRT_BAIRRO: TStringField;
    tbProteticoPRT_CEP: TStringField;
    tbProteticoCID_CODIGO: TIntegerField;
    tbProteticoPRT_EMAIL: TStringField;
    tbProteticoPRT_TIPOTEL1: TStringField;
    tbProteticoPRT_TEL1: TStringField;
    tbProteticoPRT_TIPOTEL2: TStringField;
    tbProteticoPRT_TEL2: TStringField;
    tbProteticoPRT_TIPOTEL3: TStringField;
    tbProteticoPRT_TEL3: TStringField;
    tbProteticoPRT_RG: TStringField;
    tbProteticoPRT_CPF: TStringField;
    tbProteticoPRT_FOTO: TGraphicField;
    tbProteticoPRT_OBS: TMemoField;
    tbProteticoPRT_DATACAD: TDateField;
    tbProteticolkUF: TStringField;
    tbFornecedor: TTable;
    tbFornecedorFOR_CODIGO: TAutoIncField;
    tbFornecedorFOR_TIPO: TStringField;
    tbFornecedorFOR_NOME: TStringField;
    tbFornecedorFOR_FANTASIA: TStringField;
    tbFornecedorFOR_CNPJ: TStringField;
    tbFornecedorFOR_CPF: TStringField;
    tbFornecedorFOR_INSESTADO: TStringField;
    tbFornecedorFOR_RG: TStringField;
    tbFornecedorFOR_RUA: TStringField;
    tbFornecedorFOR_NUM: TSmallintField;
    tbFornecedorFOR_COMPLE: TStringField;
    tbFornecedorFOR_BAIRRO: TStringField;
    tbFornecedorFOR_CEP: TStringField;
    tbFornecedorCID_CODIGO: TIntegerField;
    tbFornecedorFOR_EMAIL: TStringField;
    tbFornecedorFOR_TIPOTEL1: TStringField;
    tbFornecedorFOR_TEL1: TStringField;
    tbFornecedorFOR_TIPOTEL2: TStringField;
    tbFornecedorFOR_TEL2: TStringField;
    tbFornecedorFOR_TIPOTEL3: TStringField;
    tbFornecedorFOR_TEL3: TStringField;
    tbFornecedorFOR_OBS: TMemoField;
    tbFornecedorFOR_DATACAD: TDateField;
    tbFornecedorlkUF: TStringField;
    tbTipoAtende: TTable;
    tbTipoAtendeTIP_SIGLA: TStringField;
    tbTipoAtendeTIP_TIPO: TStringField;
    tbTipoAtendeTIP_COR: TStringField;
    tbSalaEspera: TTable;
    tbSalaEsperaSAL_DATACHEGA: TDateField;
    tbSalaEsperaSAL_HORACHEGA: TTimeField;
    tbSalaEsperaPRO_CODIGO: TIntegerField;
    tbSalaEsperaHOR_CODIGO: TIntegerField;
    tbSalaEsperaAGE_DATA: TDateField;
    tbSalaEsperaAGE_HORARIO: TStringField;
    tbHorario: TTable;
    tbHorarioPRO_CODIGO: TIntegerField;
    tbHorarioHOR_CODIGO: TAutoIncField;
    tbHorarioHOR_DTLIMITA: TDateField;
    tbAgenda: TTable;
    tbAgendaPRO_CODIGO: TSmallintField;
    tbAgendaHOR_CODIGO: TSmallintField;
    tbAgendaAGE_DATA: TDateField;
    tbAgendaAGE_HORARIO: TStringField;
    tbAgendaPAC_CODIGO: TIntegerField;
    tbAgendaTIP_SIGLA: TStringField;
    tbAgendaAGE_STATUS: TStringField;
    tbAgendaAGE_OBS: TMemoField;
    tbAgendaPaciente: TStringField;
    tbAgendaTele1: TStringField;
    tbAgendaTele2: TStringField;
    tbAgendaUltCons: TDateField;
    tbAgendaConvenio: TStringField;
    tbAgendaTipo: TStringField;
    tbAgendaCor: TStringField;
    tbPacientePAC_SEXO: TStringField;
    tbTipoAtendeTIP_CADRAP: TStringField;
    tbFuncionarioFUN_SITUACAO: TStringField;
    tbTipoDoc: TTable;
    tbTipoDocCodDoc: TStringField;
    tbTipoDocDescricao: TStringField;
    dsTipoDoc: TDataSource;
    tbCPagar: TTable;
    tbCPagarNomeFornec: TStringField;
    tbCPagarLkTipoDoc: TStringField;
    tbCPagarLkHistorico: TStringField;
    dsCPagar: TDataSource;
    tbCPagarCodCPagar: TAutoIncField;
    tbCPagarNumDoc: TStringField;
    tbCPagarNumBanco: TStringField;
    tbCPagarCodDoc: TStringField;
    tbCPagarCodFor: TIntegerField;
    tbCPagarCodComp: TIntegerField;
    tbCPagarDataEmis: TDateField;
    tbCPagarDataVenc: TDateField;
    tbCPagarCodHist: TStringField;
    tbCPagarCompHist: TStringField;
    tbCPagarValor: TCurrencyField;
    tbCPagarDataPaga: TDateField;
    tbCPagarValorPago: TCurrencyField;
    tbCPagarDescPago: TCurrencyField;
    tbCPagarMuJuPago: TCurrencyField;
    tbCPagarPago: TStringField;
    tbCPagarTipoPago: TStringField;
    tbCPagarCodCCusto: TStringField;
    tbCPagarPortador: TStringField;
    tbBanco: TTable;
    tbBancoNada: TAutoIncField;
    tbBancoNumBanco: TStringField;
    tbBancoNomeBanco: TStringField;
    dsBanco: TDataSource;
    TbCCorrente: TTable;
    TbCCorrenteNada: TAutoIncField;
    TbCCorrenteConta: TStringField;
    TbCCorrenteDataAbert: TDateField;
    TbCCorrenteDescricao: TStringField;
    TbCCorrenteNumBanco: TStringField;
    TbCCorrenteNumAgencia: TStringField;
    TbCCorrenteTel1: TStringField;
    TbCCorrenteFax: TStringField;
    TbCCorrenteGerente: TStringField;
    TbCCorrenteTitular: TStringField;
    TbCCorrenteLimite: TCurrencyField;
    TbCCorrenteSaldo: TCurrencyField;
    TbCCorrenteUltMov: TDateField;
    TbCCorrenteHoraMov: TTimeField;
    TbCCorrenteEMail: TStringField;
    TbCCorrenteDataCad: TDateField;
    TbCCorrenteLkNomeBanco: TStringField;
    TbCCorrenteInternet: TStringField;
    DsCCorrente: TDataSource;
    tbCReceber: TTable;
    tbCReceberCodCRec: TAutoIncField;
    tbCReceberNumDoc: TStringField;
    tbCReceberCodDoc: TStringField;
    tbCReceberCodCli: TIntegerField;
    tbCReceberCodVen: TSmallintField;
    tbCReceberDataVen: TDateField;
    tbCReceberCodCServ: TIntegerField;
    tbCReceberDataEmis: TDateField;
    tbCReceberDataVenc: TDateField;
    tbCReceberCodHist: TStringField;
    tbCReceberValor: TCurrencyField;
    tbCReceberValorMulta: TCurrencyField;
    tbCReceberValorDesc: TCurrencyField;
    tbCReceberValorJuros: TCurrencyField;
    tbCReceberDataPaga: TDateField;
    tbCReceberValorPago: TCurrencyField;
    tbCReceberPago: TStringField;
    tbCReceberCodCCusto: TStringField;
    tbCReceberMultaDia: TDateField;
    tbCReceberPercMulta: TFloatField;
    tbCReceberDescDia: TDateField;
    tbCReceberPercDesc: TFloatField;
    tbCReceberJurosDia: TDateField;
    tbCReceberPercJuros: TFloatField;
    tbCReceberlkCliente: TStringField;
    tbCReceberLkTipoDoc: TStringField;
    tbCReceberCompHist: TStringField;
    tbCReceberlknome: TStringField;
    tbCReceberlkcpf: TStringField;
    tbCReceberLkEndereco: TStringField;
    tbCReceberlknumero: TStringField;
    tbCReceberlkbairro: TStringField;
    tbCReceberlkcidade: TStringField;
    tbCReceberlkuf: TStringField;
    tbCReceberlkcep: TStringField;
    tbCReceberPortador: TStringField;
    tbCReceberTipoPago: TStringField;
    tbCReceberNumBanco: TStringField;
    tbCReceberDescPago: TCurrencyField;
    tbCReceberMuJuPago: TCurrencyField;
    dsCReceber: TDataSource;
    tbCheque: TTable;
    tbChequeNumBanco: TStringField;
    tbChequeNumCheque: TFloatField;
    tbChequeAgencia: TStringField;
    tbChequeValor: TCurrencyField;
    tbChequeVencimento: TDateField;
    tbChequeDataVen: TDateField;
    tbChequeCodVen: TIntegerField;
    tbChequeCodCli: TIntegerField;
    tbChequeConta: TStringField;
    tbChequeNomeCli: TStringField;
    tbChequeObs: TMemoField;
    tbChequeStatus: TStringField;
    tbChequeNomeBanco: TStringField;
    tbChequeJuros: TFloatField;
    tbChequeValorJuros: TCurrencyField;
    tbChequeNovoVenc: TDateField;
    tbChequeValorTotal: TCurrencyField;
    tbChequePreDatado: TStringField;
    dsCheque: TDataSource;
    tbHistorico: TTable;
    tbHistoricoCodHist: TStringField;
    tbHistoricoDescricao: TStringField;
    dsHistorico: TDataSource;
    tbCReceberLkHistorico: TStringField;
    TbMovConta: TTable;
    TbMovContaCodMov: TAutoIncField;
    TbMovContaTipoOper: TStringField;
    TbMovContaDataMov: TDateField;
    TbMovContaCodDoc: TStringField;
    TbMovContaDosNumero: TStringField;
    TbMovContaNumAgencia: TStringField;
    TbMovContaConta: TStringField;
    TbMovContaCodHist: TStringField;
    TbMovContaComplHist: TStringField;
    TbMovContaValor: TCurrencyField;
    TbMovContaDataReg: TDateField;
    TbMovContaHoraReg: TTimeField;
    TbMovContaUserName: TStringField;
    TbMovContaCodBanco: TIntegerField;
    TbMovContalkBanco: TStringField;
    DsMovConta: TDataSource;
    tbChequePro: TTable;
    tbChequeProConta: TStringField;
    tbChequeProNumCheque: TFloatField;
    tbChequeProValor: TCurrencyField;
    tbChequeProVencimento: TDateField;
    tbChequeProDataCompra: TDateField;
    tbChequeProCodCompra: TIntegerField;
    tbChequeProCodFor: TIntegerField;
    tbChequeProObs: TMemoField;
    tbChequeProStatus: TStringField;
    tbChequeProJuros: TFloatField;
    tbChequeProValorJuros: TCurrencyField;
    tbChequeProNovoVenc: TDateField;
    tbChequeProPreDatado: TStringField;
    tbChequeProValorTotal: TCurrencyField;
    dsChequePro: TDataSource;
    dsCartao: TDataSource;
    tbCartao: TTable;
    tbCartaoCodCar: TAutoIncField;
    tbCartaoCartao: TStringField;
    tbCartaoAnual: TCurrencyField;
    tbCartaoDiaVenc: TFloatField;
    tbCartaoLimite: TCurrencyField;
    tbCartaoInternet: TStringField;
    tbCartaoDtCad: TDateField;
    tbCartaoTipoTel1: TStringField;
    tbCartaoTel1: TStringField;
    tbCartaoTipoTel2: TStringField;
    tbCartaoTel2: TStringField;
    tbCartaoTipoTel3: TStringField;
    tbCartaoTel3: TStringField;
    tbCartaoObs: TMemoField;
    tbIndice: TTable;
    dsIndice: TDataSource;
    tbIndiceCodIndice: TAutoIncField;
    tbIndiceMoeda: TStringField;
    tbIndiceValor: TCurrencyField;
    tbIndiceData: TDateField;
    tbTipoMed: TTable;
    dsTipoMed: TDataSource;
    dsUsoMed: TDataSource;
    tbUsoMed: TTable;
    tbTipoMedCodTipo: TAutoIncField;
    tbTipoMedTipoMed: TStringField;
    tbUsoMedCodUso: TAutoIncField;
    tbUsoMedUso: TStringField;
    tbMedicamento: TTable;
    dsMedicamento: TDataSource;
    tbMedicamentoCodMedic: TAutoIncField;
    tbMedicamentoNome: TStringField;
    tbMedicamentoNomeCom: TStringField;
    tbMedicamentoApres: TStringField;
    tbMedicamentoQtd: TFloatField;
    tbMedicamentoObs: TMemoField;
    tbMedicamentoCodUso: TIntegerField;
    tbMedicamentoCodTipo: TIntegerField;
    tbMedicamentolkTipo: TStringField;
    tbMedicamentolkUso: TStringField;
    tbMedicamentoTexto: TMemoField;
    tbSenha: TTable;
    tbSenhaUsuario: TStringField;
    tbSenhaSenha: TStringField;
    tbSenhaTipoAcesso: TStringField;
    dsSenha: TDataSource;
    tbSaida: TTable;
    tbSaidaMVE_CODIGO: TAutoIncField;
    tbSaidaMAT_CODIGO: TStringField;
    tbSaidaFUN_CODIGO: TIntegerField;
    tbSaidaMVE_QTD: TFloatField;
    tbSaidaMVE_TIPO: TStringField;
    tbSaidaMVE_MOTIVO: TMemoField;
    tbSaidaMVE_DATA: TDateField;
    tbSaidaMVE_HORA: TTimeField;
    tbSaidalkDescriProd: TStringField;
    tbEntrada: TTable;
    tbEntradaMVE_CODIGO: TAutoIncField;
    tbEntradaMAT_CODIGO: TStringField;
    tbEntradaFUN_CODIGO: TIntegerField;
    tbEntradaMVE_QTD: TFloatField;
    tbEntradaMVE_TIPO: TStringField;
    tbEntradaMVE_MOTIVO: TMemoField;
    tbEntradaMVE_DATA: TDateField;
    tbEntradaMVE_HORA: TTimeField;
    tbEntradalkDescriProd: TStringField;
    dsEntrada: TDataSource;
    dsSaida: TDataSource;
    tbMovDia: TTable;
    tbMovDiaDataMov: TDateField;
    tbMovDiaCodMerc: TStringField;
    tbMovDiaDescricao: TStringField;
    tbMovDiaQuantidade: TFloatField;
    tbMovDiaValor: TCurrencyField;
    dsMovDia: TDataSource;
    dsRelEsto: TDataSource;
    tbRelEsto: TTable;
    tbRelEstoMAT_CODIGO: TStringField;
    tbRelEstoMAT_NOME: TStringField;
    tbRelEstoSBG_CODIGO: TIntegerField;
    tbRelEstoMAR_CODIGO: TIntegerField;
    tbRelEstoUNI_SIGLA: TStringField;
    tbRelEstoMAT_ESTOMIN: TFloatField;
    tbRelEstoMAT_ESTOMAX: TFloatField;
    tbRelEstoMAT_ESTOATUAL: TFloatField;
    tbRelEstoMAT_PRECOMPRA: TCurrencyField;
    tbRelEstoMAT_FOTO: TGraphicField;
    tbRelEstoMAT_DATACAD: TDateField;
    tbRelEstoMAT_ULTIMACOMP: TDateField;
    dsCompras: TDataSource;
    tbCompras: TTable;
    tbComprasCodComp: TAutoIncField;
    tbComprasDataComp: TDateField;
    tbComprasHoraComp: TTimeField;
    tbComprasCodFor: TIntegerField;
    tbComprasValor: TCurrencyField;
    tbComprasDesconto: TCurrencyField;
    tbComprasCodForPag: TStringField;
    tbComprasNumParcelas: TSmallintField;
    tbComprasUserName: TStringField;
    tbComprasCodIndex: TIntegerField;
    tbComprasPedidoPen: TStringField;
    tbComprasLkFornec: TStringField;
    tbDetCompras: TTable;
    tbDetComprasCodMerc: TStringField;
    tbDetComprasCodComp: TIntegerField;
    tbDetComprasPrecoUnit: TCurrencyField;
    tbDetComprasQuant: TFloatField;
    tbDetComprasTotal: TFloatField;
    tbDetComprasLkProduto: TStringField;
    tbDetComprasDataComp: TDateField;
    dsDetCompras: TDataSource;
    dsVisDetCompra: TDataSource;
    tbVisDetCompra: TTable;
    tbVisDetCompraLkProduto: TStringField;
    tbVisDetCompraCodMerc: TStringField;
    tbVisDetCompraCodComp: TIntegerField;
    tbVisDetCompraPrecoUnit: TCurrencyField;
    tbVisDetCompraQuant: TFloatField;
    tbVisDetCompraTotal: TFloatField;
    tbVisDetCompraDataComp: TDateField;
    tbVisDetCompraLknomeforc: TStringField;
    EvLibFunctions1: TEvLibFunctions;
    tbGrupoEx: TTable;
    tbGrupoExCodGruEx: TAutoIncField;
    dsGrupoEx: TDataSource;
    dsExames: TDataSource;
    tbExame: TTable;
    tbExameCodEx: TAutoIncField;
    tbExameExame: TStringField;
    tbGrupoExGrupo: TStringField;
    tbExameCodGruEx: TIntegerField;
    tbExamelkGrupoEx: TStringField;
    tbHorarioHOR_DTINICIAL: TDateField;
    tbHorarioHOR_SEGUNDA: TBooleanField;
    tbHorarioHOR_2INIMA: TTimeField;
    tbHorarioHOR_2TERMA: TTimeField;
    tbHorarioHOR_2INITA: TTimeField;
    tbHorarioHOR_2TERTA: TTimeField;
    tbHorarioHOR_2DURA: TSmallintField;
    tbHorarioHOR_TERCA: TBooleanField;
    tbHorarioHOR_3INIMA: TTimeField;
    tbHorarioHOR_3TERMA: TTimeField;
    tbHorarioHOR_3INITA: TTimeField;
    tbHorarioHOR_3TERTA: TTimeField;
    tbHorarioHOR_3DURA: TSmallintField;
    tbHorarioHOR_QUARTA: TBooleanField;
    tbHorarioHOR_4INIMA: TTimeField;
    tbHorarioHOR_4TERMA: TTimeField;
    tbHorarioHOR_4INITA: TTimeField;
    tbHorarioHOR_4TERTA: TTimeField;
    tbHorarioHOR_4DURA: TSmallintField;
    tbHorarioHOR_QUINTA: TBooleanField;
    tbHorarioHOR_5INIMA: TTimeField;
    tbHorarioHOR_5TERMA: TTimeField;
    tbHorarioHOR_5INITA: TTimeField;
    tbHorarioHOR_5TERTA: TTimeField;
    tbHorarioHOR_5DURA: TSmallintField;
    tbHorarioHOR_SEXTA: TBooleanField;
    tbHorarioHOR_6INIMA: TTimeField;
    tbHorarioHOR_6TERMA: TTimeField;
    tbHorarioHOR_6TERTA: TTimeField;
    tbHorarioHOR_6DURA: TSmallintField;
    tbHorarioHOR_SABADO: TBooleanField;
    tbHorarioHOR_7INIMA: TTimeField;
    tbHorarioHOR_7TERMA: TTimeField;
    tbHorarioHOR_7INITA: TTimeField;
    tbHorarioHOR_7TERTA: TTimeField;
    tbHorarioHOR_7DURA: TSmallintField;
    tbHorarioHOR_DOMINGO: TBooleanField;
    tbHorarioHOR_1INIMA: TTimeField;
    tbHorarioHOR_1TERMA: TTimeField;
    tbHorarioHOR_1INITA: TTimeField;
    tbHorarioHOR_1TERTA: TTimeField;
    tbHorarioHOR_1DURA: TSmallintField;
    tbAnamneseAd: TTable;
    tbAnamneseAdCodAnam: TAutoIncField;
    tbAnamneseAdCodPac: TIntegerField;
    tbAnamneseAdMotivo: TStringField;
    tbAnamneseAdConsulta: TStringField;
    tbAnamneseAdP1Texto: TMemoField;
    tbAnamneseAdP1Sim: TBooleanField;
    tbAnamneseAdP1Nao: TBooleanField;
    tbAnamneseAdP2Texto: TMemoField;
    tbAnamneseAdP2Sim: TBooleanField;
    tbAnamneseAdP2Nao: TBooleanField;
    tbAnamneseAdP3Texto: TMemoField;
    tbAnamneseAdP3Sim: TBooleanField;
    tbAnamneseAdP3Nao: TBooleanField;
    tbAnamneseAdP3NaoSei: TBooleanField;
    tbAnamneseAdP4Texto: TMemoField;
    tbAnamneseAdP4Sim: TBooleanField;
    tbAnamneseAdP4Nao: TBooleanField;
    tbAnamneseAdP4NaoSei: TBooleanField;
    tbAnamneseAdP5Texto: TMemoField;
    tbAnamneseAdP5Sim: TBooleanField;
    tbAnamneseAdP5Nao: TBooleanField;
    tbAnamneseAdP5NaoSei: TBooleanField;
    tbAnamneseAdP6Texto: TMemoField;
    tbAnamneseAdP6Sim: TBooleanField;
    tbAnamneseAdP6Nao: TBooleanField;
    tbAnamneseAdP6NaoSei: TBooleanField;
    tbAnamneseAdP7Texto: TMemoField;
    tbAnamneseAdP7Sim: TBooleanField;
    tbAnamneseAdP7Nao: TBooleanField;
    tbAnamneseAdP7NaoSei: TBooleanField;
    tbAnamneseAdP8Texto: TMemoField;
    tbAnamneseAdP8Sim: TBooleanField;
    tbAnamneseAdP8Nao: TBooleanField;
    tbAnamneseAdP8NaoSei: TBooleanField;
    tbAnamneseAdP9Texto: TMemoField;
    tbAnamneseAdP9Sim: TBooleanField;
    tbAnamneseAdP9Nao: TBooleanField;
    tbAnamneseAdP9NaoSei: TBooleanField;
    tbAnamneseAdP10Texto: TMemoField;
    tbAnamneseAdP10Sim: TBooleanField;
    tbAnamneseAdP10Nao: TBooleanField;
    tbAnamneseAdP10NaoSei: TBooleanField;
    tbAnamneseAdP11Texto: TMemoField;
    tbAnamneseAdP11Sim: TBooleanField;
    tbAnamneseAdP11Nao: TBooleanField;
    tbAnamneseAdP11NaoSei: TBooleanField;
    tbAnamneseAdP12Texto: TMemoField;
    tbAnamneseAdP12Sim: TBooleanField;
    tbAnamneseAdP12Nao: TBooleanField;
    tbAnamneseAdP12NaoSei: TBooleanField;
    tbAnamneseAdP13Texto: TMemoField;
    tbAnamneseAdP13Sim: TBooleanField;
    tbAnamneseAdP13Nao: TBooleanField;
    tbAnamneseAdP13NaoSei: TBooleanField;
    tbAnamneseAdP14Texto: TMemoField;
    tbAnamneseAdP14Sim: TBooleanField;
    tbAnamneseAdP14Nao: TBooleanField;
    tbAnamneseAdP14NaoSei: TBooleanField;
    tbAnamneseAdP15Texto: TMemoField;
    tbAnamneseAdP15Sim: TBooleanField;
    tbAnamneseAdP15Nao: TBooleanField;
    tbAnamneseAdP15NaoSei: TBooleanField;
    tbAnamneseAdP16Texto: TMemoField;
    tbAnamneseAdP16Sim: TBooleanField;
    tbAnamneseAdP16Nao: TBooleanField;
    tbAnamneseAdP16NaoSei: TBooleanField;
    tbAnamneseAdP17Texto: TMemoField;
    tbAnamneseAdP17Sim: TBooleanField;
    tbAnamneseAdP17Nao: TBooleanField;
    tbAnamneseAdP18NaoSei: TBooleanField;
    tbAnamneseAdP19Texto: TMemoField;
    tbAnamneseAdP19Sim: TBooleanField;
    tbAnamneseAdP19Nao: TBooleanField;
    tbAnamneseAdP19NaoSei: TBooleanField;
    tbAnamneseAdP20Texto: TMemoField;
    tbAnamneseAdP20Sim: TBooleanField;
    tbAnamneseAdP20Nao: TBooleanField;
    tbAnamneseAdP20NaoSei: TBooleanField;
    tbAnamneseAdP21Texto: TMemoField;
    tbAnamneseAdP21Sim: TBooleanField;
    tbAnamneseAdP21Nao: TBooleanField;
    tbAnamneseAdP22NaoSei: TBooleanField;
    tbAnamneseAdP23Texto: TMemoField;
    tbAnamneseAdP23Sim: TBooleanField;
    tbAnamneseAdP23Nao: TBooleanField;
    tbAnamneseAdP23NaoSei: TBooleanField;
    tbAnamneseAdP24Texto: TMemoField;
    tbAnamneseAdP24Sim: TBooleanField;
    tbAnamneseAdP24Nao: TBooleanField;
    tbAnamneseAdP24NaoSei: TBooleanField;
    tbAnamneseAdP25Texto: TMemoField;
    tbAnamneseAdP25Sim: TBooleanField;
    tbAnamneseAdP25Nao: TBooleanField;
    tbAnamneseAdP25NaoSei: TBooleanField;
    tbAnamneseAdP26Texto: TMemoField;
    tbAnamneseAdP26Sim: TBooleanField;
    tbAnamneseAdP26Nao: TBooleanField;
    tbAnamneseAdP26NaoSei: TBooleanField;
    tbAnamneseAdP27Texto: TMemoField;
    tbAnamneseAdP27Sim: TBooleanField;
    tbAnamneseAdP27Nao: TBooleanField;
    tbAnamneseAdP27NaoSei: TBooleanField;
    tbAnamneseAdP28Texto: TMemoField;
    tbAnamneseAdP28Sim: TBooleanField;
    tbAnamneseAdP28Nao: TBooleanField;
    tbAnamneseAdP28NaoSei: TBooleanField;
    tbAnamneseAdP29Texto: TMemoField;
    tbAnamneseAdP29Sim: TBooleanField;
    tbAnamneseAdP29Nao: TBooleanField;
    tbAnamneseAdP29NaoSei: TBooleanField;
    tbAnamneseAdP30Texto: TMemoField;
    tbAnamneseAdUltAtend: TDateField;
    tbAnamneseAdCompleto: TBooleanField;
    tbAnamneseAdImcompleto: TBooleanField;
    tbAnamneseAdExpNeg: TMemoField;
    tbAnamneseAdRoerUnha: TBooleanField;
    tbAnamneseAdMorder: TBooleanField;
    tbAnamneseAdRepirar: TBooleanField;
    tbAnamneseAdTomar: TBooleanField;
    tbAnamneseAdChupar: TBooleanField;
    tbAnamneseAdRanger: TBooleanField;
    tbAnamneseAdOutros: TBooleanField;
    tbAnamneseAdFio: TBooleanField;
    tbAnamneseAdUnitufo: TBooleanField;
    tbAnamneseAdInterdental: TBooleanField;
    tbAnamneseAdPalito: TBooleanField;
    tbAnamneseAdEscova: TBooleanField;
    tbAnamneseAdCreme: TBooleanField;
    tbAnamneseAdCremeDent: TStringField;
    tbAnamneseAdFGel: TBooleanField;
    tbAnamneseAdFCreme: TBooleanField;
    tbAnamneseAdFBochecho: TBooleanField;
    tbAnamneseAdFAgua: TBooleanField;
    tbAnamneseAdDietaSim: TBooleanField;
    tbAnamneseAdDietaNao: TBooleanField;
    dsAnamneseAd: TDataSource;
    tbAnamneseAdP17NaoSei: TBooleanField;
    tbAnamneseAdP18Sim: TBooleanField;
    tbAnamneseAdP18Nao: TBooleanField;
    tbAnamneseAdP18Texto: TMemoField;
    tbAnamneseAdP21NaoSei: TBooleanField;
    tbAnamneseAdP22Sim: TBooleanField;
    tbAnamneseAdP22Nao: TBooleanField;
    tbAnamneseAdP22Texto: TMemoField;
    tbLembrete: TTable;
    tbLembreteCodLem: TAutoIncField;
    tbLembreteTexto: TMemoField;
    tbLembreteHistorico: TBooleanField;
    tbLembreteReceita: TBooleanField;
    dsLembrete: TDataSource;
    tbLembreteCodPac: TIntegerField;
    tbBloqueio: TTable;
    tbBloqueioHOR_CODIGO: TIntegerField;
    tbBloqueioPRO_CODIGO: TIntegerField;
    tbBloqueioBLO_CODIGO: TAutoIncField;
    tbBloqueioBLO_DTINICIO: TDateField;
    tbBloqueioBLO_DTFINAL: TDateField;
    tbBloqueioBLO_MOTIVO: TStringField;
    dsBloqueio: TDataSource;
    tbAnamneseInf: TTable;
    tbAnamneseInfCodAnamInf: TAutoIncField;
    tbAnamneseInfCodPac: TIntegerField;
    tbAnamneseInfP3Bi: TBooleanField;
    tbAnamneseInfP3Ti: TBooleanField;
    tbAnamneseInfP3Cal: TBooleanField;
    tbAnamneseInfP3An: TBooleanField;
    tbAnamneseInfP3Ex: TBooleanField;
    tbAnamneseInfP3Ma: TBooleanField;
    tbAnamneseInfP3Me: TBooleanField;
    tbAnamneseInfP3Mi: TBooleanField;
    tbAnamneseInfP3Des: TBooleanField;
    tbAnamneseInfP3Agr: TBooleanField;
    tbAnamneseInfP3Ins: TBooleanField;
    tbAnamneseInfP3Agi: TBooleanField;
    tbAnamneseInfP4Texto: TMemoField;
    tbAnamneseInfP4Sim: TBooleanField;
    tbAnamneseInfP4Nao: TBooleanField;
    tbAnamneseInfP5: TMemoField;
    tbAnamneseInfP6: TMemoField;
    tbAnamneseInfP1Hist: TMemoField;
    tbAnamneseInfP2Hist: TMemoField;
    tbAnamneseInfP3Hist: TMemoField;
    tbAnamneseInfP4Hist: TMemoField;
    tbAnamneseInfP5Hist: TMemoField;
    tbAnamneseInfP6Hist: TMemoField;
    tbAnamneseInfP7HistMed: TBooleanField;
    tbAnamneseInfP7HIstAli: TBooleanField;
    tbAnamneseInfP7HistPi: TBooleanField;
    tbAnamneseInfP7HistAn: TBooleanField;
    tbAnamneseInfP8Hist: TMemoField;
    tbAnamneseInfP9Hist: TMemoField;
    tbAnamneseInfP10Hist: TMemoField;
    tbAnamneseInfP11Hist: TMemoField;
    tbAnamneseInfP12Hist: TMemoField;
    tbAnamneseInfP1Hab: TMemoField;
    tbAnamneseInfP2Hab: TMemoField;
    tbAnamneseInfP3Hab: TMemoField;
    tbAnamneseInfP4Hab: TMemoField;
    tbAnamneseInfP5Hab: TMemoField;
    tbAnamneseInfP6Hab: TMemoField;
    tbAnamneseInfP7Hab: TMemoField;
    tbAnamneseInfP8Hab: TMemoField;
    tbAnamneseInfP9Hab: TMemoField;
    tbAnamneseInfP10Hab: TMemoField;
    tbAnamneseInfP11Hab: TMemoField;
    tbAnamneseInfP12Hab: TMemoField;
    tbAnamneseInfP13Hab: TMemoField;
    tbAnamneseInfP1Met: TMemoField;
    tbAnamneseInfP2Met: TMemoField;
    tbAnamneseInfP3Met: TMemoField;
    tbAnamneseInfP4Met: TMemoField;
    tbAnamneseInfP5Met: TMemoField;
    tbAnamneseInfP6Met: TMemoField;
    tbAnamneseInfP7Met: TMemoField;
    tbAnamneseInfP1Av: TMemoField;
    tbAnamneseInfP2Av: TMemoField;
    tbAnamneseInfP3AvSup: TBooleanField;
    tbAnamneseInfP3AvInf: TBooleanField;
    tbAnamneseInfP4AvSup: TBooleanField;
    tbAnamneseInfP4AvInf: TBooleanField;
    tbAnamneseInfP5Av: TMemoField;
    tbAnamneseInfP6Av: TMemoField;
    tbAnamneseInfP7Av: TMemoField;
    tbAnamneseInfP8Av: TMemoField;
    tbAnamneseInfP9AvDi: TBooleanField;
    tbAnamneseInfP9AvEs: TBooleanField;
    tbAnamneseInfP10Av: TMemoField;
    tbAnamneseInfP11Av: TMemoField;
    dsAnamneseInf: TDataSource;
    tbAnamneseInfP1: TMemoField;
    tbAnamneseInfP2: TMemoField;
    tbPacientelkCidade: TStringField;
    tbAnamneseAdTecidoMole: TMemoField;
    tbHorarioHOR_6INITA: TTimeField;
    procedure tbFuncionarioCalcFields(DataSet: TDataSet);
    procedure tbPacienteCalcFields(DataSet: TDataSet);
    procedure tbRelEstoFilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
    procedure tbChequeCalcFields(DataSet: TDataSet);
    procedure tbPacienteFilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
    procedure tbDetComprasCalcFields(DataSet: TDataSet);
    procedure tbVisDetCompraCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
    fHabilitaTeclado : boolean  ;
    fvTabStt         : boolean  ;
    fRelEstoque      : string   ;
    fCRecCli         : boolean  ;
    fBaixaLote       : boolean  ;
    fValorReceb      : real     ;
    fIniAnive        : TDateTime;
    fTerAnive        : TDateTime;
    
  public
    { Public declarations }
    property HabilitaTeclado : boolean   read fHabilitaTeclado write fHabilitaTeclado;
    property vTabStt         : boolean   read fvTabStt         write fvTabStt        ;
    property RelEstoque      : string    read fRelEstoque      write fRelEstoque     ;
    property CRecCli         : boolean   read fCRecCli         write fCRecCli        ;
    property BaixaLote       : boolean   read fBaixaLote       write fBaixaLote      ;
    property ValorReceb      : real      read fValorReceb      write fValorReceb     ;
    property IniAnive        : TDateTime read fIniAnive        write fIniAnive       ;
    property TerAnive        : TDateTime read fTerAnive        write fTerAnive       ;

  end;

var
  dmDados: TdmDados;

implementation

uses untPrincipal;

//uses untPrincipal;

{$R *.dfm}

procedure TdmDados.tbFuncionarioCalcFields(DataSet: TDataSet);
begin
  dmDados.tbFuncionarioIdade.Value := frmPrincipal.CalcIdade(dmDados.tbFuncionarioFUN_DTNASC.Value, Now);
end;

procedure TdmDados.tbPacienteCalcFields(DataSet: TDataSet);
begin
  dmDados.tbPacienteIdade.Value := frmPrincipal.CalcIdade(dmDados.tbPacientePAC_NASC.Value, Now);
end;

procedure TdmDados.tbRelEstoFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
  if (RelEstoque = 'Abaixo do M�nimo') then
    if (tbRelEstoMAT_ESTOATUAL.Value < tbRelEstoMAT_ESTOMIN.Value) then
      Accept := True
    else
      Accept := False;
  if (RelEstoque = 'Acima do M�ximo') then
    if (tbRelEstoMAT_ESTOATUAL.Value > tbRelEstoMAT_ESTOMAX.Value) then
      Accept := True
    else
      Accept := False;
end;

procedure TdmDados.tbChequeCalcFields(DataSet: TDataSet);
begin
  tbChequeValorTotal.Value := tbChequeValorJuros.Value + tbChequeValor.Value;
end;

procedure TdmDados.tbPacienteFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
  if ((Month(tbPacientePAC_NASC.Value) >= Month(IniAnive))and
     (Month(tbPacientePAC_NASC.Value) <= Month(TerAnive))) then
    if ((Day(tbPacientePAC_NASC.Value) >= Day(IniAnive))and
       (Day(tbPacientePAC_NASC.Value) <= Day(TerAnive))) then
      Accept := True
    else
      Accept := False
  else
    Accept := False;
end;

procedure TdmDados.tbDetComprasCalcFields(DataSet: TDataSet);
begin
  tbDetComprasTotal.Value := tbDetComprasPrecoUnit.Value * tbDetComprasQuant.Value;
end;

procedure TdmDados.tbVisDetCompraCalcFields(DataSet: TDataSet);
begin
  tbVisDetCompraTotal.Value := tbVisDetCompraPrecoUnit.Value * tbVisDetCompraQuant.Value;
end;

end.
