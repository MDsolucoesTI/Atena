//////////////////////////////////////////////////////////////////////////
// Criacao...........: 08/2008
// Sistema...........: Atena - Automacao Clinica Odontologica
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit untListaEspera;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, ExtCtrls, RackCtls, SpeedBar, jpeg, ToolEdit,
  RXDBCtrl, fcButton, fcImgBtn, Mask, RXCtrls, Grids, DBGrids, EDBFind, DB,
  RxLookup, RxGrdCpt, fcImage, fcimageform, fcImager, CurrEdit,
  LMDCustomControl, LMDCustomPanel, LMDCustomBevelPanel,
  LMDCustomParentPanel, LMDBackPanel, JvLabel, EMsgDlg, JvComponent,
  JvEnterTab, fcLabel, JvTransBtn, fcpanel;

type
  TfrmListaEspera = class(TForm)
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
    btnSair: TJvTransparentButton;
    pnTop: TfcPanel;
    JvEnterAsTab1: TJvEnterAsTab;
    fcLabel2: TfcLabel;
    pnCentro: TfcPanel;
    JvLabel7: TJvLabel;
    evdbfind1: TEvDBFind;
    JvLabel1: TJvLabel;
    dbData: TDBDateEdit;
    JvLabel4: TJvLabel;
    lookConv: TRxDBLookupCombo;
    JvLabel6: TJvLabel;
    dbTel1: TDBEdit;
    RxDBGrid1: TRxDBGrid;
    CurrencyEdit1: TCurrencyEdit;
    JvLabel9: TJvLabel;
    dbCelular: TDBEdit;
    JvLabel8: TJvLabel;
    dbTel2: TDBEdit;
    lookMedico: TRxDBLookupCombo;
    JvLabel5: TJvLabel;
    dbPaciente: TDBEdit;
    JvLabel2: TJvLabel;
    JvLabel3: TJvLabel;
    dbTipo: TDBComboBox;
    MsgDlg: TEvMsgDlg;
    procedure dbCelularExit(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmListaEspera: TfrmListaEspera;

implementation

uses untPrincipal;

{$R *.dfm}

procedure TfrmListaEspera.dbCelularExit(Sender: TObject);
begin
  pnBotoes.SetFocus;
end;

procedure TfrmListaEspera.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmListaEspera.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := Cafree;
end;

end.
