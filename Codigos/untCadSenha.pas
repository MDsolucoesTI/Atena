//////////////////////////////////////////////////////////////////////////
// Criacao...........: 08/2008
// Sistema...........: Atena - Automacao Clinica Odontologica
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit untCadSenha;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  RXCtrls, ExtCtrls, StdCtrls, Mask, DBCtrls, ToolEdit, RXDBCtrl, RXSplit,
  SpeedBar, jpeg, RxDBComb, RxLookup, fcLabel, ComCtrls, DB,
  Grids, DBGrids, ECripto, RackCtls, fcButton, fcImgBtn, RxGrdCpt, fcImager,
  ImgList, LMDCustomControl, LMDCustomPanel, LMDCustomBevelPanel,
  LMDCustomParentPanel, LMDBackPanel, JvComponent, JvTransBtn, EGrad,
  EMsgDlg;

type
  TfrmCadSenha = class(TForm)
    evCripto: TEvCriptografa;
    img1: TImageList;
    pnTop: TLMDBackPanel;
    pnCentro: TLMDBackPanel;
    RxLabel3: TRxLabel;
    dbUsuario: TDBEdit;
    dbsenha: TDBEdit;
    RxLabel2: TRxLabel;
    RxLabel1: TRxLabel;
    edtConfSenha: TEdit;
    RxLabel5: TRxLabel;
    cmbNivel: TRxDBComboBox;
    pnBotoes: TLMDBackPanel;
    img2: TImageList;
    fcLabel1: TfcLabel;
    btnUltimo: TJvTransparentButton;
    btnSair: TJvTransparentButton;
    btnProximo: TJvTransparentButton;
    btnPrimeiro: TJvTransparentButton;
    btnNovo: TJvTransparentButton;
    btnGravar: TJvTransparentButton;
    btnDeletar: TJvTransparentButton;
    btnCancelar: TJvTransparentButton;
    btnAnterior: TJvTransparentButton;
    btnAlterar: TJvTransparentButton;
    MsgDlg: TEvMsgDlg;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnPrimeiroClick(Sender: TObject);
    procedure btnAnteriorClick(Sender: TObject);
    procedure btnProximoClick(Sender: TObject);
    procedure btnUltimoClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnDeletarClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure cmbNivelExit(Sender: TObject);
    procedure edtConfSenhaExit(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadSenha: TfrmCadSenha;

implementation

uses untDmdados, untPrincipal;


{$R *.DFM}

procedure TfrmCadSenha.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  dmDados.tbSenha.Close ;
  frmPrincipal.StatusTeclas(False,'');
  Action := CaFree;
end;

procedure TfrmCadSenha.FormShow(Sender: TObject);
begin
  dmDados.vTabStt          := True;
  dmdados.tbSenha.Filtered := False;
  dmdados.tbSenha.Filter   :='(usuario <> '''+'Phoenix'+''')';
  dmdados.tbSenha.filtered := True;
  if (dmDados.tbSenha.State = dsInactive) then
  dmdados.tbSenha.Open;
end;

procedure TfrmCadSenha.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   case (key) of
     // Teclas de a��o na tabela
     VK_Insert : if (dmDados.vTabStt)    then btnNovo.Click;
     VK_Home   : if (dmDados.vTabStt)    then btnAlterar.Click;
     VK_Delete : if (dmDados.vTabStt)    then btnDeletar.Click;
     VK_End    : if not(dmDados.vTabStt) then btnGravar.Click;
     VK_ESCAPE : if not(dmDados.vTabStt) then btnCancelar.Click
                 else btnSair.Click;
   end;
end;

procedure TfrmCadSenha.btnPrimeiroClick(Sender: TObject);
begin
  dmdados.tbSenha.First;
  btnPrimeiro.Enabled := False;
  btnAnterior.Enabled := False;
  btnProximo.Enabled  := True ;
  btnUltimo.Enabled   := True ;
end;

procedure TfrmCadSenha.btnAnteriorClick(Sender: TObject);
begin
  dmdados.tbSenha.Prior;
  btnProximo.Enabled := True;
  btnUltimo.Enabled  := True;
  If dmdados.tbSenha.Bof Then
    Begin
    btnPrimeiro.Enabled := False;
    btnAnterior.Enabled := False;
    end;
end;

procedure TfrmCadSenha.btnProximoClick(Sender: TObject);
begin
  dmdados.tbSenha.Next;
  btnPrimeiro.Enabled := True;
  btnAnterior.Enabled := True;
  If dmdados.tbSenha.Eof Then
    Begin
    btnProximo.Enabled := False;
    btnUltimo.Enabled  := False;
    end;
end;

procedure TfrmCadSenha.btnUltimoClick(Sender: TObject);
begin
  dmdados.tbSenha.Last;
  btnPrimeiro.Enabled := True ;
  btnAnterior.Enabled := True ;
  btnProximo.Enabled  := False;
  btnUltimo.Enabled   := False;
end;

procedure TfrmCadSenha.btnNovoClick(Sender: TObject);
begin
  dmdados.tbSenha.Append;
  dmdados.vTabStt      := False;
  btnGravar.Enabled    := True ;
  btnCancelar.Enabled  := True ;
  btnNovo.Enabled      := False;
  btnPrimeiro.Enabled  := False;
  btnAnterior.Enabled  := False;
  btnProximo.Enabled   := False;
  btnUltimo.Enabled    := False;
  btnAlterar.Enabled   := False;
  btnDeletar.Enabled   := False;
  //Desabilitando os componentes
  dbUsuario.Enabled    := True ;
  dbSenha.Enabled      := True ;
  edtConfSenha.Enabled := True ;
  cmbNivel.Enabled     := True ;
  dbUsuario.SetFocus;
end;

procedure TfrmCadSenha.btnGravarClick(Sender: TObject);
var
  campos : string;
begin
If (dbUsuario.Text = 'Phoenix') then
  begin
  ShowMessage('Palavra Reservada!  Por favor utilize outra!');
  dbUsuario.SetFocus;
  end
else
  begin
  if (dbUsuario.Text='') then campos:='USUARIO';
   if (dbSenha.Text='') then campos:=campos+'  SENHA';
    If Length(campos)=0 then
    begin
    dbSenha.Text:= EvCripto.TextToCriptoBin(dbSenha.Text);
    dmdados.tbSenha.Post;
    dmdados.vTabStt      := True ;
    btnGravar.enabled    := False;
    btnCancelar.Enabled  := False;
    btnNovo.Enabled      := True ;
    btnPrimeiro.Enabled  := True ;
    btnAnterior.Enabled  := True ;
    btnProximo.Enabled   := True ;
    btnUltimo.Enabled    := True ;
    btnAlterar.Enabled   := True ;
    btnDeletar.Enabled   := True ;
    //Desabilitando os componentes
    dbUsuario.Enabled    := False;
    dbSenha.Enabled      := False;
    edtConfSenha.Enabled := False;
    cmbNivel.Enabled     := False;
    showmessage('Dados gravados com sucesso!');
    pnBotoes.SetFocus;
    end;
  end;
end;

procedure TfrmCadSenha.btnCancelarClick(Sender: TObject);
begin
  dmdados.tbSenha.cancel;
  dmdados.vTabStt      := True;
  btnGravar.enabled    := False;
  btnCancelar.Enabled  := False;
  btnNovo.Enabled      := True ;
  btnPrimeiro.Enabled  := True ;
  btnAnterior.Enabled  := True ;
  btnProximo.Enabled   := True ;
  btnUltimo.Enabled    := True ;
  btnAlterar.Enabled   := True ;
  btnDeletar.Enabled   := True ;
  // Desbilitando os componentes
  dbUsuario.Enabled    := False;
  dbSenha.Enabled      := False;
  edtConfSenha.Enabled := False;
  cmbNivel.Enabled     := False;
  pnBotoes.SetFocus
end;

procedure TfrmCadSenha.btnAlterarClick(Sender: TObject);
begin
  dmdados.tbSenha.Edit;
  dmdados.vTabStt      := False;
  btnCancelar.enabled  := True ;
  btnGravar.Enabled    := True ;
  btnNovo.Enabled      := False;
  btnPrimeiro.Enabled  := False;
  btnAnterior.Enabled  := False;
  btnProximo.Enabled   := False;
  btnUltimo.Enabled    := False;
  btnAlterar.Enabled   := False;
  btnDeletar.Enabled   := False;
  // Desabilitando os componentes
  dbUsuario.Enabled    := True ;
  dbSenha.Enabled      := True ;
  edtConfSenha.Enabled := True ;
  cmbNivel.Enabled     := True ;
  dbUsuario.SetFocus;
end;

procedure TfrmCadSenha.btnDeletarClick(Sender: TObject);
begin
  If application.MessageBox('Tem certeza que deseja excluir este registro?','Aten��o', mb_yesno+mb_iconquestion+mb_defbutton1+mb_applmodal) = id_yes then
    begin
    if (dmDados.tbSenhaUsuario.Value = 'Phoenix') then
      MsgDlg.MsgInformation('Este Usu�rio n�o pode ser DELETADO!!!')
    else
      dmdados.tbSenha.Delete;
    end
  else
    dmdados.tbSenha.Cancel;
end;

procedure TfrmCadSenha.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmCadSenha.cmbNivelExit(Sender: TObject);
begin
  pnBotoes.SetFocus;
end;

procedure TfrmCadSenha.edtConfSenhaExit(Sender: TObject);
begin
  if (edtConfSenha.Text <> dbsenha.Text) then
    begin
    MsgDlg.MsgError('Senhas n�o conferem|Redigitar...');
    dbsenha.SetFocus;
    end;
end;

procedure TfrmCadSenha.FormActivate(Sender: TObject);
begin
  frmPrincipal.StatusTeclas(True,' [Insert] Novo [Home] Alterar [End] Gravar [Delete] Excluir [Esc] Cancelar ou Sair');
end;

end.
