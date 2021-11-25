//////////////////////////////////////////////////////////////////////////
// Criacao...........: 08/2008
// Sistema...........: Atena - Automacao Clinica Odontologica
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit untLocPac;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  CurrEdit, RXDBCtrl, ToolEdit, RXSplit, fcButton, fcImgBtn, Grids,
  DBGrids, StdCtrls, DBCtrls, Mask, ExtCtrls, RXCtrls, RackCtls, jpeg, DBTables,
  DB, EnhEdit, LMDCustomComponent, LMDCustomHint, LMDCustomShapeHint,
  LMDShapeHint, EFocCol, RxGrdCpt, fcImager, EMsgDlg, LMDCustomControl,
  LMDCustomPanel, LMDCustomBevelPanel, LMDCustomParentPanel, LMDBackPanel,
  fcLabel, EGrad, JvLabel, JvComponent, JvEnterTab, JvTransBtn, fcpanel;

type
  TfrmLocPac = class(TForm)
    pnTop: TLMDBackPanel;
    pnCentro: TLMDBackPanel;
    Cmbcampo: TComboBox;
    gridPac: TRxDBGrid;
    EdtCampo: TEdit;
    EdtValor: TEdit;
    LEDButton1: TLEDButton;
    RxLabel2: TRxLabel;
    fcLabel1: TfcLabel;
    JvLabel13: TJvLabel;
    JvLabel1: TJvLabel;
    JvEnterAsTab1: TJvEnterAsTab;
    pnBotoes: TfcPanel;
    btnLocalizar: TJvTransparentButton;
    btnSair: TJvTransparentButton;
    MsgDlg: TEvMsgDlg;
    procedure fclSairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnSairClick(Sender: TObject);
    procedure CmbcampoExit(Sender: TObject);
    procedure LEDButton1DblClick(Sender: TObject);
    procedure btnLocalizarClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure gridPacGetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);

  private
    { Private declarations }
     fresultado : longint;
     nomeCli    : string ;
     rest       : string ;
     fcpf       : string ;
  public
    { Public declarations }
     Property Resultado : longint Read Fresultado Write Fresultado;
     Property Nome      : string  Read NomeCli    Write NomeCli   ;
     Property Restricao : string  Read rest       Write rest      ;
     Property CPF       : string  Read fcpf       write fcpf      ;
  end;

var
  frmLocPac : TfrmLocPac     ;
  LocOpts   : TLocateOptions ;
  Cor       : Boolean        ;
  PorNome   : Boolean        ;
  PorCod    : Boolean        ;
  PorCPF    : Boolean        ;
  NomeTab   : String         ;
  CpfTab    : String         ;
  CodTab    : LongInt        ;
  VerTipo   : Char           ;

implementation

uses untPrincipal, untdmDados;

{$R *.DFM}

procedure TfrmLocPac.fclSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmLocPac.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  frmPrincipal.StatusTeclas(False,'');
end;

procedure TfrmLocPac.btnSairClick(Sender: TObject);
begin
  resultado := dmdados.tbPacientePAC_CODIGO.Value;
  nome      := dmDados.tbPacientePAC_NOME.Value;
  CPF       := dmdados.tbPacientePAC_CPF.value;
  Close;
end;

procedure TfrmLocPac.CmbcampoExit(Sender: TObject);
begin
  PorNome:=False;
  PorCod:=False;
  PorCPF:= False;
  if cmbCampo.Text = 'C�digo' Then
    Begin
    VerTipo:='I';
    PorCod:=True;
    edtCampo.Text:='Pac_Codigo';
    End
  Else if cmbcampo.text = 'Paciente' then
    Begin
    VerTipo:='K';
    PorNome:=True;
    edtCampo.Text:='Pac_Nome';
    End
  Else if cmbcampo.text = 'CPF' then
    Begin
    VerTipo:='K';
    PorCpf:=True;
    edtCampo.Text:='Pac_CPF';
    End;
end;

procedure TfrmLocPac.LEDButton1DblClick(Sender: TObject);
begin
  if LEDButton1.StateOn then
    LEDButton1.StateOn:=False
  else
    LEDButton1.StateOn:=True;
end;

procedure TfrmLocPac.btnLocalizarClick(Sender: TObject);
begin
{verificando se dado digitado corresponde ao tipo}
  if (vertipo='I') and (StrToIntDef(edtvalor.text,-1)= -1) then
    begin
    MsgDlg.MsgError('Valor digitado deve ser num�rico');
    edtvalor.SetFocus;
    abort;
    end;
  LocOpts:=[];
  if LEDButton1.StateOn then
    LocOpts:=LocOpts+[loPartialKey];
  If not dmDados.tbPaciente.locate(EdtCampo.Text,edtValor.text,LocOpts) Then
    begin
    MsgDlg.MsgInformation('N�o foi encontrado o valor ' + edtValor.text + ' para o campo '+ cmbCampo.text);
    end
  else
    Begin
    cor := true;
    If PorNome Then
      NomeTab:=dmDados.tbPacientePAC_NOME.Value;
    If PorCod Then
      CodTab:=dmDados.tbPacientePAC_CODIGO.Value;
    If PorCpf Then
      CpfTab:=dmDados.tbPacientePAC_CPF.Value;
    end;
  Cmbcampo.SetFocus;
end;

procedure TfrmLocPac.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key=VK_ESCAPE then
    btnSair.Click;
  if Key=VK_PRIOR then
    LEDButton1DblClick(Sender);
  if Key=VK_F10 then
    btnLocalizar.Click;
end;

procedure TfrmLocPac.FormShow(Sender: TObject);
begin
  FrmPrincipal.StatusTeclas(True,'[PageUp] A=ABC [F10] Localizar [ESC] Sai');
  Cor := False;
end;

procedure TfrmLocPac.gridPacGetCellParams(Sender: TObject; Field: TField;
  AFont: TFont; var Background: TColor; Highlight: Boolean);
var
  NOME   : string ;
  CPF    : string ;
  CODIGO : longInt;
begin
  NOME   := (Sender as TrxDBGrid).DataSource.DataSet.FieldByName('Pac_Nome').asString;
  CODIGO := (Sender as TrxDBGrid).DataSource.DataSet.FieldByName('Pac_Codigo').asInteger;
  CPF    := (Sender as TrxDBGrid).DataSource.DataSet.FieldByName('Pac_CPF').asString;
  if cor then
    begin
    If PorNome Then
      If NOME = NomeTab Then
        background:=$00E9FFE1;
    If PorCod Then
      If CODIGO = CodTab Then
        background:=$00E9FFE1;
    If PorCpf Then
      If CPF = CPFTab Then
        background:=$00E9FFE1;
    end;
end;

end.
