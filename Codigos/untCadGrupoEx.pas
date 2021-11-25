//////////////////////////////////////////////////////////////////////////
// Criacao...........: 08/2008
// Sistema...........: Atena - Automacao Clinica Odontologica
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit untCadGrupoEx;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, JvTransBtn, JvComponent, JvEnterTab, DBCtrls, StdCtrls, Mask, DB,
  ToolEdit, RXDBCtrl, JvLabel, fcLabel, ExtCtrls, fcpanel, Grids, DBGrids,
  EMsgDlg, DBTables;

type
  TfrmCadGrupoEx = class(TForm)
    pnTop: TfcPanel;
    fcLabel2: TfcLabel;
    pnCentro: TfcPanel;
    pnBotoes: TfcPanel;
    JvEnterAsTab1: TJvEnterAsTab;
    JvLabel10: TJvLabel;
    gridGrupoEx: TDBGrid;
    dbGrupo: TDBEdit;
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
    MsgDlg: TEvMsgDlg;
    procedure btnSairClick(Sender: TObject);
    procedure dbGrupoExit(Sender: TObject);
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
  frmCadGrupoEx : TfrmCadGrupoEx;
  NovoItem      : Boolean       ;
  
implementation

uses untdmDados, untPrincipal;

{$R *.dfm}

procedure TfrmCadGrupoEx.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmCadGrupoEx.dbGrupoExit(Sender: TObject);
Var
  Tabela: TTable;
begin
  Tabela := TTable.Create(Application);
  Tabela.DatabaseName := dmDados.tbGrupoEx.DatabaseName;
  Tabela.TableName    := dmDados.tbGrupoEx.TableName   ;
  Tabela.IndexName    := dmdados.tbGrupoEx.IndexName   ;
  Tabela.Open;
  if NovoItem then
    if dbGrupo.Text = '' then
      begin
      MsgDlg.MsgError('� necess�rio Informar o Grupo!');
      dbGrupo.setfocus;
      end
    else
      if Tabela.Locate('Grupo',dbGrupo.Text,[]) then
        if not ((DmDados.tbGrupoEx.State=dsEdit) And (dmDados.tbGrupoEx.RecNo = Tabela.RecNo)) then
          begin
          MsgDlg.MsgWarning('Grupo j� Cadastrado!');
          dbGrupo.Clear;
          dbGrupo.setfocus;
          end;
  Tabela.Free;
end;

procedure TfrmCadGrupoEx.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  dmDados.tbGrupoEx.Close;
  dmDados.tbExame.Close;
  FrmPrincipal.StatusTeclas(False,'');
  Action:= Cafree;
end;

