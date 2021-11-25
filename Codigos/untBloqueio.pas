//////////////////////////////////////////////////////////////////////////
// Criacao...........: 08/2008
// Sistema...........: Atena - Automacao Clinica Odontologica
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit untBloqueio;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, ToolEdit, RXDBCtrl, JvLabel, JvComponent,
  JvEnterTab, fcLabel, ExtCtrls, fcpanel, JvTransBtn, DBCtrls, EMsgDlg;

type
  TfrmBloqueio = class(TForm)
    pnTop: TfcPanel;
    fcLabel2: TfcLabel;
    pnCentro: TfcPanel;
    pnBotoes: TfcPanel;
    dbDtInicial: TDBDateEdit;
    JvLabel2: TJvLabel;
    dbDtFinal: TDBDateEdit;
    JvLabel3: TJvLabel;
    JvLabel1: TJvLabel;
    JvEnterAsTab1: TJvEnterAsTab;
    btnGravar: TJvTransparentButton;
    btnCancelar: TJvTransparentButton;
    dbMotivo: TDBEdit;
    MsgDlg: TEvMsgDlg;
    procedure btnCancelarClick(Sender: TObject);
    procedure dbMotivoExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmBloqueio: TfrmBloqueio;

implementation

{$R *.dfm}

procedure TfrmBloqueio.btnCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmBloqueio.dbMotivoExit(Sender: TObject);
begin
  pnBotoes.SetFocus;

end;

procedure TfrmBloqueio.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := Cafree;
end;

end.
