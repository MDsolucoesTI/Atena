//////////////////////////////////////////////////////////////////////////
// Criacao...........: 08/2008
// Sistema...........: Atena - Automacao Clinica Odontologica
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit untRelFornec;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, EMsgDlg, JvTransBtn, JvComponent, JvEnterTab, StdCtrls,
  JvCombobox, JvLabel, fcLabel, ExtCtrls, fcpanel;

type
  TfrmRelFornec = class(TForm)
    pnTop: TfcPanel;
    fcLabel2: TfcLabel;
    pnCentro: TfcPanel;
    JvLabel10: TJvLabel;
    JvLabel1: TJvLabel;
    cmbclassif: TJvComboBox;
    cmbDestino: TJvComboBox;
    pnBotoes: TfcPanel;
    JvEnterAsTab1: TJvEnterAsTab;
    btnImprimir: TJvTransparentButton;
    btnSair: TJvTransparentButton;
    MsgDlg: TEvMsgDlg;
    procedure cmbDestinoExit(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelFornec: TfrmRelFornec;

implementation

{$R *.dfm}

procedure TfrmRelFornec.cmbDestinoExit(Sender: TObject);
begin
  pnBotoes.SetFocus;
end;

procedure TfrmRelFornec.btnSairClick(Sender: TObject);
begin
  Close;
end;

end.
