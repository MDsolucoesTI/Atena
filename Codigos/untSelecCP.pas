//////////////////////////////////////////////////////////////////////////
// Criacao...........: 08/2008
// Sistema...........: Atena - Automacao Clinica Odontologica
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit untSelecCP;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, EMsgDlg, JvComponent, JvEnterTab, fcLabel, ExtCtrls, fcpanel,
  JvTransBtn, StdCtrls, RxLookup, DBCtrls, CurrEdit, Grids, DBGrids,
  RXDBCtrl, fcButton, fcImgBtn, Mask, ToolEdit, RXCtrls, LMDControl,
  LMDBaseControl, LMDBaseGraphicControl, LMDBaseShape, LMDShapeControl;

type
  TfrmSelecCP = class(TForm)
    pnTop: TfcPanel;
    fcLabel2: TfcLabel;
    JvEnterAsTab1: TJvEnterAsTab;
    pnCentro: TfcPanel;
    pnBotoes: TfcPanel;
    Label2: TLabel;
    Label1: TLabel;
    btnConfirmar: TJvTransparentButton;
    btnCancelar: TJvTransparentButton;
    LMDShapeControl1: TLMDShapeControl;
    RadioButton1: TRadioButton;
    RxLabel8: TRxLabel;
    RxLabel1: TRxLabel;
    RadioButton2: TRadioButton;
    RxLabel3: TRxLabel;
    cmblkFornec: TRxDBLookupCombo;
    dbDtInicial: TDBDateEdit;
    RxLabel2: TRxLabel;
    dbDtFinal: TDBDateEdit;
    GridBaixaCP: TRxDBGrid;
    RxLabel5: TRxLabel;
    dbConta: TDBEdit;
    cmblkConta: TRxLookupEdit;
    RxLabel4: TRxLabel;
    dbJuros: TRxDBCalcEdit;
    MsgDlg: TEvMsgDlg;
    procedure btnCancelarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSelecCP: TfrmSelecCP;

implementation

{$R *.dfm}

procedure TfrmSelecCP.btnCancelarClick(Sender: TObject);
begin
  Close;
end;

end.
