//////////////////////////////////////////////////////////////////////////
// Criacao...........: 08/2008
// Sistema...........: Atena - Automacao Clinica Odontologica
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit untCadExames;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, EMsgDlg, JvTransBtn, StdCtrls, Mask, DBCtrls, Grids, DBGrids, DB,
  JvLabel, JvComponent, JvEnterTab, fcLabel, ExtCtrls, fcpanel, RXDBCtrl,
  DBTables;

type
  TfrmCadExames = class(TForm)
    pnTop: TfcPanel;
    fcLabel2: TfcLabel;
    JvEnterAsTab1: TJvEnterAsTab;
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
    JvLabel1: TJvLabel;
    gridEx: TRxDBGrid;
    dbExame: TDBEdit;
    MsgDlg: TEvMsgDlg;
    procedure dbExameExit(Sender: TObject);
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
    procedure btnGravarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnDeletarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadExames : TfrmCadExames;
  NovoItem     : Boolean      ;

implementation

uses untdmDados, untPrincipal;

{$R *.dfm}

procedure TfrmCadExames.dbExameExit(Sender: TObject);
Var
  Tabela: TTable;
begin
  Tabela := TTable.Create(Application);
  Tabela.DatabaseName := dmDados.tbExame.DatabaseName;
  Tabela.TableName    := dmDados.tbExame.TableName   ;
  Tabela.IndexName    := dmdados.tbExame.IndexName   ;
  Tabela.Open;
  if NovoItem then
    if dbExame.Text = '' then
      begin
      MsgDlg.MsgError('� necess�rio Informar o EXAME!');
      dbExame.setfocus;
      end
    else
      if Tabela.Locate('Exame',dbExame.Text,[]) then
        if not ((DmDados.tbExame.State=dsEdit) And (dmDados.tbExame.RecNo = Tabela.RecNo)) then
          begin
          MsgDlg.MsgWarning('Exame j� Cadastrado!');
          dbExame.Clear;
          dbExame.setfocus;
          end;
  Tabela.Free;
end;

procedure TfrmCadExames.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmCadExames.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  dmDados.tbExame.Close;
  dmDados.tbGrupoEx.Close;
  FrmPrincipal.StatusTeclas(False,'');
  Action:= Cafree;
end;

