//////////////////////////////////////////////////////////////////////////
// Criacao...........: 08/2008
// Sistema...........: Atena - Automacao Clinica Odontologica
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit untCadSubGrupo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, EMsgDlg, JvTransBtn, Grids, DBGrids, RXDBCtrl, StdCtrls, DB,
  JvLabel, JvComponent, JvEnterTab, fcLabel, ExtCtrls, fcpanel, Mask,
  DBCtrls;

type
  TfrmCadSubGrupo = class(TForm)
    pnTop: TfcPanel;
    fcLabel2: TfcLabel;
    JvEnterAsTab2: TJvEnterAsTab;
    pnCentro: TfcPanel;
    pnBotoes: TfcPanel;
    btnPrimeiro: TJvTransparentButton;
    btnAnterior: TJvTransparentButton;
    btnProximo: TJvTransparentButton;
    btnUltimo: TJvTransparentButton;
    btnNovo: TJvTransparentButton;
    btnGravar: TJvTransparentButton;
    btnCancelar: TJvTransparentButton;
    btnAlterar: TJvTransparentButton;
    btnDeletar: TJvTransparentButton;
    btnSair: TJvTransparentButton;
    JvLabel10: TJvLabel;
    cmblkGrupo: TDBLookupComboBox;
    GridSubGrupo: TRxDBGrid;
    JvLabel1: TJvLabel;
    dbSubGrupo: TDBEdit;
    MsgDlg: TEvMsgDlg;
    procedure btnSairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure btnPrimeiroClick(Sender: TObject);
    procedure btnAnteriorClick(Sender: TObject);
    procedure btnProximoClick(Sender: TObject);
    procedure btnUltimoClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnDeletarClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadSubGrupo : TfrmCadSubGrupo ;
  NovoItem       : Boolean         ;

implementation

uses untdmDados, untPrincipal;

{$R *.dfm}

procedure TfrmCadSubGrupo.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmCadSubGrupo.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  dmdados.tbGrupo.Close;
  dmdados.tbSubGrupo.Close;
  dmdados.tbMaterial.Close;
  FrmPrincipal.StatusTeclas(False,'');
  Action:= Cafree;
end;

procedure TfrmCadSubGrupo.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case (key) of
   // Teclas de a��o na tabela
   VK_INSERT : if (dmDados.vTabStt) then BtnNovo.Click;
   VK_HOME   : if (dmDados.vTabStt) then BtnAlterar.Click;
   VK_DELETE : if (dmDados.vTabStt) then BtnDeletar.Click;
   VK_END    : if not(dmDados.vTabStt) then BtnGravar.Click;
   VK_ESCAPE : if not(dmDados.vTabStt) then BtnCancelar.Click
               else BtnSair.Click;
  end;
end;

procedure TfrmCadSubGrupo.FormShow(Sender: TObject);
begin
  dmDados.vTabStt:=True;
  if (dmDados.tbSubGrupo.State = dsInactive)  then
    dmDados.tbSubGrupo.Open;
  if (dmDados.tbGrupo.State = dsInactive)  then
    dmDados.tbGrupo.Open;
  if (dmDados.tbMaterial.State = dsInactive)  then
    dmDados.tbMaterial.Open;
  FrmPrincipal.StatusTeclas(True,'[Insert] Novo [Home] Alterar [End] Gravar [Delete] Excluir [Esc] Cancelar ou Sair');
end;

procedure TfrmCadSubGrupo.btnPrimeiroClick(Sender: TObject);
begin
  dmDados.tbSubGrupo.First;
  btnPrimeiro.Enabled :=False;
  btnAnterior.Enabled :=False;
  btnProximo.Enabled  :=True ;
  btnUltimo.Enabled   :=True ;
  dmDados.vTabStt:=True;
end;

procedure TfrmCadSubGrupo.btnAnteriorClick(Sender: TObject);
begin
  dmDados.tbSubGrupo.Prior;
  btnProximo.Enabled :=True;
  btnUltimo.Enabled  :=True;
  If dmDados.tbSubGrupo.Bof Then
    Begin
    btnPrimeiro.Enabled :=False;
    btnAnterior.Enabled :=False;
    End;
  dmDados.vTabStt:=True;
end;

procedure TfrmCadSubGrupo.btnProximoClick(Sender: TObject);
begin
  dmDados.tbSubGrupo.Next;
  btnPrimeiro.Enabled :=True;
  btnAnterior.Enabled :=True;
  If dmDados.tbSubGrupo.Eof Then
    Begin
    btnProximo.Enabled :=False;
    btnUltimo.Enabled  :=False;
    End;
  dmDados.vTabStt:=True;
end;

procedure TfrmCadSubGrupo.btnUltimoClick(Sender: TObject);
begin
  dmDados.tbSubGrupo.Last;
  btnPrimeiro.Enabled :=True ;
  btnAnterior.Enabled :=True ;
  btnProximo.Enabled  :=False;
  btnUltimo.Enabled   :=False;
  dmDados.vTabStt:=True;
end;

