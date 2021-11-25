//////////////////////////////////////////////////////////////////////////
// Criacao...........: 08/2008
// Sistema...........: Atena - Automacao Clinica Odontologica
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit untEncaixe;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, EMsgDlg, JvTransBtn, JvComponent, JvEnterTab, fcLabel, ExtCtrls,
  fcpanel, EDBTime, StdCtrls, DBCtrls, EDBFind, Mask, ToolEdit, RXDBCtrl,
  RXCtrls, fcButton, fcImgBtn, RxLookup, JvLabel;

type
  TfrmEncaixe = class(TForm)
    pnTop: TfcPanel;
    fcLabel2: TfcLabel;
    pnBotoes: TfcPanel;
    JvEnterAsTab1: TJvEnterAsTab;
    btnConfirmar: TJvTransparentButton;
    btnCancelar: TJvTransparentButton;
    pnCentro: TfcPanel;
    RxLabel13: TRxLabel;
    dbData: TDBDateEdit;
    RxLabel2: TRxLabel;
    RxLabel1: TRxLabel;
    dbTel1: TDBEdit;
    RxLabel6: TRxLabel;
    dbTel2: TDBEdit;
    RxLabel3: TRxLabel;
    RxLabel9: TRxLabel;
    dbHora: TEvDBTimeEdit;
    RxLabel8: TRxLabel;
    btnCadRap: TfcImageBtn;
    dbConv: TDBEdit;
    cmblkTipo: TRxDBLookupCombo;
    JvLabel20: TJvLabel;
    dbObs: TDBMemo;
    dbNome: TDBEdit;
    FindPac: TEvDBFind;
    MsgDlg: TEvMsgDlg;
    procedure btnCancelarClick(Sender: TObject);
    procedure btnCadRapClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmEncaixe: TfrmEncaixe;

implementation

uses untCadRapid;

{$R *.dfm}

procedure TfrmEncaixe.btnCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmEncaixe.btnCadRapClick(Sender: TObject);
begin
  frmCadRapid:=TfrmCadRapid.create(application);
  frmCadRapid.ShowModal;
end;

end.
