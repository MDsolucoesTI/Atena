//////////////////////////////////////////////////////////////////////////
// Criacao...........: 08/2008
// Sistema...........: Atena - Automacao Clinica Odontologica
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit untCadGrupo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, EMsgDlg, Grids, DBGrids, RXDBCtrl, StdCtrls, Mask, DBCtrls, DB,
  dbTables, JvLabel, fcLabel, ExtCtrls, fcpanel, JvTransBtn, JvComponent,
  JvEnterTab;


type
  TfrmCadGrupoMed = class(TForm)
    pnTop: TfcPanel;
    fcLabel2: TfcLabel;
    pnCentro: TfcPanel;
    pnBotoes: TfcPanel;
    JvLabel10: TJvLabel;
    GridGrupo: TRxDBGrid;
    dbGrupo: TDBEdit;
    JvEnterAsTab2: TJvEnterAsTab;
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
    procedure btnPrimeiroClick(Sender: TObject);
    procedure btnAnteriorClick(Sender: TObject);
    procedure btnProximoClick(Sender: TObject);
    procedure btnUltimoClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure dbGrupoExit(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnDeletarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadGrupoMed: TfrmCadGrupoMed;
  NovoItem: Boolean;

implementation

uses untdmDados, untPrincipal;

{$R *.dfm}

procedure TfrmCadGrupoMed.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmCadGrupoMed.btnPrimeiroClick(Sender: TObject);
begin
  dmDados.tbGrupo.First;
  BtnPrimeiro.Enabled := False;
  BtnAnterior.Enabled := False;
  BtnProximo.Enabled  := True ;
  BtnUltimo.Enabled   := True ;
  dmDados.vTabStt:=True;
end;

procedure TfrmCadGrupoMed.btnAnteriorClick(Sender: TObject);
begin
  dmDados.tbGrupo.Prior;
  BtnProximo.Enabled := True;
  BtnUltimo.Enabled  := True;
  If DMDados.tbGrupo.Bof Then
    Begin
    BtnPrimeiro.Enabled := False;
    BtnAnterior.Enabled := False;
    End;
  dmDados.vTabStt:=True;
end;

procedure TfrmCadGrupoMed.btnProximoClick(Sender: TObject);
begin
  dmDados.tbGrupo.Next;
  BtnPrimeiro.Enabled := True;
  BtnAnterior.Enabled := True;
  If DMDados.tbGrupo.Eof Then
    Begin
    BtnProximo.Enabled := False;
    BtnUltimo.Enabled := False;
    End;
  dmDados.vTabStt:=True;
end;

procedure TfrmCadGrupoMed.btnUltimoClick(Sender: TObject);
begin
  dmDados.tbGrupo.Last;
  BtnPrimeiro.Enabled := True ;
  BtnAnterior.Enabled := True ;
  BtnProximo.Enabled  := False;
  BtnUltimo.Enabled   := False;
  dmDados.vTabStt:=True;
end;

procedure TfrmCadGrupoMed.btnNovoClick(Sender: TObject);
begin
  dmdados.tbGrupo.append;
  NovoItem:= True;
  dmDados.vTabStt:=False;
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
  dbGrupo.Enabled   := True;
  GridGrupo.Enabled := True;
  dbGrupo.SetFocus;
end;

procedure TfrmCadGrupoMed.btnGravarClick(Sender: TObject);
Var
  Campos       : String ;
  Vazio,Gravar : Boolean;
  tabela       : ttable ;
begin
  Campos :='';
  Gravar :=True;
  Vazio  :=False;
  Tabela := TTable.Create(Application);
  Tabela.DatabaseName := dmDados.tbGrupo.DatabaseName;
  Tabela.TableName    := dmDados.tbGrupo.TableName;
  Tabela.IndexName    := dmdados.tbGrupo.IndexName;
  Tabela.Open;
	if dbGrupo.Text='' then
  	begin
    if Length(Campos)>0 then Campos:=Campos+', ';
    Campos:=Campos+'Grupo';
    Gravar:=False;
    Vazio:=True;
  	End
  else
    if Tabela.Locate('GRU_Nome',dbGrupo.Text,[]) then
      if not((DmDados.tbGrupo.State=dsEdit) And (dmDados.tbGrupo.RecNo = Tabela.RecNo)) then
        begin
        Gravar:=False;
        MsgDlg.MsgWarning('Grupo j� cadastrado!');
        dbGrupo.SetFocus;
        end;
  if gravar then
    begin
    NovoItem := False;
    dmdados.tbGrupo.Post;
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
    dbGrupo.Enabled   := True;
    GridGrupo.Enabled := True;
    MsgDlg.MsgInformation('Dados gravados com sucesso!');
    pnBotoes.SetFocus;
    end
  else
    begin
    if Vazio then
      MsgDlg.MsgWarning('O(s) Campo(s) '+Campos+' n�o tem Valor(es) ');
    dbGrupo.Enabled:=true;
    end;
  tabela.Free;
end;

procedure TfrmCadGrupoMed.dbGrupoExit(Sender: TObject);
Var
  Tabela: TTable;
begin
  Tabela := TTable.Create(Application);
  Tabela.DatabaseName := dmDados.tbGrupo.DatabaseName;
  Tabela.TableName    := dmDados.tbGrupo.TableName   ;
  Tabela.IndexName    := dmdados.tbGrupo.IndexName   ;
  Tabela.Open;
  if NovoItem then
    if dbGrupo.Text = '' then
      begin
      MsgDlg.MsgError('� necess�rio Informar o Grupo!');
      dbGrupo.setfocus;
      end
    else
      if Tabela.Locate('Gru_Nome',dbGrupo.Text,[]) then
        if not ((DmDados.tbGrupo.State=dsEdit) And (dmDados.tbGrupo.RecNo = Tabela.RecNo)) then
          begin
          MsgDlg.MsgWarning('Grupo j� cadastrado!');
          dbGrupo.Clear;
          dbGrupo.setfocus;
          end;
  Tabela.Free;
end;

procedure TfrmCadGrupoMed.btnCancelarClick(Sender: TObject);
begin
  dmdados.tbGrupo.cancel;
  NovoItem:= False;
  dmDados.vTabStt:=True;
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
  dbGrupo.Enabled   := False;
  GridGrupo.Enabled := False;
  pnBotoes.SetFocus;
end;

procedure TfrmCadGrupoMed.btnAlterarClick(Sender: TObject);
begin
  if dmdados.tbGrupo.RecordCount=0 then
    MsgDlg.MsgError('Tabela sem registro!!!')
  else
    begin
    NovoItem := True;
    dmdados.tbGrupo.Edit;
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
    dbGrupo.Enabled      := True ;
    GridGrupo.Enabled    := True ;
    dmDados.vTabStt:=False;
    dbGrupo.SetFocus;
    End;
end;

procedure TfrmCadGrupoMed.btnDeletarClick(Sender: TObject);
begin
  if (dmDados.tbGrupo.RecordCount = 0) then
    MsgDlg.MsgError('Tabela vazia!!!')
  else
    if (MsgDlg.MsgConfirmation('Tem certeza que deseja excluir este registro?') = id_yes) then
      if (dmdados.tbSubGrupo.Locate('Gru_Codigo',dmdados.tbGrupoGRU_CODIGO.Value,[])) then
        MsgDlg.MsgInformation('Grupo ativo no cadastro de Materiais.||N�o pode ser EXCLU�DO!!!')
      else
        dmDados.tbGrupo.Delete;
end;

procedure TfrmCadGrupoMed.FormShow(Sender: TObject);
begin
  dmDados.vTabStt:=True;
  if (dmDados.tbGrupo.State    = dsInactive) then
    dmDados.tbGrupo.Open;
  if (dmDados.tbSubGrupo.State = dsInactive) then
    dmDados.tbSubGrupo.Open;
  FrmPrincipal.StatusTeclas(True,'[Insert] Novo [Home] Alterar [End] Gravar [Delete] Excluir [Esc] Cancelar ou Sair');
end;

procedure TfrmCadGrupoMed.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  dmDados.tbGrupo.Close;
  dmDados.tbSubGrupo.Close;
  FrmPrincipal.StatusTeclas(False,'');
  Action:= cafree;
end;

procedure TfrmCadGrupoMed.FormKeyDown(Sender: TObject; var Key: Word;
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

end.
