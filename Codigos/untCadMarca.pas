//////////////////////////////////////////////////////////////////////////
// Criacao...........: 08/2008
// Sistema...........: Atena - Automacao Clinica Odontologica
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit untCadMarca;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, EMsgDlg, JvTransBtn, StdCtrls, Mask, DBCtrls, Grids, DBGrids, DB,
  RXDBCtrl, JvLabel, JvComponent, JvEnterTab, fcLabel, ExtCtrls, fcpanel;

type
  TfrmCadMarca = class(TForm)
    pnTop: TfcPanel;
    fcLabel2: TfcLabel;
    JvEnterAsTab2: TJvEnterAsTab;
    pnCentro: TfcPanel;
    JvLabel10: TJvLabel;
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
    dbMarca: TDBEdit;
    GridMarca: TRxDBGrid;
    MsgDlg: TEvMsgDlg;
    procedure btnSairClick(Sender: TObject);
    procedure btnPrimeiroClick(Sender: TObject);
    procedure btnAnteriorClick(Sender: TObject);
    procedure btnProximoClick(Sender: TObject);
    procedure btnUltimoClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnDeletarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadMarca : TfrmCadMarca;
  NovoItem    : Boolean     ;

implementation

uses untdmDados, untPrincipal;

{$R *.dfm}

procedure TfrmCadMarca.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmCadMarca.btnPrimeiroClick(Sender: TObject);
begin
  dmDados.tbMarca.First;
  btnPrimeiro.Enabled := False;
  btnAnterior.Enabled := False;
  btnProximo.Enabled  := True ;
  btnUltimo.Enabled   := True ;
  dmDados.vTabStt     := True ;
end;

procedure TfrmCadMarca.btnAnteriorClick(Sender: TObject);
begin
  dmDados.tbMarca.Prior;
  btnProximo.Enabled := True;
  btnUltimo.Enabled  := True;
  if DMDados.tbMarca.Bof then
    begin
    btnPrimeiro.Enabled := False;
    btnAnterior.Enabled := False;
    end;
  dmDados.vTabStt    := True;
end;

procedure TfrmCadMarca.btnProximoClick(Sender: TObject);
begin
  dmDados.tbMarca.Next;
  btnPrimeiro.Enabled := True;
  btnAnterior.Enabled := True;
  If dmDados.tbMarca.Eof Then
    Begin
    btnProximo.Enabled := False;
    btnUltimo.Enabled  := False;
    End;
  dmDados.vTabStt     := True;
end;

procedure TfrmCadMarca.btnUltimoClick(Sender: TObject);
begin
  dmDados.tbMarca.Last;
  btnPrimeiro.Enabled := True ;
  btnAnterior.Enabled := True ;
  btnProximo.Enabled  := False;
  btnUltimo.Enabled   := False;
  dmDados.vTabStt     := True ;
end;

procedure TfrmCadMarca.btnNovoClick(Sender: TObject);
begin
  dmdados.tbMarca.Append;
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
  dbMarca.Enabled      := True ;
  GridMarca.Enabled    := True ;
  dbMarca.SetFocus;
end;

procedure TfrmCadMarca.btnGravarClick(Sender: TObject);
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
  if (dbMarca.Text = '') then
    begin
    if (Length(Campos) > 0) then
      Campos := Campos + ', ';
    Campos := 'Marca';
    Gravar := False ;
    Vazio  := True  ;
    end;
  if Gravar Then
    begin
    NovoItem:= False;
    dmdados.tbMarca.Post;
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
    dbMarca.Enabled     := False;
    GridMarca.Enabled   := False;
    MsgDlg.MsgInformation('Dados gravados com sucesso!');
    dmDados.tbMarca.Refresh;
    pnBotoes.SetFocus;
    end
  else
    if (Vazio) then
      begin
      MsgDlg.MsgWarning('O(s) Campo(s) '+Campos+' n�o tem Valor(es) ');
      dbMarca.Enabled := True;
      dbMarca.SetFocus;
      end;
end;

procedure TfrmCadMarca.btnCancelarClick(Sender: TObject);
begin
  dmdados.tbMarca.Cancel;
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
  dbMarca.Enabled     := False;
  GridMarca.Enabled   := False;
  pnBotoes.SetFocus;
end;

procedure TfrmCadMarca.btnAlterarClick(Sender: TObject);
begin
  if (dmDados.tbMarca.RecordCount = 0) then
    MsgDlg.MsgError('Tabela sem registro!!!')
  else
    begin
    NovoItem             := True ;
    dmdados.tbMarca.Edit;
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
    dbMarca.Enabled      := True ;
    GridMarca.Enabled    := True ;
    dmDados.vTabStt      := False;
    dbMarca.SetFocus;
    end;
end;

procedure TfrmCadMarca.btnDeletarClick(Sender: TObject);
begin
  if (dmDados.tbMarca.RecordCount = 0) then
    MsgDlg.MsgError('Tabela vazia')
  else
    if (MsgDlg.MsgConfirmation('Tem certeza que deseja excluir este registro?') = id_yes) then
      if (dmdados.tbMaterial.Locate('MAR_Codigo',dmdados.tbMarcaMAR_CODIGO.Value,[])) then
        MsgDlg.MsgInformation('Marca ativa no cadastro de Materiais.||N�o pode ser EXCLU�DO!!!')
      else
        dmDados.tbMarca.Delete;
end;

procedure TfrmCadMarca.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  dmDados.tbMaterial.Close ;
  dmDados.tbMarca.Close ;
  FrmPrincipal.StatusTeclas(False,'');
  Action:=Cafree;
end;

procedure TfrmCadMarca.FormKeyDown(Sender: TObject; var Key: Word;
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

procedure TfrmCadMarca.FormShow(Sender: TObject);
begin
  dmDados.vTabStt:=True;
  if (dmDados.tbMaterial.State  = dsInactive)  then
    dmDados.tbMaterial.Open;
  if (dmDados.tbMarca.State  = dsInactive)  then
    dmDados.tbMarca.Open;
  FrmPrincipal.StatusTeclas(True,'[Insert] Novo [Home] Alterar [End] Gravar [Delete] Excluir [Esc] Cancelar ou Sair');
end;

end.
