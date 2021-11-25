//////////////////////////////////////////////////////////////////////////
// Criacao...........: 08/2008
// Sistema...........: Atena - Automacao Clinica Odontologica
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit untCadCidade;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls, JvTransBtn, Grids, DBGrids, JvLabel,
  JvComponent, JvEnterTab, fcLabel, ExtCtrls, fcpanel, EMsgDlg, db, dbTables,
  JvLookup;

type
  TfrmCadCidade = class(TForm)
    pnTop: TfcPanel;
    fcLabel2: TfcLabel;
    JvEnterAsTab1: TJvEnterAsTab;
    pnCentro: TfcPanel;
    JvLabel10: TJvLabel;
    dbGridCid: TDBGrid;
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
    dbCidade: TDBEdit;
    cmbUf: TJvDBLookupCombo;
    JvLabel18: TJvLabel;
    MsgDlg: TEvMsgDlg;
    procedure btnSairClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
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
    procedure dbCidadeExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    fOutraJan : Boolean;
  public
    { Public declarations }
    property OutraJan : Boolean read fOutraJan write fOutraJan;
  end;

var
  frmCadCidade : TfrmCadCidade;
  NovoItem     : Boolean      ;
  Mudar        : Boolean      ;
  vAltera      : Boolean      ;

implementation

uses untdmDados, untPrincipal;

{$R *.dfm}

procedure TfrmCadCidade.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmCadCidade.FormActivate(Sender: TObject);
begin
  NovoItem:= false;
  FrmPrincipal.StatusTeclas(True,'[Insert] Novo [Home] Alterar [End] Gravar [Delete] Excluir [Esc] Cancelar ou Sair');
end;

procedure TfrmCadCidade.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if (not OutraJan) then
    dmDados.tbCidade.Close;
  FrmPrincipal.StatusTeclas(False,'');
  Action := caFree;
end;

procedure TfrmCadCidade.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    case (key) of
      // Teclas de a��o na tabela
      VK_Insert : if (dmDados.vTabStt)    then btnNovo.Click   ;
      VK_Home   : if (dmDados.vTabStt)    then btnAlterar.Click;
      VK_Delete : if (dmDados.vTabStt)    then btnDeletar.Click;
      VK_End    : if not(dmDados.vTabStt) then btnGravar.Click ;
      VK_ESCAPE : if not(dmDados.vTabStt) then btnCancelar.Click
                  else btnSair.Click;
    end;
end;

procedure TfrmCadCidade.btnPrimeiroClick(Sender: TObject);
begin
  dmDados.tbCidade.First;
  btnPrimeiro.Enabled := False;
  btnAnterior.Enabled := False;
  btnProximo.Enabled  := True ;
  btnUltimo.Enabled   := True ;
  dmDados.vTabStt:=True;
end;

procedure TfrmCadCidade.btnAnteriorClick(Sender: TObject);
begin
  dmDados.tbCidade.Prior;
  btnProximo.Enabled := True;
  btnUltimo.Enabled  := True;
  If dmDados.tbCidade.Bof Then
    Begin
    btnPrimeiro.Enabled := False;
    btnAnterior.Enabled := False;
    End;
  dmDados.vTabStt:=True;
end;

procedure TfrmCadCidade.btnProximoClick(Sender: TObject);
begin
  dmDados.tbCidade.Next;
  btnPrimeiro.Enabled := True;
  btnAnterior.Enabled := True;
  If dmDados.tbCidade.Eof Then
    Begin
    btnProximo.Enabled := False;
    btnUltimo.Enabled  := False;
    End;
  dmDados.vTabStt:=True;
end;

procedure TfrmCadCidade.btnUltimoClick(Sender: TObject);
begin
  dmDados.tbCidade.Last;
  btnPrimeiro.Enabled := True ;
  btnAnterior.Enabled := True ;
  btnProximo.Enabled  := False;
  btnUltimo.Enabled   := False;
  dmDados.vTabStt:=True;
end;

procedure TfrmCadCidade.btnNovoClick(Sender: TObject);
begin
  dmDados.tbCidade.Append;
  NovoItem            := True ;
  dmDados.vTabStt     := False;
  {habilitando os bot�es}
  btnGravar.Enabled   := True ;
  btnCancelar.Enabled := True ;
  btnNovo.Enabled     := False;
  btnPrimeiro.Enabled := False;
  btnAnterior.Enabled := False;
  btnProximo.Enabled  := False;
  btnUltimo.Enabled   := False;
  btnAlterar.Enabled  := False;
  btnDeletar.Enabled  := False;
  {habilitando os componentes}
  dbCidade.Enabled    := True ;
  cmbUf.Enabled       := True ;
  dbGridCid.Enabled   := True ;
  dbCidade.SetFocus;
end;

procedure TfrmCadCidade.btnGravarClick(Sender: TObject);
Var
  Campos:String;
  Vazio,Gravar:Boolean;
  tabela: ttable;
