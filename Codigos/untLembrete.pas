//////////////////////////////////////////////////////////////////////////
// Criacao...........: 08/2008
// Sistema...........: Atena - Automacao Clinica Odontologica
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit untLembrete;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, JvComponent, JvTransBtn, fcLabel, ExtCtrls, fcpanel, EMsgDlg,
  LMDCustomComponent, lmdcont, LMDCustomControl, LMDCustomPanel, DB,
  LMDCustomBevelPanel, LMDCustomParentPanel, LMDCustomGroupBox,
  LMDCustomButtonGroup, LMDCustomRadioGroup, LMDRadioGroup, StdCtrls,
  DBCtrls, JvEnterTab;

type
  TfrmLembrete = class(TForm)
    pnTop: TfcPanel;
    fcLabel1: TfcLabel;
    pnBotoes: TfcPanel;
    pnCentro: TfcPanel;
    dbTexto: TDBMemo;
    LMDBitmapList1: TLMDBitmapList;
    chHist: TDBCheckBox;
    chRec: TDBCheckBox;
    JvEnterAsTab1: TJvEnterAsTab;
    MsgDlg: TEvMsgDlg;
    btnGravar: TJvTransparentButton;
    btnCancelar: TJvTransparentButton;
    btnExcluir: TJvTransparentButton;
    procedure btnSairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
  private
    { Private declarations }
    fPaciente : Integer;
  public
    { Public declarations }
    property Paciente : Integer read fPaciente write fPaciente;
  end;

var
  frmLembrete: TfrmLembrete;

implementation

uses untdmDados, untPrincipal;

{$R *.dfm}

procedure TfrmLembrete.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmLembrete.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FrmPrincipal.StatusTeclas(False,'');
  Action:= Cafree;
end;

procedure TfrmLembrete.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case (key) of
    // Teclas de a��o na tabela
    VK_END    : if not(dmDados.vTabStt) then BtnGravar.Click;
    VK_ESCAPE : if not(dmDados.vTabStt) then BtnCancelar.Click;
  end;
end;

procedure TfrmLembrete.FormShow(Sender: TObject);
var
  cont : Integer;
begin
  dmDados.vTabStt := True;
  if (Paciente <> 0) then
    if not(dmDados.tbLembrete.Locate('CodPac',Paciente,[])) then
      begin
      dmdados.tbLembrete.Append;
      for cont:=0 to Componentcount-1 do
        if (Components[cont] is TDBCheckBox) then
          TDBCheckBox(Components[Cont]).Checked := False;
      if (Paciente <> 0) then
        dmDados.tbLembreteCodPac.Value := Paciente;
      end
    else
      dmDados.tbLembrete.Edit;
  FrmPrincipal.StatusTeclas(True,'[End] Gravar [Esc] Cancelar ou Sair');

end;

procedure TfrmLembrete.btnGravarClick(Sender: TObject);
var
  Campos : string ;
  Gravar : boolean;
  Vazio  : boolean;
begin
  Campos:='';
  Gravar:=True;
  Vazio:=False;
  if (dbTexto.Text = '') then
    begin
    if (Length(Campos) > 0) then
      Campos := Campos + ', ';
    Campos := 'Texto';
    Gravar := False ;
    Vazio  := True  ;
    end;
  if (Gravar) then
    begin
    dmDados.tbLembreteCodPac.Value := dmDados.tbPacientePAC_CODIGO.Value;
    dmDados.tbLembrete.Post;
    MsgDlg.MsgInformation('Dados gravados com sucesso!');
    Close;
    end
  else
    if (Vazio) then
      begin
      MsgDlg.MsgWarning('O(s) Campo(s) '+Campos+' n�o tem Valor(es) ');
      dbTexto.SetFocus;
      end;
end;

procedure TfrmLembrete.btnCancelarClick(Sender: TObject);
begin
  dmDados.tbLembrete.Cancel;
  Close;
end;

procedure TfrmLembrete.btnExcluirClick(Sender: TObject);
begin
  if (dmDados.tbLembrete.RecordCount = 0) then
    MsgDlg.MsgError('Tabela vazia')
  else
    if (MsgDlg.MsgConfirmation('Tem certeza que deseja excluir este registro?') = id_yes) then
      dmDados.tbLembrete.Delete;
end;

end.
