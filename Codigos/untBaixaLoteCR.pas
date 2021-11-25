//////////////////////////////////////////////////////////////////////////
// Criacao...........: 08/2008
// Sistema...........: Atena - Automacao Clinica Odontologica
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit untBaixaLoteCR;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, JvTransBtn, JvToolEdit, JvCurrEdit, JvDBCtrl, CurrEdit, Mask,
  ToolEdit, RXDBCtrl, StdCtrls, DBCtrls, Grids, DBGrids, LMDControl,
  LMDBaseControl, LMDBaseGraphicControl, LMDBaseShape, LMDShapeControl,
  RXCtrls, JvComponent, JvEnterTab, fcLabel, ExtCtrls, fcpanel, Menus,
  RxMenus, EMsgDlg;

type
  TfrmBaixaLoteCR = class(TForm)
    pnTop: TfcPanel;
    fcLabel2: TfcLabel;
    JvEnterAsTab1: TJvEnterAsTab;
    pnCentro: TfcPanel;
    RxLabel1: TRxLabel;
    RxLabel13: TRxLabel;
    LMDShapeControl1: TLMDShapeControl;
    RxLabel4: TRxLabel;
    RxLabel8: TRxLabel;
    RxLabel9: TRxLabel;
    RxLabel10: TRxLabel;
    RxLabel11: TRxLabel;
    RxLabel12: TRxLabel;
    dbgridBaixaCP: TRxDBGrid;
    dbDet: TDBMemo;
    dbDtReceb: TDBDateEdit;
    edtSubTot: TCurrencyEdit;
    edtJuros: TCurrencyEdit;
    edtDesc: TCurrencyEdit;
    CurrencyEdit4: TCurrencyEdit;
    dbVlPg: TJvDBCalcEdit;
    pnBotoes: TfcPanel;
    btnSelConta: TJvTransparentButton;
    btnBaixa: TJvTransparentButton;
    btnSair: TJvTransparentButton;
    popGrid: TRxPopupMenu;
    DefinirJurosMulta1: TMenuItem;
    Desconto1: TMenuItem;
    ZerarJurosMulta1: TMenuItem;
    ZerarDesconto1: TMenuItem;
    RetirarTodasasContas1: TMenuItem;
    MsgDlg: TEvMsgDlg;
    procedure btnSelContaClick(Sender: TObject);
    procedure btnBaixaClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmBaixaLoteCR: TfrmBaixaLoteCR;

implementation

uses untSelecCR, unitTipoReceb;

{$R *.dfm}

procedure TfrmBaixaLoteCR.btnSelContaClick(Sender: TObject);
begin
  frmSelecCR:=TfrmSelecCR.create(application);
  frmSelecCR.show;
end;

procedure TfrmBaixaLoteCR.btnBaixaClick(Sender: TObject);
begin
  frmTipoReceb:=TfrmTipoReceb.create(application);
  frmTipoReceb.show;
end;

procedure TfrmBaixaLoteCR.btnSairClick(Sender: TObject);
begin
  Close;
end;

end.
