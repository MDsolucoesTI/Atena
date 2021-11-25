//////////////////////////////////////////////////////////////////////////
// Criacao...........: 08/2008
// Sistema...........: Atena - Automacao Clinica Odontologica
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit untCadTipoAtend;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, JvLookup, EMsgDlg, JvTransBtn, StdCtrls, Mask, DBCtrls, Grids,
  DBGrids, JvLabel, JvComponent, JvEnterTab, fcLabel, ExtCtrls, fcpanel,
  JvCombobox, JvColorCombo, JvDialogs, DB, RxDBComb;

type
  TfrmCadTipoAtend = class(TForm)
    pnTop: TfcPanel;
    fcLabel2: TfcLabel;
    JvEnterAsTab1: TJvEnterAsTab;
    pnCentro: TfcPanel;
    JvLabel10: TJvLabel;
    JvLabel18: TJvLabel;
    GridTipo: TDBGrid;
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
    dbTipo: TDBEdit;
    dbSigla: TDBEdit;
    dbCor: TJvColorComboBox;
    JvLabel1: TJvLabel;
    JvLabel2: TJvLabel;
    cmbCadRap: TRxDBComboBox;
    MsgDlg: TEvMsgDlg;
    procedure btnSairClick(Sender: TObject);
    procedure cmbUfExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnPrimeiroClick(Sender: TObject);
    procedure btnAnteriorClick(Sender: TObject);
    procedure btnProximoClick(Sender: TObject);
    procedure btnUltimoClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnDeletarClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure cmbCadRapExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadTipoAtend : TfrmCadTipoAtend;
  NovoItem        : Boolean         ;
implementation

uses untdmDados, untPrincipal;

{$R *.dfm}

procedure TfrmCadTipoAtend.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmCadTipoAtend.cmbUfExit(Sender: TObject);
begin
  pnBotoes.SetFocus;
end;

procedure TfrmCadTipoAtend.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  dmDados.tbTipoAtende.Close;
  dmDados.tbAgenda.Close;
  FrmPrincipal.StatusTeclas(False,'');
  Action := Cafree;
end;

procedure TfrmCadTipoAtend.btnPrimeiroClick(Sender: TObject);
begin
  dmDados.tbTipoAtende.First;
  btnprimeiro.Enabled := False;
  btnAnterior.Enabled := False;
  btnProximo.Enabled  := True ;
  btnUltimo.Enabled   := True ;
end;

procedure TfrmCadTipoAtend.btnAnteriorClick(Sender: TObject);
begin
  dmDados.tbTipoAtende.Prior;
  btnProximo.Enabled  := True ;
  btnUltimo.Enabled   := True ;
  if dmDados.tbTipoAtende.bof then
    begin
    btnPrimeiro.Enabled := False;
    btnAnterior.Enabled := False;
    end;
end;

procedure TfrmCadTipoAtend.btnProximoClick(Sender: TObject);
begin
  dmDados.tbTipoAtende.Next;
  btnPrimeiro.Enabled := True ;
  btnAnterior.Enabled := True ;
  if dmDados.tbTipoAtende.Eof then
    begin
    btnProximo.Enabled := False;
    btnUltimo.Enabled  := False;
    end;
end;

procedure TfrmCadTipoAtend.btnUltimoClick(Sender: TObject);
begin
  dmDados.tbTipoAtende.Last;
  btnPrimeiro.Enabled := True ;
  btnAnterior.Enabled := True ;
  btnProximo.Enabled  := False;
  btnUltimo.Enabled   := False;
end;

procedure TfrmCadTipoAtend.btnNovoClick(Sender: TObject);
begin
  dmdados.tbTipoAtende.Append;
  NovoItem             := True ;
  dmDados.vTabStt      := False;
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
  dbSigla.Enabled      := True ;
  dbTipo.Enabled       := True ;
  dbCor.Enabled        := True ;
  cmbCadRap.Enabled    := True ;
  GridTipo.Enabled     := True ;
  dbSigla.SetFocus;