procedure TfrmCadExames.FormKeyDown(Sender: TObject; var Key: Word;
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

procedure TfrmCadExames.FormShow(Sender: TObject);
begin
  dmDados.vTabStt:=True;
  if (dmDados.tbExame.State   = dsInactive) then
    dmDados.tbExame.Open;
  if (dmDados.tbGrupoEx.State = dsInactive) then
    dmDados.tbGrupoEx.Open;
  FrmPrincipal.StatusTeclas(True,'[Insert] Novo [Home] Alterar [End] Gravar [Delete] Excluir [Esc] Cancelar ou Sair');
end;

procedure TfrmCadExames.btnPrimeiroClick(Sender: TObject);
begin
  dmDados.tbExame.First;
  BtnPrimeiro.Enabled := False;
  BtnAnterior.Enabled := False;
  BtnProximo.Enabled  := True ;
  BtnUltimo.Enabled   := True ;
  dmDados.vTabStt:=True;
end;

procedure TfrmCadExames.btnAnteriorClick(Sender: TObject);
begin
  dmDados.tbExame.Prior;
  BtnProximo.Enabled := True;
  BtnUltimo.Enabled  := True;
  If DMDados.tbExame.Bof Then
    Begin
    BtnPrimeiro.Enabled := False;
    BtnAnterior.Enabled := False;
    End;
  dmDados.vTabStt:=True;
end;

procedure TfrmCadExames.btnProximoClick(Sender: TObject);
begin
  dmDados.tbExame.Next;
  BtnPrimeiro.Enabled := True;
  BtnAnterior.Enabled := True;
  If DMDados.tbExame.Eof Then
    Begin
    BtnProximo.Enabled := False;
    BtnUltimo.Enabled := False;
    End;
  dmDados.vTabStt:=True;
end;

procedure TfrmCadExames.btnUltimoClick(Sender: TObject);
begin
  dmDados.tbExame.Last;
  BtnPrimeiro.Enabled := True ;
  BtnAnterior.Enabled := True ;
  BtnProximo.Enabled  := False;
  BtnUltimo.Enabled   := False;
  dmDados.vTabStt:=True;
end;

procedure TfrmCadExames.btnNovoClick(Sender: TObject);
begin
  dmdados.tbExame.append;
  NovoItem        := True ;
  dmDados.vTabStt := False;
  // AjustaBot�es
  BtnGravar.Enabled    := True ;
  BtnCancelar.Enabled  := True ;
  BtnNovo.Enabled      := False;
  BtnPrimeiro.Enabled  := False;
  BtnAnterior.Enabled  := False;
  BtnProximo.Enabled   := False;
  BtnUltimo.Enabled    := False;
  BtnAlterar.Enabled   := False;
  BtnDeletar.Enabled   := False;
  // Desabilitando os Componentes
  cmblkGrupo.Enabled := True;
  dbExame.Enabled    := True;
  gridEx.Enabled     := True;
  cmblkGrupo.SetFocus;
end;

procedure TfrmCadExames.btnGravarClick(Sender: TObject);
Var
  Campos       : String ;
  Vazio,Gravar : Boolean;
  tabela       : ttable ;
begin
  Campos :='';
  Gravar :=True;
  Vazio  :=False;
  Tabela := TTable.Create(Application);
  Tabela.DatabaseName := dmDados.tbExame.DatabaseName;
  Tabela.TableName    := dmDados.tbExame.TableName;
  Tabela.IndexName    := dmdados.tbExame.IndexName;
  Tabela.Open;
	if dbExame.Text='' then
  	begin
    if Length(Campos)>0 then Campos:=Campos+', ';
    Campos:=Campos+'Exame';
    Gravar:=False;
    Vazio:=True;
  	End
  else
    if Tabela.Locate('Exame',dbExame.Text,[]) then
      if not((DmDados.tbExame.State=dsEdit) And (dmDados.tbExame.RecNo = Tabela.RecNo)) then
        begin
        Gravar:=False;
        MsgDlg.MsgWarning('Exame j� Cadastrado!');
        dbExame.SetFocus;
        end;
  if gravar then
    begin
    NovoItem := False;
    dmdados.tbExame.Post;
    dmDados.vTabStt     := True ;
    BtnGravar.Enabled   := False;
    BtnCancelar.Enabled := False;
    BtnNovo.Enabled     := True ;
    BtnPrimeiro.Enabled := True ;
    BtnAnterior.Enabled := True ;
    BtnProximo.Enabled  := True ;
    BtnUltimo.Enabled   := True ;
    BtnAlterar.Enabled  := True ;
    Btndeletar.Enabled  := True ;
    {Desabilitando os componentes}
    cmblkGrupo.Enabled := False;
    dbExame.Enabled    := False;
    gridEx.Enabled     := False;
    MsgDlg.MsgInformation('Dados gravados com sucesso!');
    pnBotoes.SetFocus;
    end
  else
    begin
    if Vazio then
      MsgDlg.MsgWarning('O(s) Campo(s) '+Campos+' n�o tem Valor(es) ');
    dbExame.Enabled := True;
    end;
  tabela.Free;
end;

procedure TfrmCadExames.btnCancelarClick(Sender: TObject);
begin
  dmdados.tbExame.Cancel;
  NovoItem        := False;
  dmDados.vTabStt := True ;
 // Ajusta bot�es
  btnGravar.Enabled   := False;
  BtnCancelar.Enabled := False;
  BtnNovo.Enabled     := True ;
  BtnPrimeiro.Enabled := True ;
  BtnAnterior.Enabled := True ;
  BtnProximo.Enabled  := True ;
  BtnUltimo.Enabled   := True ;
  BtnAlterar.Enabled  := True ;
  BtnDeletar.Enabled  := True ;
  pnBotoes.SetFocus;
  // Desabilitando os Componentes
  cmblkGrupo.Enabled := False;
  dbExame.Enabled    := False;
  gridEx.Enabled     := False;
  pnBotoes.SetFocus;
end;

procedure TfrmCadExames.btnAlterarClick(Sender: TObject);
begin
  if dmdados.tbExame.RecordCount=0 then
    MsgDlg.MsgError('Tabela sem registro!!!')
  else
    begin
    NovoItem := True;
    dmdados.tbExame.Edit;
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
    cmblkGrupo.Enabled := True;
    dbExame.Enabled    := True;
    gridEx.Enabled     := True;
    dmDados.vTabStt:=False;
    dbExame.SetFocus;
    End;
end;

procedure TfrmCadExames.btnDeletarClick(Sender: TObject);
var
  Flag : Boolean;
begin
  Flag := False;
  if (dmDados.tbExame.RecordCount = 0) then
    MsgDlg.MsgError('Tabela vazia')
  else
    if MsgDlg.MsgConfirmation('Tem certeza que deseja excluir este Registro?') = id_yes then
      begin
      if (Flag) then
        MsgDlg.MsgInformation('Exame ativo, ou com registro de opera��es anteriores, n�o pode ser exclu�do !!!')
      else
        dmDados.tbExame.Delete;
      end
    else
      dmDados.tbExame.cancel;

end;

end.
