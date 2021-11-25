//////////////////////////////////////////////////////////////////////////
// Criacao...........: 08/2008
// Sistema...........: Atena - Automacao Clinica Odontologica
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit untEscMens;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, JvTransBtn, EMsgDlg, JvComponent, JvEnterTab, fcLabel, ExtCtrls,
  fcpanel, StdCtrls, RxDBComb, DBCtrls, Mask, JvLabel;

type
  TfrmEscMens = class(TForm)
    pnTop: TfcPanel;
    fcLabel2: TfcLabel;
    JvEnterAsTab1: TJvEnterAsTab;
    MsgDlg: TEvMsgDlg;
    pnBotoes: TfcPanel;
    pnCentro: TfcPanel;
    btnEnviar: TJvTransparentButton;
    btnCancelar: TJvTransparentButton;
    JvLabel1: TJvLabel;
    JvLabel2: TJvLabel;
    JvLabel3: TJvLabel;
    dbAssunto: TDBMemo;
    cmbPara: TRxDBComboBox;
    dbDest: TDBEdit;
    procedure btnCancelarClick(Sender: TObject);
    procedure dbAssuntoExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmEscMens: TfrmEscMens;

implementation

{$R *.dfm}

procedure TfrmEscMens.btnCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmEscMens.dbAssuntoExit(Sender: TObject);
begin
  pnBotoes.SetFocus;
end;

end.