procedure TfrmCadGrupoEx.FormKeyDown(Sender: TObject; var Key: Word;
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

procedure TfrmCadGrupoEx.FormShow(Sender: TObject);
begin
  dmDados.vTabStt:=True;
  if (dmDados.tbGrupoEx.State = dsInactive) then
    dmDados.tbGrupoEx.Open;
  if (dmDados.tbExame.State   = dsInactive) then
    dmDados.tbExame.Open;
  FrmPrincipal.StatusTeclas(True,'[Insert] Novo [Home] Alterar [End] Gravar [Delete] Excluir [Esc] Cancelar ou Sair');

end;

procedure TfrmCadGrupoEx.btnPrimeiroClick(Sender: TObject);
begin
  dmDados.tbGrupoEx.First;
  BtnPrimeiro.Enabled := False;
  BtnAnterior.Enabled := False;
  BtnProximo.Enabled  := True ;
  BtnUltimo.Enabled   := True ;
  dmDados.vTabStt:=True;
end;

procedure TfrmCadGrupoEx.btnAnteriorClick(Sender: TObject);
begin
  dmDados.tbGrupoEx.Prior;
  BtnProximo.Enabled := True;
  BtnUltimo.Enabled  := True;
  If DMDados.tbGrupoEx.Bof Then
    Begin
    BtnPrimeiro.Enabled := False;
    BtnAnterior.Enabled := False;
    End;
  dmDados.vTabStt:=True;
end;

procedure TfrmCadGrupoEx.btnProximoClick(Sender: TObject);
begin
  dmDados.tbGrupoEx.Next;
  BtnPrimeiro.Enabled := True;
  BtnAnterior.Enabled := True;
  If DMDados.tbGrupoEx.Eof Then
    Begin
    BtnProximo.Enabled := False;
    BtnUltimo.Enabled := False;
    End;
  dmDados.vTabStt:=True;
end;

procedure TfrmCadGrupoEx.btnUltimoClick(Sender: TObject);
begin
  dmDados.tbGrupoEx.Last;
  BtnPrimeiro.Enabled := True ;
  BtnAnterior.Enabled := True ;
  BtnProximo.Enabled  := False;
  BtnUltimo.Enabled   := False;
  dmDados.vTabStt:=True;
end;

procedure TfrmCadGrupoEx.btnNovoClick(Sender: TObject);
begin
  dmdados.tbGrupoEx.append;
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
  dbGrupo.Enabled     := True;
  gridGrupoEx.Enabled := True;
  dbGrupo.SetFocus;
end;

procedure TfrmCadGrupoEx.btnGravarClick(Sender: TObject);
Var
  Campos       : String ;
  Vazio,Gravar : Boolean;
  tabela       : ttable ;
begin
  Campos :='';
  Gravar :=True;
  Vazio  :=False;
  Tabela := TTable.Create(Application);
  Tabela.DatabaseName := dmDados.tbGrupoEx.DatabaseName;
  Tabela.TableName    := dmDados.tbGrupoEx.TableName;
  Tabela.IndexName    := dmdados.tbGrupoEx.IndexName;
  Tabela.Open;
	if dbGrupo.Text='' then
  	begin
    if Length(Campos)>0 then Campos:=Campos+', ';
    Campos:=Campos+'Grupo';
    Gravar:=False;
    Vazio:=True;
  	End
  else
    if Tabela.Locate('Grupo',dbGrupo.Text,[]) then
      if not((DmDados.tbGrupoEx.State=dsEdit) And (dmDados.tbGrupoEx.RecNo = Tabela.RecNo)) then
        begin
        Gravar:=False;
        MsgDlg.MsgWarning('Grupo j� Cadastrado!');
        dbGrupo.SetFocus;
        end;
  if gravar then
    begin
    NovoItem := False;
    dmdados.tbGrupoEx.Post;
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
    dbGrupo.Enabled     := False;
    gridGrupoEx.Enabled := False;
    MsgDlg.MsgInformation('Dados gravados com sucesso!');
    pnBotoes.SetFocus;
    end
  else
    begin
    if Vazio then
      MsgDlg.MsgWarning('O(s) Campo(s) '+Campos+' n�o tem Valor(es) ');
    dbGrupo.Enabled := True;
    end;
  tabela.Free;
end;

procedure TfrmCadGrupoEx.btnCancelarClick(Sender: TObject);
begin
  dmdados.tbGrupoEx.Cancel;
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
  dbGrupo.Enabled     := False;
  gridGrupoEx.Enabled := False;
  pnBotoes.SetFocus;
end;

procedure TfrmCadGrupoEx.btnAlterarClick(Sender: TObject);
begin
  if dmdados.tbGrupoEx.RecordCount=0 then
    MsgDlg.MsgError('Tabela sem registro!!!')
  else
    begin
    NovoItem := True;
    dmdados.tbGrupoEx.Edit;
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
    dbGrupo.Enabled        := True;
    gridGrupoEx.Enabled    := True;
    dmDados.vTabStt:=False;
    dbGrupo.SetFocus;
    End;
end;

procedure TfrmCadGrupoEx.btnDeletarClick(Sender: TObject);
begin
  if (dmDados.tbGrupoEx.RecordCount = 0) then
    MsgDlg.MsgError('Tabela vazia!!!')
  else
    if (MsgDlg.MsgConfirmation('Tem certeza que deseja excluir este registro?') = id_yes) then
      if (dmdados.tbExame.Locate('CodGruEx',dmdados.tbGrupoExCodGruEx.Value,[])) then
        MsgDlg.MsgInformation('Grupo ativo no Cadastro de Exames.||N�o pode ser EXCLU�DO!!!')
      else
        dmDados.tbGrupoEx.Delete;
end;

end.
