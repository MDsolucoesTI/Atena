//////////////////////////////////////////////////////////////////////////
// Criacao...........: 08/2008
// Sistema...........: Atena - Automacao Clinica Odontologica
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit untRelFunc;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, EMsgDlg, StdCtrls, JvCombobox, JvLabel, JvTransBtn, JvComponent,
  JvEnterTab, fcLabel, ExtCtrls, fcpanel;

type
  TfrmRelFunc = class(TForm)
    pnTop: TfcPanel;
    fcLabel2: TfcLabel;
    pnBotoes: TfcPanel;
    JvEnterAsTab1: TJvEnterAsTab;
    btnImprimir: TJvTransparentButton;
    btnSair: TJvTransparentButton;
    pnCentro: TfcPanel;
    JvLabel10: TJvLabel;
    JvLabel1: TJvLabel;
    cmbclassif: TJvComboBox;
    cmbDestino: TJvComboBox;
    MsgDlg: TEvMsgDlg;
    procedure btnSairClick(Sender: TObject);
    procedure cmbDestinoExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelFunc: TfrmRelFunc;

implementation

{$R *.dfm}

procedure TfrmRelFunc.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmRelFunc.cmbDestinoExit(Sender: TObject);
begin
  pnBotoes.SetFocus;
end;

end.
