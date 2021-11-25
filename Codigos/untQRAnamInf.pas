//////////////////////////////////////////////////////////////////////////
// Criacao...........: 08/2008
// Sistema...........: Atena - Automacao Clinica Odontologica
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit untQRAnamInf;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, jpeg, DB, DBTables;

type
  TqrAnamInf = class(TQuickRep)
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
    dsCidade: TDataSource;
    QRBand1: TQRBand;
    QRLabel2: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel3: TQRLabel;
    QRShape2: TQRShape;
    QRImage1: TQRImage;
    QRBand2: TQRBand;
    QRDBText1: TQRDBText;
    QRLabel1: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel30: TQRLabel;
    QRLabel31: TQRLabel;
    QRLabel32: TQRLabel;
    QRDBText23: TQRDBText;
    QRDBText28: TQRDBText;
    QRDBText60: TQRDBText;
    lP4Sim: TQRLabel;
    QRBand4: TQRBand;
    QRSysData1: TQRSysData;
    QRLabel36: TQRLabel;
    QRLabel16: TQRLabel;
    QRDBText13: TQRDBText;
    QRLabel17: TQRLabel;
    QRDBText14: TQRDBText;
    QRLabel49: TQRLabel;
    QRDBText31: TQRDBText;
    QRLabel9: TQRLabel;
    QRDBText6: TQRDBText;
    QRShape1: TQRShape;
    lP3bSim: TQRLabel;
    QRLabel12: TQRLabel;
    lP3tSim: TQRLabel;
    QRShape5: TQRShape;
    QRLabel13: TQRLabel;
    lP3aSim: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel22: TQRLabel;
    lP3eSim: TQRLabel;
    QRShape6: TQRShape;
    lP3meSim: TQRLabel;
    lP3miSim: TQRLabel;
    QRShape4: TQRShape;
    QRShape7: TQRShape;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    QRShape8: TQRShape;
    QRShape3: TQRShape;
    QRShape9: TQRShape;
    lP3cSim: TQRLabel;
    QRLabel28: TQRLabel;
    lP3mSim: TQRLabel;
    QRShape10: TQRShape;
    QRLabel50: TQRLabel;
    QRLabel51: TQRLabel;
    lP3deSim: TQRLabel;
    QRShape11: TQRShape;
    lP3agrSim: TQRLabel;
    lP3inSim: TQRLabel;
    QRShape13: TQRShape;
    QRLabel56: TQRLabel;
    QRLabel54: TQRLabel;
    lP3agiSim: TQRLabel;
    QRShape12: TQRShape;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRLabel33: TQRLabel;
    QRLabel34: TQRLabel;
    QRDBText15: TQRDBText;
    QRLabel35: TQRLabel;
    QRDBText16: TQRDBText;
    QRLabel37: TQRLabel;
    QRDBText17: TQRDBText;
    QRLabel38: TQRLabel;
    QRDBText18: TQRDBText;
    QRLabel39: TQRLabel;
    QRDBText19: TQRDBText;
    QRLabel40: TQRLabel;
    QRDBText20: TQRDBText;
    QRLabel41: TQRLabel;
    QRLabel42: TQRLabel;
    QRDBText21: TQRDBText;
    QRLabel43: TQRLabel;
    QRDBText22: TQRDBText;
    QRLabel44: TQRLabel;
    QRDBText24: TQRDBText;
    QRLabel45: TQRLabel;
    QRDBText25: TQRDBText;
    QRLabel46: TQRLabel;
    QRDBText26: TQRDBText;
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
    QRShape14: TQRShape;
    lPmedSim: TQRLabel;
    QRLabel29: TQRLabel;
    QRShape15: TQRShape;
    lPaliSim: TQRLabel;
    QRLabel48: TQRLabel;
    QRShape16: TQRShape;
    lPpiSim: TQRLabel;
    QRLabel53: TQRLabel;
    QRShape17: TQRShape;
    lPaneSim: TQRLabel;
    QRLabel57: TQRLabel;
    procedure tbPacienteCalcFields(DataSet: TDataSet);
  private

  public

  end;

var
  qrAnamInf: TqrAnamInf;

implementation

uses untdmDados, untQRAnamInf2, untPrincipal;

{$R *.DFM}

procedure TqrAnamInf.tbPacienteCalcFields(DataSet: TDataSet);
begin
  tbPacienteIdade.Value := frmPrincipal.CalcIdade(tbPacientePAC_NASC.Value, Now);
end;

end.
