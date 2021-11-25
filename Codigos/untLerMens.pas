//////////////////////////////////////////////////////////////////////////
// Criacao...........: 08/2008
// Sistema...........: Atena - Automacao Clinica Odontologica
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit untLerMens;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, JvTransBtn, Mask, DBCtrls, StdCtrls, RxDBComb, JvLabel,
  JvComponent, JvEnterTab, fcLabel, ExtCtrls, fcpanel, EMsgDlg;

type
  TfrmLerMens = class(TForm)
    MsgDlg: TEvMsgDlg;
    pnTop: TfcPanel;
    fcLabel2: TfcLabel;
    JvEnterAsTab1: TJvEnterAsTab;
    pnCentro: TfcPanel;
    JvLabel1: TJvLabel;
    JvLabel2: TJvLabel;
    JvLabel3: TJvLabel;
    dbAssunto: TDBMemo;
    cmbPara: TRxDBComboBox;
    dbDest: TDBEdit;
    pnBotoes: TfcPanel;
    btnResponder: TJvTransparentButton;
    btnCancelar: TJvTransparentButton;
    btnDeletar: TJvTransparentButton;
    procedure btnCancelarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLerMens: TfrmLerMens;

implementation

{$R *.dfm}

procedure TfrmLerMens.btnCancelarClick(Sender: TObject);
begin
  Close;
end;

end.
