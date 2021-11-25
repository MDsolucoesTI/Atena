//////////////////////////////////////////////////////////////////////////
// Criacao...........: 08/2008
// Sistema...........: Atena - Automacao Clinica Odontologica
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit untQRAnamInf2;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, jpeg, DB, DBTables;

type
  TqrAnamInf2 = class(TQuickRep)
    tbPaciente: TTable;
    tbPacientePAC_CODIGO: TAutoIncField;
    tbPacientePAC_NOME: TStringField;
    tbPacientePAC_PAI: TStringField;
    tbPacientePAC_MAE: TStringField;
    tbPacientePAC_COR: TStringField;
    tbPacientePAC_SEXO: TStringField;
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
    tbPacientelkCidade: TStringField;
    dsPaciente: TDataSource;
    tbCidade: TTable;
    tbCidadeCID_CODIGO: TAutoIncField;
    tbCidadeCID_NOME: TStringField;
    tbCidadeEST_SIGLA: TStringField;
    QRBand1: TQRBand;
    QRLabel2: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel3: TQRLabel;
    QRShape2: TQRShape;
    QRImage1: TQRImage;
    QRBand2: TQRBand;
    QRBand4: TQRBand;
    QRSysData1: TQRSysData;
    QRLabel36: TQRLabel;
    QRLabel19: TQRLabel;
    QRDBText23: TQRDBText;
    QRLabel18: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel4: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRDBText3: TQRDBText;
    QRLabel7: TQRLabel;
    QRDBText4: TQRDBText;
    QRLabel8: TQRLabel;
    QRDBText5: TQRDBText;
    QRLabel9: TQRLabel;
    QRDBText6: TQRDBText;
    QRLabel11: TQRLabel;
    QRDBText7: TQRDBText;
    QRLabel12: TQRLabel;
    QRDBText8: TQRDBText;
    QRLabel13: TQRLabel;
    QRDBText9: TQRDBText;
    QRLabel14: TQRLabel;
    QRDBText10: TQRDBText;
    QRLabel15: TQRLabel;
    QRDBText11: TQRDBText;
    QRLabel16: TQRLabel;
    QRDBText12: TQRDBText;
    QRLabel17: TQRLabel;
    QRLabel20: TQRLabel;
    QRDBText13: TQRDBText;
    QRLabel21: TQRLabel;
    QRDBText14: TQRDBText;
    QRLabel22: TQRLabel;
    QRDBText15: TQRDBText;
    QRLabel23: TQRLabel;
    QRDBText16: TQRDBText;
    QRLabel24: TQRLabel;
    QRDBText17: TQRDBText;
    QRLabel25: TQRLabel;
    QRDBText18: TQRDBText;
    QRLabel26: TQRLabel;
    QRDBText19: TQRDBText;
    QRLabel27: TQRLabel;
    QRDBText20: TQRDBText;
    QRLabel28: TQRLabel;
    QRLabel29: TQRLabel;
    QRDBText21: TQRDBText;
    QRLabel30: TQRLabel;
    lP39Sim: TQRLabel;
    QRLabel31: TQRLabel;
    lP40Sim: TQRLabel;
    QRLabel33: TQRLabel;
    QRDBText22: TQRDBText;
    QRLabel34: TQRLabel;
    QRDBText24: TQRDBText;
    QRLabel35: TQRLabel;
    QRDBText25: TQRDBText;
    QRLabel37: TQRLabel;
    QRLabel38: TQRLabel;
    QRDBText26: TQRDBText;
    QRLabel39: TQRLabel;
    lP45Sim: TQRLabel;
    QRLabel41: TQRLabel;
    QRDBText27: TQRDBText;
    QRLabel42: TQRLabel;
    QRDBText28: TQRDBText;
    QRLabel43: TQRLabel;
    QRLabel44: TQRLabel;
    QRLabel45: TQRLabel;
    QRLabel46: TQRLabel;
    Ano: TQRLabel;
    QRLabel47: TQRLabel;
    Mes: TQRLabel;
    QRLabel48: TQRLabel;
    Dia: TQRLabel;
    QRLabel49: TQRLabel;
    QRShape19: TQRShape;
    dsCidade: TDataSource;
    QRDBText29: TQRDBText;
    QRLabel50: TQRLabel;
    QRLabel51: TQRLabel;
    QRDBText30: TQRDBText;
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
    tbAnamneseInfP1: TMemoField;
    tbAnamneseInfP2: TMemoField;
  private

  public

  end;

var
  qrAnamInf2: TqrAnamInf2;

implementation

uses untdmDados;

{$R *.DFM}

end.