end;

procedure TfrmCadTipoAtend.btnGravarClick(Sender: TObject);
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
  if (dbSigla.Text = '') then
    begin
    if (Length(Campos) > 0) then
      Campos := Campos + ', ';
    Campos := 'Sigla';
    Gravar := False ;
    Vazio  := True  ;
    end;
  if (dbTipo.Text = '') then
    begin
    if (Length(Campos) > 0) then
      Campos := Campos + ', ';
    Campos := 'Tipo';
    Gravar := False ;
    Vazio  := True  ;
    end;
  if Gravar Then
    begin
    NovoItem:= False;
    dmDados.tbTipoAtendeTIP_COR.Value := ColorToString(dbCor.ColorValue);
    dmdados.tbTipoAtende.Post;
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
    dbSigla.Enabled     := False;
    dbTipo.Enabled      := False;
    dbCor.Enabled       := False;
    cmbCadRap.Enabled   := False;
    GridTipo.Enabled    := False;
    MsgDlg.MsgInformation('Dados gravados com sucesso!');
    dmDados.tbTipoAtende.Refresh;
    pnBotoes.SetFocus;
    end
  else
    if (Vazio) then
      begin
      MsgDlg.MsgWarning('O(s) Campo(s) '+Campos+' n�o tem Valor(es) ');
      dbSigla.Enabled := True;
      dbSigla.SetFocus;
      end;
end;

procedure TfrmCadTipoAtend.btnCancelarClick(Sender: TObject);
begin
  dmdados.tbTipoAtende.Cancel;
  NovoItem            := False;
  dmDados.vTabStt     := True ;
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
  dbSigla.Enabled     := False;
  dbTipo.Enabled      := False;
  dbCor.Enabled       := False;
  cmbCadRap.Enabled   := False;
  GridTipo.Enabled    := False;
  pnBotoes.SetFocus;
end;

procedure TfrmCadTipoAtend.btnAlterarClick(Sender: TObject);
begin
  if (dmDados.tbTipoAtende.RecordCount = 0) then
    MsgDlg.MsgError('Tabela sem registro!!!')
  else
    begin
    NovoItem             := True ;
    dmdados.tbTipoAtende.Edit;
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
    dbSigla.Enabled      := True ;
    dbTipo.Enabled       := True ;
    dbCor.Enabled        := True ;
    cmbCadRap.Enabled    := True ;
    GridTipo.Enabled     := True ;
    dmDados.vTabStt      := False;
    dbSigla.SetFocus;
    end;
end;

procedure TfrmCadTipoAtend.btnDeletarClick(Sender: TObject);
begin
  if (dmDados.tbTipoAtende.RecordCount = 0) then
    MsgDlg.MsgError('Tabela vazia')
  else
    if (MsgDlg.MsgConfirmation('Tem certeza que deseja excluir este registro?') = id_yes) then
      if (dmdados.tbAgenda.Locate('TIP_SIGLA',dmdados.tbTipoAtendeTIP_SIGLA.Value,[])) then
        MsgDlg.MsgInformation('Sigla ativa na Agenda.||N�o pode ser EXCLU�DA!!!')
      else
        dmDados.tbTipoAtende.Delete;
end;

procedure TfrmCadTipoAtend.FormKeyDown(Sender: TObject; var Key: Word;
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

procedure TfrmCadTipoAtend.FormShow(Sender: TObject);
begin
  dmDados.vTabStt:=True;
  if (dmDados.tbTipoAtende.State  = dsInactive)  then
    dmDados.tbTipoAtende.Open;
  if (dmDados.tbAgenda.State  = dsInactive)  then
    dmDados.tbAgenda.Open;
  FrmPrincipal.StatusTeclas(True,'[Insert] Novo [Home] Alterar [End] Gravar [Delete] Excluir [Esc] Cancelar ou Sair');
end;

procedure TfrmCadTipoAtend.cmbCadRapExit(Sender: TObject);
begin
  pnBotoes.SetFocus;
end;

end.
