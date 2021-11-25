//////////////////////////////////////////////////////////////////////////
// Criacao...........: 08/2008
// Sistema...........: Atena - Automacao Clinica Odontologica
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit untCadRapid;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fcButton, fcImgBtn, RxLookup, StdCtrls, Mask, DBCtrls, JvLabel,
  JvComponent, JvTransBtn, fcLabel, ExtCtrls, fcpanel, EMsgDlg, JvEnterTab,
  ToolEdit, RXDBCtrl, JvPanel, JvTransparentPanel;

type
  TfrmCadRapid = class(TForm)
    pnTop: TfcPanel;
    fcLabel1: TfcLabel;
    pnCentro: TfcPanel;
    pnBotoes: TfcPanel;
    btnGravar: TJvTransparentButton;
    btnCancelar: TJvTransparentButton;
    JvLabel1: TJvLabel;
    dbCodPac: TDBEdit;
    JvLabel2: TJvLabel;
    dbNome: TDBEdit;
    JvLabel6: TJvLabel;
    dbInd: TDBEdit;
    JvLabel8: TJvLabel;
    cmbLkConv: TRxDBLookupCombo;
    btnConv: TfcImageBtn;
    JvLabel23: TJvLabel;
    dbTel: TDBEdit;
    JvLabel3: TJvLabel;
    dbCel: TDBEdit;
    JvEnterAsTab1: TJvEnterAsTab;
    JvTransparentPanel1: TJvTransparentPanel;
    JvLabel21: TJvLabel;
    dbDataCad: TDBDateEdit;
    MsgDlg: TEvMsgDlg;
    procedure btnCancelarClick(Sender: TObject);
    procedure dbCelExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadRapid: TfrmCadRapid;

implementation

uses untdmDados, untPrincipal;

{$R *.dfm}

procedure TfrmCadRapid.btnCancelarClick(Sender: TObject);
begin
  dmDados.tbPaciente.Cancel;
  Close;
end;

procedure TfrmCadRapid.dbCelExit(Sender: TObject);
begin
  pnBotoes.SetFocus;
end;

procedure TfrmCadRapid.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  frmPrincipal.StatusTeclas(False,'');
  Action := Cafree;
end;

procedure TfrmCadRapid.FormShow(Sender: TObject);
begin
  frmPrincipal.StatusTeclas(True,'[End] Gravar [Esc] Sair');
  dmdados.tbPaciente.Append;
end;

procedure TfrmCadRapid.btnGravarClick(Sender: TObject);
var
  Campos : string ;
  Gravar : boolean;
  Vazio  : boolean;
begin
  Campos:='';
  Gravar:=True;
  Vazio:=False;
  if (dbNome.Text = '') then
    begin
    if (Length(Campos) > 0) then
      Campos := Campos + ', ';
    Campos := 'Nome';
    Gravar := False ;
    Vazio  := True  ;
    end;
  if (cmbLkConv.Text = '') then
    begin
    if (Length(Campos) > 0) then
      Campos := Campos + ', ';
    Campos := 'Conv�nio';
    Gravar := False ;
    Vazio  := True  ;
    end;
  if (Gravar) then
    begin
    dmDados.tbPacientePAC_COR.Value      := 'BR'       ;
    dmDados.tbPacientePAC_SEXO.Value     := 'F'        ;
    dmDados.tbPacientePAC_ESTCIVIL.Value := 'CASADO(A)';
    dmDados.tbPaciente.Post;
    MsgDlg.MsgInformation('Dados gravados com sucesso!');
    Close;
    end
  else
    if (Vazio) then
      begin
      MsgDlg.MsgWarning('O(s) Campo(s) '+Campos+' n�o tem Valor(es) ');
      dbNome.SetFocus;
      end;
end;

end.
