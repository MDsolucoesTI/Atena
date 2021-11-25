//////////////////////////////////////////////////////////////////////////
// Criacao...........: 08/2008
// Sistema...........: Atena - Automacao Clinica Odontologica
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit untCadUnidade;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fcLabel, ExtCtrls, fcpanel, JvTransBtn, Grids, DBGrids, DB,
  EMsgDlg, RXDBCtrl, StdCtrls, Mask, DBCtrls, JvLabel, JvComponent,
  JvEnterTab;

type
  TfrmCadUnidade = class(TForm)
    pnTop: TfcPanel;
    fcLabel2: TfcLabel;
    pnBotoes: TfcPanel;
    pnCentro: TfcPanel;
    JvEnterAsTab2: TJvEnterAsTab;
    JvLabel10: TJvLabel;
    dbSigla: TDBEdit;
    JvLabel1: TJvLabel;
    GridUnid: TRxDBGrid;
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
    dbNome: TDBEdit;
    MsgDlg: TEvMsgDlg;
    procedure btnSairClick(Sender: TObject);
    procedure btnPrimeiroClick(Sender: TObject);
    procedure btnAnteriorClick(Sender: TObject);
    procedure btnProximoClick(Sender: TObject);
    procedure btnUltimoClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnDeletarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure dbNomeExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadUnidade : TfrmCadUnidade;
  NovoItem      : Boolean       ;
implementation

uses untdmDados, untPrincipal;

{$R *.dfm}

procedure TfrmCadUnidade.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmCadUnidade.btnPrimeiroClick(Sender: TObject);
begin
  dmDados.tbUnidade.First;
  btnPrimeiro.Enabled := False;
  btnAnterior.Enabled := False;
  btnProximo.Enabled  := True ;
  btnUltimo.Enabled   := True ; 
  dmDados.vTabStt     := True ;
end;

procedure TfrmCadUnidade.btnAnteriorClick(Sender: TObject);
begin
  dmDados.tbUnidade.Prior;
  btnProximo.Enabled := True;
  btnUltimo.Enabled  := True;
  if DMDados.tbUnidade.Bof then
    begin
    btnPrimeiro.Enabled := False;
    btnAnterior.Enabled := False;
    end;
  dmDados.vTabStt    := True;
end;

procedure TfrmCadUnidade.btnProximoClick(Sender: TObject);
begin
  dmDados.tbUnidade.Next;
  btnPrimeiro.Enabled := True;
  btnAnterior.Enabled := True;
  If dmDados.tbUnidade.Eof Then
    Begin
    btnProximo.Enabled := False;
    btnUltimo.Enabled  := False;
    End;
  dmDados.vTabStt     := True;
end;

procedure TfrmCadUnidade.btnUltimoClick(Sender: TObject);
begin
  dmDados.tbUnidade.Last;
  btnPrimeiro.Enabled := True ;
  btnAnterior.Enabled := True ;
  btnProximo.Enabled  := False;
  btnUltimo.Enabled   := False;
  dmDados.vTabStt     := True ;
end;

procedure TfrmCadUnidade.btnNovoClick(Sender: TObject);
begin
  dmdados.tbUnidade.Append;
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
  dbNome.Enabled       := True ;
  GridUnid.Enabled     := True ;
  dbSigla.SetFocus;
end;

procedure TfrmCadUnidade.btnCancelarClick(Sender: TObject);
begin
  dmdados.tbUnidade.Cancel;
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
  dbNome.Enabled      := False;
  GridUnid.Enabled    := False;
  pnBotoes.SetFocus;
end;

procedure TfrmCadUnidade.btnAlterarClick(Sender: TObject);
begin
  if (dmDados.tbUnidade.RecordCount = 0) then
    MsgDlg.MsgError('Tabela sem registro!!!')
  else
    begin
    NovoItem             := True ;
    dmdados.tbUnidade.Edit;
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
    dbNome.Enabled       := True ;
    GridUnid.Enabled     := True ;
    dmDados.vTabStt      := False;
    dbSigla.SetFocus;
    end;
end;

procedure TfrmCadUnidade.btnDeletarClick(Sender: TObject);
begin
  if (dmDados.tbUnidade.RecordCount = 0) then
    MsgDlg.MsgError('Tabela vazia')
  else
    if (MsgDlg.MsgConfirmation('Tem certeza que deseja excluir este registro?') = id_yes) then
      if (dmdados.tbMaterial.Locate('UNI_Sigla',dmdados.tbUnidadeUNI_SIGLA.Value,[])) then
        MsgDlg.MsgInformation('Unidade ativa no cadastro de Materiais.||N�o pode ser EXCLU�DO!!!')
      else
        dmDados.tbUnidade.Delete;
end;

procedure TfrmCadUnidade.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  dmDados.tbMaterial.Close;
  dmDados.tbUnidade.Close;
  FrmPrincipal.StatusTeclas(False,'');
  Action:=Cafree;
end;

procedure TfrmCadUnidade.FormKeyDown(Sender: TObject; var Key: Word;
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

procedure TfrmCadUnidade.FormShow(Sender: TObject);
begin
  dmDados.vTabStt:=True;
  if (dmDados.tbMaterial.State = dsInactive)  then
    dmDados.tbMaterial.Open;
  if (dmDados.tbUnidade.State  = dsInactive)  then
    dmDados.tbUnidade.Open;
  FrmPrincipal.StatusTeclas(True,'[Insert] Novo [Home] Alterar [End] Gravar [Delete] Excluir [Esc] Cancelar ou Sair');
end;

procedure TfrmCadUnidade.btnGravarClick(Sender: TObject);
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
  if (DBNome.Text = '') then
    begin
    if (Length(Campos) > 0) then
      Campos := Campos + ', ';
    Campos := 'Nome';
    Gravar := False ;
    Vazio  := True  ;
    end;
  if Gravar Then
    begin
    NovoItem:= False;
    dmdados.tbUnidade.Post;
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
    dbSigla.Enabled  := False;
    dbNome.Enabled   := False;
    GridUnid.Enabled := False;
    MsgDlg.MsgInformation('Dados gravados com sucesso!');
    dmDados.tbUnidade.Refresh;
    pnBotoes.SetFocus;
    end
  else
    if (Vazio) then
      begin
      MsgDlg.MsgWarning('O(s) Campo(s) '+Campos+' n�o tem Valor(es) ');
      dbSigla.Enabled := True;
      dbNome.SetFocus;
      end;
end;

procedure TfrmCadUnidade.dbNomeExit(Sender: TObject);
begin
  pnBotoes.SetFocus;  
end;

end.
