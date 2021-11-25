//////////////////////////////////////////////////////////////////////////
// Criacao...........: 08/2008
// Sistema...........: Atena - Automacao Clinica Odontologica
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit untEstatistica;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fcLabel, ExtCtrls, fcpanel, EGauge, ToolEdit, RXDBCtrl,
  StdCtrls, Mask, CurrEdit, Grids, DBGrids, DBCtrls, RXCtrls, JvComponent,
  JvTransBtn, EMsgDlg;

type
  TfrmEstatistica = class(TForm)
    pnTop: TfcPanel;
    fcLabel2: TfcLabel;
    pnCentro: TfcPanel;
    pnBotoes: TfcPanel;
    RxLabel12: TRxLabel;
    CmbTipo: TDBComboBox;
    gridEstat: TRxDBGrid;
    RxLabel5: TRxLabel;
    CurrencyEdit1: TCurrencyEdit;
    CurrencyEdit2: TCurrencyEdit;
    CurrencyEdit3: TCurrencyEdit;
    CurrencyEdit4: TCurrencyEdit;
    CurrencyEdit5: TCurrencyEdit;
    CurrencyEdit8: TCurrencyEdit;
    CurrencyEdit7: TCurrencyEdit;
    CurrencyEdit6: TCurrencyEdit;
    Bevel1: TBevel;
    RxLabel7: TRxLabel;
    dbDataIn: TDBDateEdit;
    RxLabel3: TRxLabel;
    dbDataFin: TDBDateEdit;
    EvGauge1: TEvGauge;
    btnIniciar: TJvTransparentButton;
    btnCancelar: TJvTransparentButton;
    btnImprimir: TJvTransparentButton;
    btnSair: TJvTransparentButton;
    MsgDlg: TEvMsgDlg;
    procedure btnSairClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmEstatistica: TfrmEstatistica;

implementation

{$R *.dfm}

procedure TfrmEstatistica.btnSairClick(Sender: TObject);
begin
  Close;
end;

end.
