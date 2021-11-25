//////////////////////////////////////////////////////////////////////////
// Criacao...........: 08/2008
// Sistema...........: Atena - Automacao Clinica Odontologica
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit untCadPlanoPagto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, EMsgDlg, JvComponent, JvEnterTab, fcLabel, ExtCtrls, fcpanel,
  EDBNum, StdCtrls, RxDBComb, Mask, DBCtrls, RXCtrls, EDBZero, ToolEdit,
  CurrEdit, RXDBCtrl, lmdstdcA, Grids, DBGrids, JvTransBtn, JvMaskEdit,
  JvSpin, JvDBSpinEdit;

type
  TfrmCadPlanoPagto = class(TForm)
    pnTop: TfcPanel;
    fcLabel2: TfcLabel;
    JvEnterAsTab1: TJvEnterAsTab;
    pnCentro: TfcPanel;
    pnBotoes: TfcPanel;
    RxLabel1: TRxLabel;
    RxLabel2: TRxLabel;
    cmbEnt: TRxDBComboBox;
    RxLabel10: TRxLabel;
    RxLabel11: TRxLabel;
    RxLabel13: TRxLabel;
    dbPlano: TDBEdit;
    RxLabel3: TRxLabel;
    dbJuros: TRxDBCalcEdit;
    RxLabel9: TRxLabel;
    dbVenc: TDateEdit;
    GridPlano: TRxDBGrid;
    btnPrimeiro: TJvTransparentButton;
    btnAnterior: TJvTransparentButton;
    btnProximo: TJvTransparentButton;
    btnUltimo: TJvTransparentButton;
    btnNovo: TJvTransparentButton;
    btnGravar: TJvTransparentButton;
    btnCancelar: TJvTransparentButton;
    btnAlterar: TJvTransparentButton;
    btnDeletar: TJvTransparentButton;
    btnSair: TJvTransparentButton;
    dbNumdia: TJvDBSpinEdit;
    dbNumPre: TJvDBSpinEdit;
    dbIntervalo: TJvDBSpinEdit;
    MsgDlg: TEvMsgDlg;
    procedure btnSairClick(Sender: TObject);
    procedure dbJurosExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadPlanoPagto: TfrmCadPlanoPagto;

implementation

{$R *.dfm}

procedure TfrmCadPlanoPagto.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmCadPlanoPagto.dbJurosExit(Sender: TObject);
begin
  pnBotoes.SetFocus;
end;

end.