begin
  Campos:='';
  Gravar:=True;
  Vazio:=False;
  Tabela := TTable.Create(Application);
  Tabela.TableName := dmDados.tbCidade.TableName;
  Tabela.IndexName := dmDados.tbCidade.IndexName;
  Tabela.Open;
	If dbCidade.Text='' Then
  	Begin
    If Length(Campos)>0 Then
    	Campos:=Campos+', ';
    Campos:=Campos+'Cidade';
    Gravar:=False;
    Vazio:=True;
    end
  else
    If Tabela.Locate('Cidade',dbCidade.Text,[]) Then
      If not((dmDados.tbCidade.State=dsEdit) And (dmDados.tbCidade.RecNo = Tabela.RecNo)) Then
        begin
        Gravar:=False;
        MsgDlg.MsgWarning('Cidade j� cadastrada!');
        end;
  if gravar then
    begin
    NovoItem:= False;
    dmDados.tbCidade.Post;
    dmDados.vTabStt     := True ;
    //Ajusta bot�es
    btnGravar.enabled   := False;
    btnCancelar.Enabled := False;
    btnNovo.Enabled     := True ;
    btnPrimeiro.Enabled := True ;
    btnAnterior.Enabled := True ;
    btnProximo.Enabled  := True ;
    btnUltimo.Enabled   := True ;
    btnAlterar.Enabled  := True ;
    btndeletar.Enabled  := True ;
    //desabilitando os componentes
    dbCidade.Enabled    := False;
    cmbUf.Enabled       := False;
    dbGridCid.Enabled   := False;
    MsgDlg.MsgInformation('Dados gravados com sucesso!');
    dmDados.tbCidade.Refresh;
    pnBotoes.SetFocus;
    end
  else
    If Vazio Then
      begin
      MsgDlg.MsgWarning('O(s) Campo(s) '+Campos+' n�o tem Valor(es) ');
      dbCidade.Enabled:=true;
      end;
end;

procedure TfrmCadCidade.btnCancelarClick(Sender: TObject);
begin
  dmDados.tbCidade.cancel;
  NovoItem            := False;
  dmDados.vTabStt     := True ;
  {Desabilitando os bot�es}
  btnGravar.enabled   := False ;
  btnCancelar.Enabled := False ;
  btnNovo.Enabled     := True  ;
  btnPrimeiro.Enabled := True  ;
  btnAnterior.Enabled := True  ;
  btnProximo.Enabled  := True  ;
  btnUltimo.Enabled   := True  ;
  btnAlterar.Enabled  := True  ;
  btndeletar.Enabled  := True  ;
  {Desabilitando os componentes}
  dbCidade.Enabled    := False ;
  cmbUf.Enabled       := False ;
  dbGridCid.Enabled   := False ;
  pnBotoes.SetFocus;
end;

procedure TfrmCadCidade.btnAlterarClick(Sender: TObject);
begin
  if dmDados.tbCidade.RecordCount=0 then
    MsgDlg.MsgError('Tabela vazia')
  else
    begin
    NovoItem:=true;
    dmDados.vTabStt:=false;
    dmDados.tbCidade.Edit;
    //habilitar os bot�es
    btnCancelar.enabled   := True  ;
    btnGravar.Enabled     := True  ;
    btnNovo.Enabled       := False ;
    btnPrimeiro.Enabled   := False ;
    btnAnterior.Enabled   := False ;
    btnProximo.Enabled    := False ;
    btnUltimo.Enabled     := False ;
    btnAlterar.Enabled    := False ;
    btndeletar.Enabled    := False ;
    {Habilitando os Componentes}
    dbCidade.enabled:=true;
    dbGridCid.Enabled:=True;
    dbCidade.SetFocus;
    end;
end;

procedure TfrmCadCidade.btnDeletarClick(Sender: TObject);
var
  Flag : Boolean;
begin
  Flag := False;
  if (dmDados.tbCidade.RecordCount = 0) then
    MsgDlg.MsgError('Tabela vazia')
  else
    if MsgDlg.MsgConfirmation('Tem certeza que deseja excluir este registro?') = id_yes then
      begin
      if (Flag) then
        MsgDlg.MsgInformation('Cidade ativa, ou com registro de opera��es anteriores, n�o pode ser exclu�da !!!')
      else
        dmDados.tbCidade.Delete;
      end
    else
      dmDados.tbCidade.cancel;
end;

procedure TfrmCadCidade.dbCidadeExit(Sender: TObject);
begin
  pnBotoes.SetFocus;
end;

procedure TfrmCadCidade.FormShow(Sender: TObject);
begin
  if (dmDados.tbCidade.State = dsInactive) then
    dmDados.tbCidade.Open;
end;

procedure TfrmCadCidade.FormCreate(Sender: TObject);
begin
  OutraJan := False;
end;

end.