procedure TfrmCadSubGrupo.btnNovoClick(Sender: TObject);
begin
  dmDados.tbSubGrupo.Append;
  NovoItem:=True;
  dmDados.vTabStt:=False;
  // Ajusta bot�es
  btnGravar.Enabled    := true ;
  btnCancelar.Enabled  := true ;
  btnNovo.Enabled      := False;
  btnPrimeiro.Enabled  := False;
  btnAnterior.Enabled  := False;
  btnProximo.Enabled   := False;
  btnUltimo.Enabled    := False;
  btnAlterar.Enabled   := False;
  btnDeletar.Enabled   := False;
  // Habilitando os componentes
  cmblkGrupo.Enabled   := True ;
  dbSubGrupo.Enabled   := True ;
  GridSubGrupo.Enabled := True ;
  cmblkGrupo.SetFocus;
end;

procedure TfrmCadSubGrupo.btnCancelarClick(Sender: TObject);
begin
  dmdados.tbSubGrupo.Cancel;
  NovoItem:= False;
  dmDados.vTabStt:=True;
 // Ajusta bot�es
  btngravar.Enabled   := False;
  BtnNovo.Enabled     := True ;
  BtnCancelar.Enabled := False;
  BtnPrimeiro.Enabled := True ;
  BtnAnterior.Enabled := True ;
  BtnProximo.Enabled  := True ;
  BtnUltimo.Enabled   := True ;
  BtnAlterar.Enabled  := True ;
  BtnDeletar.Enabled  := True ;
  pnBotoes.SetFocus;
  // Desabilitando os Componentes
  cmblkGrupo.Enabled  := False;
  DBsubgrupo.Enabled  := False;
  GridSubGrupo.Enabled:= False;
  pnBotoes.SetFocus;
end;

procedure TfrmCadSubGrupo.btnAlterarClick(Sender: TObject);
begin
  if dmdados.tbSubGrupo.RecordCount=0 then
    MsgDlg.MsgError('Tabela sem registro!!!')
  else
    begin
    NovoItem := True;
    dmdados.tbSubGrupo.Edit;
    // Ajusta Bot�es
    BtnCancelar.Enabled  := True ;
    BtnGravar.Enabled    := True ;
    BtnNovo.Enabled      := False;
    BtnPrimeiro.Enabled  := False;
    BtnAnterior.Enabled  := False;
    BtnProximo.Enabled   := False;
    BtnUltimo.Enabled    := False;
    BtnAlterar.Enabled   := False;
    Btndeletar.Enabled   := False;
  // Habilitando os componentes
    cmblkGrupo.Enabled   := True ;
    dbSubGrupo.Enabled   := True ;
    GridSubGrupo.Enabled := True ;
    dmDados.vTabStt:=False;
    dbSubGrupo.SetFocus;
    End;
end;

procedure TfrmCadSubGrupo.btnDeletarClick(Sender: TObject);
begin
  if (dmDados.tbSubGrupo.RecordCount = 0) then
    MsgDlg.MsgError('Tabela vazia!!!')
  else
    if (MsgDlg.MsgConfirmation('Tem certeza que deseja excluir este registro?') = id_yes) then
      if (dmdados.tbMaterial.Locate('SBG_Codigo',dmdados.tbSubGrupoSBG_CODIGO.Value,[])) then
        MsgDlg.MsgInformation('SubGrupo ativo no cadastro de Materiais.||N�o pode ser EXCLU�DO!!!')
      else
        dmDados.tbSubGrupo.Delete;
end;

procedure TfrmCadSubGrupo.btnGravarClick(Sender: TObject);
var
  Campos : string ;
  Gravar : boolean;
  Vazio  : boolean;
  x      : integer;
  Flag   : boolean;
begin
  Campos:='';
  Gravar:=True;
  Vazio:=False;
  if (cmblkGrupo.Text = '') then
    begin
    if (Length(Campos) > 0) then
      Campos := Campos + ', ';
    Campos := 'Grupo';
    Gravar := False ;
    Vazio  := True  ;
    end;
  if (dbSubGrupo.Text = '') then
    begin
    if (Length(Campos) > 0) then
      Campos := Campos + ', ';
    Campos := 'SubGrupo';
    Gravar := False ;
    Vazio  := True  ;
    end;
  If Gravar Then
    begin
    NovoItem:= False;
    dmdados.tbSubGrupo.Post;
    dmDados.vTabStt:=True;
    // Ajusta Bot�es
    BtnGravar.enabled   := False;
    BtnCancelar.Enabled := False;
    BtnNovo.Enabled     := True ;
    BtnPrimeiro.Enabled := True ;
    BtnAnterior.Enabled := True ;
    BtnProximo.Enabled  := True ;
    BtnUltimo.Enabled   := True ;
    BtnAlterar.Enabled  := True ;
    Btndeletar.Enabled  := True ;
    // Desabilitando os Componentes
    cmblkGrupo.Enabled   := False;
    dbSubGrupo.Enabled   := False;
    GridSubGrupo.Enabled := False;
    MsgDlg.MsgInformation('Dados gravados com sucesso!');
    dmDados.tbSubGrupo.Refresh;
    pnBotoes.SetFocus;
    end
  else
    if (Vazio) then
      begin
      MsgDlg.MsgWarning('O(s) Campo(s) '+Campos+' n�o tem Valor(es) ');
      dbSubGrupo.Enabled := True;
      dbSubGrupo.SetFocus;
      end;
end;

end.
