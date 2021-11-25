//////////////////////////////////////////////////////////////////////////
// Criacao...........: 08/2008
// Sistema...........: Atena - Automacao Clinica Odontologica
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit untAnive;


interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, ToolEdit, RXDBCtrl, JvLabel, EMsgDlg,
  JvTransBtn, JvComponent, JvEnterTab, fcLabel, ExtCtrls, fcpanel,
  JvToolEdit;

type
  TfrmAnive = class(TForm)
    pnTop: TfcPanel;
    fcLabel2: TfcLabel;
    pnBotoes: TfcPanel;
    JvEnterAsTab1: TJvEnterAsTab;
    btnGravar: TJvTransparentButton;
    btnCancelar: TJvTransparentButton;
    MsgDlg: TEvMsgDlg;
    pnCentro: TfcPanel;
    JvLabel2: TJvLabel;
    JvLabel3: TJvLabel;
    dbDtInicial: TDateEdit;
    dbDtFinal: TDateEdit;
    procedure btnCancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnGravarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAnive: TfrmAnive;

implementation

uses untdmDados, untQRPaciente;

{$R *.dfm}

procedure TfrmAnive.btnCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmAnive.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmAnive.btnGravarClick(Sender: TObject);
begin
  dmDados.IniAnive := dbDtInicial.Date;
  dmDados.TerAnive := dbDtFinal.Date  ;
  dmDados.tbPaciente.Open;
  dmDados.tbPaciente.Filtered := True;
  if (dmDados.tbPaciente.RecordCount > 0) then
    begin
    QRPaciente := TQRPaciente.Create(application);
    QRPaciente.Preview;
    QRPaciente.Free;
    end
  else
    MsgDlg.MsgWarning('N�o existe aniversariantes neste per�odo');
  dmDados.tbPaciente.Filtered := False;
  dmDados.tbPaciente.Close;
  Close;
end;

end.
