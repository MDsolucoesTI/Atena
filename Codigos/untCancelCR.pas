//////////////////////////////////////////////////////////////////////////
// Criacao...........: 08/2008
// Sistema...........: Atena - Automacao Clinica Odontologica
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit untCancelCR;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, EMsgDlg, Grids, DBGrids, RXDBCtrl, StdCtrls, RxLookup, Mask,
  ToolEdit, RXCtrls, LMDControl, LMDBaseControl, LMDBaseGraphicControl,
  LMDBaseShape, LMDShapeControl, JvTransBtn, JvComponent, JvEnterTab,
  fcLabel, ExtCtrls, fcpanel, fcButton, fcImgBtn;

type
  TfrmCancelCR = class(TForm)
    pnTop: TfcPanel;
    fcLabel2: TfcLabel;
    JvEnterAsTab1: TJvEnterAsTab;
    pnBotoes: TfcPanel;
    btnSair: TJvTransparentButton;
    btnConfirmar: TJvTransparentButton;
    pnCentro: TfcPanel;
    LMDShapeControl1: TLMDShapeControl;
    RxLabel2: TRxLabel;
    RxLabel1: TRxLabel;
    RxLabel3: TRxLabel;
    RxLabel8: TRxLabel;
    dbDtFin: TDBDateEdit;
    dbDtIni: TDBDateEdit;
    cmblkPac: TRxDBLookupCombo;
    radPagto: TRadioButton;
    radTodas: TRadioButton;
    GridCancelCR: TRxDBGrid;
    btnLocPac: TfcImageBtn;
    MsgDlg: TEvMsgDlg;
    procedure btnLocPacClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCancelCR: TfrmCancelCR;

implementation

uses untLocPac;

{$R *.dfm}

procedure TfrmCancelCR.btnLocPacClick(Sender: TObject);
begin
  frmLocPac:=TfrmLocPac.create(application);
  frmLocPac.Show;
end;

procedure TfrmCancelCR.btnSairClick(Sender: TObject);
begin
  Close;
end;

end.
