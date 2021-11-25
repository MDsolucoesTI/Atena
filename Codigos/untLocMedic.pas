//////////////////////////////////////////////////////////////////////////
// Criacao...........: 08/2008
// Sistema...........: Atena - Automacao Clinica Odontologica
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit untLocMedic;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fcButton, fcImgBtn, StdCtrls, Grids, DBGrids, RXDBCtrl, JvLabel,
  RXCtrls, RackCtls, JvComponent, JvEnterTab, fcLabel, LMDCustomControl, DB,
  LMDCustomPanel, LMDCustomBevelPanel, LMDCustomParentPanel, LMDBackPanel,
  EMsgDlg, JvTransBtn, ExtCtrls, fcpanel;

type
  TfrmLocMedic = class(TForm)
    pnTop: TLMDBackPanel;
    fcLabel1: TfcLabel;
    JvEnterAsTab1: TJvEnterAsTab;
    pnCentro: TLMDBackPanel;
    LEDButton1: TLEDButton;
    RxLabel2: TRxLabel;
    JvLabel13: TJvLabel;
    JvLabel1: TJvLabel;
    Cmbcampo: TComboBox;
    dbGridMedic: TRxDBGrid;
    EdtCampo: TEdit;
    EdtValor: TEdit;
    pnBotoes: TfcPanel;
    btnLocalizar: TJvTransparentButton;
    btnSair: TJvTransparentButton;
    MsgDlg: TEvMsgDlg;
    procedure fclSairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnSairClick(Sender: TObject);
    procedure CmbcampoExit(Sender: TObject);
    procedure LEDButton1DblClick(Sender: TObject);
    procedure dbGridMedicGetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure btnLocalizarClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
     fresultado : longint;
     nomeCli    : string ;
     rest       : string ;
  public
    { Public declarations }
     Property Resultado : longint Read Fresultado Write Fresultado;
     Property Nome      : string  Read NomeCli    Write NomeCli   ;
     Property Restricao : string  Read rest       Write rest      ;
  end;

var
  frmLocMedic: TfrmLocMedic;
  LocOpts   : TLocateOptions ;
  Cor       : Boolean        ;
  PorNome   : Boolean        ;
  NomeTab   : String         ;
  VerTipo   : Char           ;

implementation

uses untdmDados, untPrincipal;

{$R *.dfm}

procedure TfrmLocMedic.fclSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmLocMedic.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  frmPrincipal.StatusTeclas(False,'');
end;

procedure TfrmLocMedic.btnSairClick(Sender: TObject);
begin
  resultado := dmdados.tbMedicamentoCodMedic.Value;
  nome      := dmDados.tbMedicamentoNome.Value;
  Close;
end;

procedure TfrmLocMedic.CmbcampoExit(Sender: TObject);
begin
  PorNome:=False;
  if cmbCampo.Text = 'Nome' Then
    Begin
    VerTipo:='I';
    PorNome := True;
    edtCampo.Text:='Nome';
    End
end;

procedure TfrmLocMedic.LEDButton1DblClick(Sender: TObject);
begin
  if LEDButton1.StateOn then
    LEDButton1.StateOn:=False
  else
    LEDButton1.StateOn:=True;
end;

procedure TfrmLocMedic.dbGridMedicGetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
var
  NOME   : string ;
begin
  NOME   := (Sender as TrxDBGrid).DataSource.DataSet.FieldByName('Nome').asString;
  if cor then
    begin
    If PorNome Then
      If NOME = NomeTab Then
        background:=$00E9FFE1;
    end;
end;

procedure TfrmLocMedic.btnLocalizarClick(Sender: TObject);
begin
  LocOpts:=[];
  if LEDButton1.StateOn then
    LocOpts:=LocOpts+[loPartialKey];
  If not dmDados.tbMedicamento.locate(EdtCampo.Text,edtValor.text,LocOpts) Then
    begin
    MsgDlg.MsgInformation('N�o foi encontrado o valor ' + edtValor.text + ' para o campo '+ cmbCampo.text);
    end
  else
    Begin
    cor := True;
    If PorNome Then
      NomeTab:=dmDados.tbMedicamentoNome.Value;
    end;
  Cmbcampo.SetFocus;
end;

procedure TfrmLocMedic.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key=VK_ESCAPE then
    btnSair.Click;
  if Key=VK_PRIOR then
    LEDButton1DblClick(Sender);
  if Key=VK_F10 then
    btnLocalizar.Click;
end;

procedure TfrmLocMedic.FormShow(Sender: TObject);
begin
  FrmPrincipal.StatusTeclas(True,'[PageUp] A=ABC [F10] Localizar [ESC] Sai');
  Cor := False;
end;

end.
