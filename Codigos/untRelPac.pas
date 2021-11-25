//////////////////////////////////////////////////////////////////////////
// Criacao...........: 08/2008
// Sistema...........: Atena - Automacao Clinica Odontologica
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit untRelPac;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, JvTransBtn, StdCtrls, JvCombobox, JvLabel, EMsgDlg, JvComponent,
  JvEnterTab, fcLabel, ExtCtrls, fcpanel, DB;

type
  TfrmRelPac = class(TForm)
    pnTop: TfcPanel;
    fcLabel2: TfcLabel;
    pnBotoes: TfcPanel;
    JvEnterAsTab1: TJvEnterAsTab;
    pnCentro: TfcPanel;
    JvLabel10: TJvLabel;
    cmbclassif: TJvComboBox;
    cmbDestino: TJvComboBox;
    JvLabel1: TJvLabel;
    btnImprimir: TJvTransparentButton;
    btnSair: TJvTransparentButton;
    MsgDlg: TEvMsgDlg;
    procedure btnSairClick(Sender: TObject);
    procedure cmbDestinoExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure cmbclassifChange(Sender: TObject);
    procedure cmbclassifCloseUp(Sender: TObject);
    procedure cmbclassifExit(Sender: TObject);
    procedure cmbDestinoChange(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelPac: TfrmRelPac;

implementation

uses untdmDados, untQRPaciente, untPrincipal;

{$R *.dfm}

procedure TfrmRelPac.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmRelPac.cmbDestinoExit(Sender: TObject);
begin
  pnBotoes.SetFocus;
end;

procedure TfrmRelPac.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dmDados.tbPaciente.Close;
  FrmPrincipal.StatusTeclas(False,'');
end;

procedure TfrmRelPac.FormShow(Sender: TObject);
begin
  FrmPrincipal.StatusTeclas(True,'[F2] Imprimir [Esc] Cancelar ou Sair');
end;

procedure TfrmRelPac.FormActivate(Sender: TObject);
begin
  if (dmDados.tbPaciente.State = dsInactive)  then
    dmDados.tbPaciente.Open;
end;

procedure TfrmRelPac.cmbclassifChange(Sender: TObject);
begin
  If cmbClassif.Text= 'C�digo' Then
    begin
    dmdados.tbPaciente.IndexFieldNames:= 'PAC_CODIGO';
    cmbdestino.Enabled:=true;
    end
  Else
    begin
    dmdados.tbPaciente.IndexFieldNames:= 'PAC_NOME';
    cmbdestino.Enabled:=true;
    end;
end;

procedure TfrmRelPac.cmbclassifCloseUp(Sender: TObject);
begin
  If cmbClassif.Text= 'C�digo' Then
    dmdados.tbPaciente.IndexFieldNames:= 'PAC_CODIGO'
  Else
    dmdados.tbPaciente.IndexFieldNames:= 'PAC_NOME';
  cmbdestino.Enabled:=true;
end;

procedure TfrmRelPac.cmbclassifExit(Sender: TObject);
begin
  If cmbClassif.Text= 'C�digo' Then
    dmdados.tbPaciente.IndexFieldNames:= 'PAC_CODIGO'
  Else
    dmdados.tbPaciente.IndexFieldNames:= 'PAC_NOME';
  cmbdestino.Enabled:=true;
end;

procedure TfrmRelPac.cmbDestinoChange(Sender: TObject);
Var
  x    : integer ;
  Flag : Boolean ;
begin
 If cmbDestino.Text= '' then
      Begin
      MsgDlg.MsgWarning('� obrigat�rio informar o destino do relat�rio');
      cmbDestino.SetFocus;
      End
   Else
      Begin
      Flag:=True;
      For x:=0 to cmbDestino.Items.Count-1 Do
        If cmbDestino.Text=cmbDestino.Items[x] Then
          Flag:=False;
      If Flag Then
        Begin
        MsgDlg.MsgError('Valor inv�lido');
        cmbDestino.clear;
        cmbDestino.SetFocus;
        End
      else
        begin
        pnBotoes.SetFocus;
        btnImprimir.Enabled:=true;
        cmbdestino.Enabled:=false;
        end;
   end;

end;

procedure TfrmRelPac.btnImprimirClick(Sender: TObject);
begin
  btnImprimir.Enabled := False ;
  QRPaciente := TQRPaciente.Create(application);
  If cmbDestino.Text= 'V�DEO' Then
    QRPaciente.Preview
  else
	  QRPaciente.Print;
  QRPaciente.Free;
end;

end.
