//////////////////////////////////////////////////////////////////////////
// Criacao...........: 08/2008
// Sistema...........: Atena - Automacao Clinica Odontologica
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit untBaixaLoteCP;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, EMsgDlg, JvComponent, JvEnterTab, fcLabel, ExtCtrls, fcpanel,
  JvToolEdit, JvCurrEdit, JvDBCtrl, CurrEdit, Mask, ToolEdit, RXDBCtrl,
  LMDControl, LMDBaseControl, LMDBaseGraphicControl, LMDBaseShape,
  LMDShapeControl, StdCtrls, DBCtrls, RXCtrls, Grids, DBGrids, JvTransBtn,
  Menus, RxMenus;

type
  TfrmBaixaLoteCP = class(TForm)
    pnTop: TfcPanel;
    fcLabel2: TfcLabel;
    JvEnterAsTab1: TJvEnterAsTab;
    pnCentro: TfcPanel;
    pnBotoes: TfcPanel;
    btnSelConta: TJvTransparentButton;
    btnBaixa: TJvTransparentButton;
    btnSair: TJvTransparentButton;
    dbgridBaixaCP: TRxDBGrid;
    RxLabel1: TRxLabel;
    DBMemo1: TDBMemo;
    RxLabel13: TRxLabel;
    LMDShapeControl1: TLMDShapeControl;
    RxLabel4: TRxLabel;
    dbDtReceb: TDBDateEdit;
    RxLabel8: TRxLabel;
    RxLabel9: TRxLabel;
    edtSubTot: TCurrencyEdit;
    edtJuros: TCurrencyEdit;
    edtDesc: TCurrencyEdit;
    RxLabel10: TRxLabel;
    RxLabel11: TRxLabel;
    CurrencyEdit4: TCurrencyEdit;
    RxLabel12: TRxLabel;
    dbVlPg: TJvDBCalcEdit;
    popGrid: TRxPopupMenu;
    DefinirJurosMulta1: TMenuItem;
    Desconto1: TMenuItem;
    ZerarJurosMulta1: TMenuItem;
    ZerarDesconto1: TMenuItem;
    RetirarTodasasContas1: TMenuItem;
    MsgDlg: TEvMsgDlg;
    procedure btnSairClick(Sender: TObject);
    procedure btnSelContaClick(Sender: TObject);
    procedure btnBaixaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmBaixaLoteCP: TfrmBaixaLoteCP;

implementation

uses untSelecCP, untdmDados, untTipoPagto;

{$R *.dfm}

procedure TfrmBaixaLoteCP.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmBaixaLoteCP.btnSelContaClick(Sender: TObject);
begin
  frmSelecCP:=TfrmSelecCP.create(application);
  frmSelecCP.show;
end;

procedure TfrmBaixaLoteCP.btnBaixaClick(Sender: TObject);
begin
  frmTipoPgto:=TfrmTipoPgto.create(application);
  frmTipoPgto.show;
end;

end.
