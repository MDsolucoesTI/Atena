//////////////////////////////////////////////////////////////////////////
// Criacao...........: 08/2008
// Sistema...........: Atena - Automacao Clinica Odontologica
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit untCadCompra;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, JvComponent, JvEnterTab, fcLabel, ExtCtrls, fcpanel, JvTransBtn,
  StdCtrls, Mask, DBCtrls, JvLabel, fcButton, fcImgBtn, RxLookup, CurrEdit,
  RXCtrls, ToolEdit, RXDBCtrl, LMDControl, LMDBaseControl,
  LMDBaseGraphicControl, LMDBaseShape, LMDShapeControl, JvToolEdit,
  JvCurrEdit, JvDBCtrl, JvPanel, JvTransparentPanel, Grids, DBGrids,
  EMsgDlg, RxDBComb, JvMaskEdit, JvSpin, JvDBSpinEdit;

type
  TfrmCadCompra = class(TForm)
    pnTop: TfcPanel;
    fcLabel2: TfcLabel;
    JvEnterAsTab1: TJvEnterAsTab;
    pnCentro: TfcPanel;
    pnBotoes: TfcPanel;
    btnPrimeiro: TJvTransparentButton;
    btnAnterior: TJvTransparentButton;
    btnProximo: TJvTransparentButton;
    btnUltimo: TJvTransparentButton;
    btnNovo: TJvTransparentButton;
    btnGravar: TJvTransparentButton;
    btnCancelar: TJvTransparentButton;
    btnAlterar: TJvTransparentButton;
    btnDeletar: TJvTransparentButton;
    btnLocalizar: TJvTransparentButton;
    btnSair: TJvTransparentButton;
    JvLabel10: TJvLabel;
    dbNumPed: TDBEdit;
    JvLabel19: TJvLabel;
    cmblkFornec: TRxDBLookupCombo;
    btnCadFornec: TfcImageBtn;
    JvLabel1: TJvLabel;
    dbSit: TDBEdit;
    JvLabel2: TJvLabel;
    dbAtend: TDBEdit;
    JvLabel7: TJvLabel;
    dbDtComp: TDBDateEdit;
    JvLabel3: TJvLabel;
    dbDtEntr: TDBDateEdit;
    RxLabel5: TRxLabel;
    RxLabel6: TRxLabel;
    RxLabel7: TRxLabel;
    JvLabel4: TJvLabel;
    cmblkMat: TRxDBLookupCombo;
    btnCadMat: TfcImageBtn;
    dbVlUnit: TJvDBCalcEdit;
    JvDBCalcEdit1: TJvDBCalcEdit;
    JvLabel5: TJvLabel;
    JvTransparentPanel1: TJvTransparentPanel;
    GridMat: TRxDBGrid;
    RxLabel1: TRxLabel;
    dbVlTot: TDBEdit;
    Bevel1: TBevel;
    dbUnid: TDBEdit;
    JvTransparentPanel2: TJvTransparentPanel;
    btnIncluir: TfcImageBtn;
    btnConfirmar: TJvTransparentButton;
    JvLabel25: TJvLabel;
    cmbReq: TRxDBComboBox;
    JvLabel6: TJvLabel;
    cmbPgto: TRxDBComboBox;
    JvLabel8: TJvLabel;
    dbParc: TJvDBSpinEdit;
    dbQtd: TDBEdit;
    btnFinPed: TfcImageBtn;
    MsgDlg: TEvMsgDlg;
    procedure btnSairClick(Sender: TObject);
    procedure btnCadMatClick(Sender: TObject);
    procedure btnCadFornecClick(Sender: TObject);
    procedure btnLocalizarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadCompra: TfrmCadCompra;

implementation

uses untCadMaterial, untCadFornec, untLocPed;

{$R *.dfm}

procedure TfrmCadCompra.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmCadCompra.btnCadMatClick(Sender: TObject);
begin
  frmCadMaterial:=TfrmCadMaterial.create(application);
  frmCadMaterial.Show;
end;

procedure TfrmCadCompra.btnCadFornecClick(Sender: TObject);
begin
  frmCadFornec:=TfrmCadFornec.create(application);
  frmCadFornec.Show;
end;

procedure TfrmCadCompra.btnLocalizarClick(Sender: TObject);
begin
  frmLocPed:=TfrmLocPed.create(application);
  frmLocPed.Show;
end;

end.
