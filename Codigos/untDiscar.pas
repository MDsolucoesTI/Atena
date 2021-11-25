//////////////////////////////////////////////////////////////////////////
// Criacao...........: 08/2008
// Sistema...........: Atena - Automacao Clinica Odontologica
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit untDiscar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls, JvLabel, EMsgDlg, JvTransBtn,
  JvComponent, JvEnterTab, fcLabel, ExtCtrls, fcpanel;

type
  TfrmDiscar = class(TForm)
    pnTop: TfcPanel;
    fcLabel2: TfcLabel;
    pnBotoes: TfcPanel;
    JvEnterAsTab1: TJvEnterAsTab;
    btnDiscar: TJvTransparentButton;
    btnCancelar: TJvTransparentButton;
    pnCentro: TfcPanel;
    JvLabel1: TJvLabel;
    dbTel: TDBEdit;
    MsgDlg: TEvMsgDlg;
    procedure btnCancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDiscar: TfrmDiscar;

implementation

{$R *.dfm}

procedure TfrmDiscar.btnCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmDiscar.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := Cafree;
end;

end.
