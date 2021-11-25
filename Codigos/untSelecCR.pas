//////////////////////////////////////////////////////////////////////////
// Criacao...........: 08/2008
// Sistema...........: Atena - Automacao Clinica Odontologica
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit untSelecCR;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fcButton, fcImgBtn, EMsgDlg, StdCtrls, CurrEdit, RXDBCtrl,
  RxLookup, DBCtrls, Grids, DBGrids, Mask, ToolEdit, RXCtrls, LMDControl,
  LMDBaseControl, LMDBaseGraphicControl, LMDBaseShape, LMDShapeControl,
  JvTransBtn, JvComponent, JvEnterTab, fcLabel, ExtCtrls, fcpanel;

type
  TfrmSelecCR = class(TForm)
    pnTop: TfcPanel;
    fcLabel2: TfcLabel;
    JvEnterAsTab1: TJvEnterAsTab;
    pnBotoes: TfcPanel;
    Label2: TLabel;
    Label1: TLabel;
    btnConfirmar: TJvTransparentButton;
    btnCancelar: TJvTransparentButton;
    pnCentro: TfcPanel;
    LMDShapeControl1: TLMDShapeControl;
    RxLabel8: TRxLabel;
    RxLabel1: TRxLabel;
    RxLabel3: TRxLabel;
    RxLabel2: TRxLabel;
    RxLabel5: TRxLabel;
    RxLabel4: TRxLabel;
    cmblkPac: TRxDBLookupCombo;
    dbDtInicial: TDBDateEdit;
    dbDtFinal: TDBDateEdit;
    GridBaixaCR: TRxDBGrid;
    dbConta: TDBEdit;
    cmblkConta: TRxLookupEdit;
    dbJuros: TRxDBCalcEdit;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    btnLocPac: TfcImageBtn;
    MsgDlg: TEvMsgDlg;
    procedure btnCancelarClick(Sender: TObject);
    procedure btnLocPacClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSelecCR: TfrmSelecCR;

implementation

uses untLocPac;

{$R *.dfm}

procedure TfrmSelecCR.btnCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmSelecCR.btnLocPacClick(Sender: TObject);
begin
  frmLocPac:=TfrmLocPac.create(application);
  frmLocPac.show;
end;

end.
