//////////////////////////////////////////////////////////////////////////
// Criacao...........: 08/2008
// Sistema...........: Atena - Automacao Clinica Odontologica
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit untLocCPagar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fcLabel, ExtCtrls, fcpanel, EMsgDlg, JvComponent, JvEnterTab, DB,
  fcButton, fcImgBtn, RackCtls, StdCtrls, Grids, DBGrids, RXDBCtrl, RXCtrls,
  JvTransBtn;

type
  TfrmLocCPagar = class(TForm)
    pnTop: TfcPanel;
    fcLabel2: TfcLabel;
    pnCentro: TfcPanel;
    RxLabel3: TRxLabel;
    Cmbcampo: TComboBox;
    RxDBGrid1: TRxDBGrid;
    RxLabel1: TRxLabel;
    EdtValor: TEdit;
    EdtCampo: TEdit;
    LEDButton1: TLEDButton;
    RxLabel2: TRxLabel;
    JvEnterAsTab1: TJvEnterAsTab;
    pnBotoes: TfcPanel;
    btnLocalizar: TJvTransparentButton;
    btnSair: TJvTransparentButton;
    MsgDlg: TEvMsgDlg;
    procedure fclSairClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure CmbcampoExit(Sender: TObject);
    procedure LEDButton1DblClick(Sender: TObject);
    procedure btnLocalizarClick(Sender: TObject);
    procedure RxDBGrid1GetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure FormActivate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLocCPagar: TfrmLocCPagar;
      LocOpts : TlocateOptions;
    NumDocTab : String;
          Cor : boolean;
      vertipo : char;
implementation

uses untdmDados, untPrincipal;

{$R *.dfm}

procedure TfrmLocCPagar.fclSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmLocCPagar.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmLocCPagar.CmbcampoExit(Sender: TObject);
begin
  if cmbCampo.Text = 'Documento' then
    edtCampo.Text:='NumDoc';
end;

procedure TfrmLocCPagar.LEDButton1DblClick(Sender: TObject);
begin
  if LEDButton1.StateOn then
    LEDButton1.StateOn:=False
  else
    LEDButton1.StateOn:=True;
end;

procedure TfrmLocCPagar.btnLocalizarClick(Sender: TObject);
begin
  if (vertipo='I') and (StrToIntDef(edtvalor.text,-1)= -1) then
    begin
    MsgDlg.MsgError('Valor digitado deve ser num�rico');
    edtvalor.SetFocus;
    abort;
    end;
  LocOpts:=[];
  if LEDButton1.StateOn then LocOpts:=LocOpts+[loPartialKey];
  if not dmdados.tbCpagar.locate(edtCampo.Text, edtValor.text,LocOpts) then
    MsgDlg.MsgWarning('N�o foi encontrado o valor ' + edtValor.text + ' para o campo '+ cmbCampo.text)
  else
    begin
    cor := true;
    NumDocTab := dmDados.tbCpagarNumDoc.Value;
    end;
  Cmbcampo.SetFocus;
end;

procedure TfrmLocCPagar.RxDBGrid1GetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
var
  doc : string;
begin
  doc :=(Sender as TrxDBGrid).DataSource.DataSet.FieldByName('NumDoc').asString;
  if cor then
    if doc = NumDocTab then
     background:=$00E9FFE1;
end;

procedure TfrmLocCPagar.FormActivate(Sender: TObject);
begin
  frmPrincipal.StatusTeclas(False,'');
end;

procedure TfrmLocCPagar.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key=VK_ESCAPE then
    btnSair.Click;
  if Key=VK_PRIOR then
    LEDButton1DblClick(Sender);
end;

end.
