//////////////////////////////////////////////////////////////////////////
// Criacao...........: 08/2008
// Sistema...........: Atena - Automacao Clinica Odontologica
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit untCancelCP;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, EMsgDlg, JvComponent, JvEnterTab, fcLabel, ExtCtrls, fcpanel,
  LMDControl, LMDBaseControl, LMDBaseGraphicControl, LMDBaseShape,
  LMDShapeControl, StdCtrls, Mask, ToolEdit, RXDBCtrl, RxLookup, RXCtrls,
  JvTransBtn, Grids, DBGrids;

type
  TfrmCancelCP = class(TForm)
    pnTop: TfcPanel;
    fcLabel2: TfcLabel;
    pnBotoes: TfcPanel;
    pnCentro: TfcPanel;
    JvEnterAsTab1: TJvEnterAsTab;
    btnSair: TJvTransparentButton;
    btnConfirmar: TJvTransparentButton;
    RxLabel8: TRxLabel;
    radTodas: TRadioButton;
    radPgto: TRadioButton;
    cmblkFornec: TRxDBLookupCombo;
    RxLabel3: TRxLabel;
    RxLabel1: TRxLabel;
    dbdtIni: TDBDateEdit;
    RxLabel2: TRxLabel;
    LMDShapeControl1: TLMDShapeControl;
    GridCancelCP: TRxDBGrid;
    MsgDlg: TEvMsgDlg;
    dbDtFin: TDBDateEdit;
    procedure btnSairClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCancelCP: TfrmCancelCP;

implementation

{$R *.dfm}

procedure TfrmCancelCP.btnSairClick(Sender: TObject);
begin
  Close;
end;

end.
