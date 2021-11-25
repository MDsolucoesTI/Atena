//////////////////////////////////////////////////////////////////////////
// Criacao...........: 08/2008
// Sistema...........: Atena - Automacao Clinica Odontologica
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit untAgendaTel;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RxGIF, ExtCtrls, fcButton, fcImgBtn, fcShapeBtn, fcClearPanel,
  fcButtonGroup, Grids, BaseGrid, AdvGrid, JvComponent, JvTransBtn, jpeg,
  StdCtrls, Mask, DBCtrls, EMsgDlg, JvEnterTab, JvLabel, JvDBComb,
  RxLookup, JvLookup, EDBZero, EWall, fcImager;

type
  TfrmAgendaTel = class(TForm)
    GrupoBotoes: TfcButtonGroup;
    btnA: TfcShapeBtn;
    btnB: TfcShapeBtn;
    btnC: TfcShapeBtn;
    btnD: TfcShapeBtn;
    btnE: TfcShapeBtn;
    btnF: TfcShapeBtn;
    btnG: TfcShapeBtn;
    btnH: TfcShapeBtn;
    btnI: TfcShapeBtn;
    btnJ: TfcShapeBtn;
    btnK: TfcShapeBtn;
    btnL: TfcShapeBtn;
    btnM: TfcShapeBtn;
    btnN: TfcShapeBtn;
    btnO: TfcShapeBtn;
    btnP: TfcShapeBtn;
    btnQ: TfcShapeBtn;
    btnR: TfcShapeBtn;
    btnS: TfcShapeBtn;
    btnT: TfcShapeBtn;
    btnU: TfcShapeBtn;
    btnV: TfcShapeBtn;
    btnW: TfcShapeBtn;
    btnX: TfcShapeBtn;
    btnY: TfcShapeBtn;
    btnZ: TfcShapeBtn;
    btnPrimeiro: TJvTransparentButton;
    btnAnterior: TJvTransparentButton;
    btnProximo: TJvTransparentButton;
    btnUltimo: TJvTransparentButton;
    btnNovo: TJvTransparentButton;
    btnSair: TJvTransparentButton;
    JvLabel1: TJvLabel;
    JvEnterAsTab1: TJvEnterAsTab;
    dbNome: TDBEdit;
    JvLabel13: TJvLabel;
    dbEnd: TDBEdit;
    JvLabel14: TJvLabel;
    dbNum: TEvDBZeroEdit;
    JvLabel15: TJvLabel;
    DbCompl: TDBEdit;
    JvLabel16: TJvLabel;
    dbBairro: TDBEdit;
    JvLabel17: TJvLabel;
    dbCep: TDBEdit;
    JvLabel18: TJvLabel;
    cmbVisUF: TJvDBLookupCombo;
    JvLabel19: TJvLabel;
    cmbLkCidade: TRxDBLookupCombo;
    btnCadCid: TfcImageBtn;
    JvLabel11: TJvLabel;
    dbEmail: TDBEdit;
    BtnEmail: TfcImageBtn;
    JvLabel23: TJvLabel;
    cmbTel1: TJvDBComboBox;
    cmbTel2: TJvDBComboBox;
    cmbTel3: TJvDBComboBox;
    DbTel1: TDBEdit;
    dbTel2: TDBEdit;
    dbTel3: TDBEdit;
    btnTel1: TfcImageBtn;
    btnTel2: TfcImageBtn;
    btnTel3: TfcImageBtn;
    JvLabel20: TJvLabel;
    dbObs: TDBMemo;
    fcImager1: TfcImager;
    MsgDlg: TEvMsgDlg;
    procedure btnSairClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAgendaTel: TfrmAgendaTel;

implementation

uses untCadTel;

{$R *.dfm}

procedure TfrmAgendaTel.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmAgendaTel.btnNovoClick(Sender: TObject);
begin
  frmCadTel:=TfrmCadTel.create(application);
  frmCadTel.Show;
end;

procedure TfrmAgendaTel.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := Cafree;
end;

end.
