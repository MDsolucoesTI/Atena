//////////////////////////////////////////////////////////////////////////
// Criacao...........: 08/2008
// Sistema...........: Atena - Automacao Clinica Odontologica
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit untCadTipoMed;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls, EMsgDlg, JvTransBtn, Grids, DBGrids,
  JvLabel, JvComponent, JvEnterTab, fcLabel, ExtCtrls, fcpanel, DB, DBTables;

type
  TfrmCadTipoMed = class(TForm)
    pnTop: TfcPanel;
    fcLabel2: TfcLabel;
    JvEnterAsTab1: TJvEnterAsTab;
    pnCentro: TfcPanel;
    JvLabel10: TJvLabel;
    gridTipo: TDBGrid;
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
    MsgDlg: TEvMsgDlg;
    procedure btnSairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbTipoExit(Sender: TObject);
    procedure btnPrimeiroClick(Sender: TObject);
    procedure btnAnteriorClick(Sender: TObject);
    procedure btnProximoClick(Sender: TObject);
    procedure btnUltimoClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnDeletarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
   private
     { Private declarations }
    fOutraJan : Boolean;
   public
    { Public declarations }
    property OutraJan : Boolean read fOutraJan write fOutraJan;
end;

var
  frmCadTipoMed: TfrmCadTipoMed;
  NovoItem     : Boolean       ;

implementation

uses untdmDados, untPrincipal;

{$R *.dfm}

procedure TfrmCadTipoMed.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmCadTipoMed.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if (not OutraJan) then
    begin
    dmDados.tbTipoMed.Close;
    dmDados.tbUsoMed.Close;
    dmDados.tbMedicamento.Close;
    frmPrincipal.StatusTeclas(False,'');
    Action := CaFree;
    end;
end;

procedure TfrmCadTipoMed.dbTipoExit(Sender: TObject);
Var
  Tabela: TTable;
begin
  Tabela := TTable.Create(Application);
  Tabela.DatabaseName := dmDados.tbTipoMed.DatabaseName;
  Tabela.TableName    := dmDados.tbTipoMed.TableName   ;
  Tabela.IndexName    := dmdados.tbTipoMed.IndexName   ;
  Tabela.Open;
  if NovoItem then
    if dbTipo.Text = '' then
      begin
      MsgDlg.MsgError('� necess�rio Informar o Tipo!');
      dbTipo.setfocus;
      end
    else
      if Tabela.Locate('TipoMed',dbTipo.Text,[]) then
        if not ((DmDados.tbTipoMed.State=dsEdit) And (dmDados.tbTipoMed.RecNo = Tabela.RecNo)) then
          begin
          MsgDlg.MsgWarning('Tipo j� cadastrado!');
          dbTipo.Clear;
          dbTipo.setfocus;
          end;
  Tabela.Free;
end;

procedure TfrmCadTipoMed.btnPrimeiroClick(Sender: TObject);
begin
  dmDados.tbTipoMed.First;
  BtnPrimeiro.Enabled := False;
  BtnAnterior.Enabled := False;
  BtnProximo.Enabled  := True ;
  BtnUltimo.Enabled   := True ;
  dmDados.vTabStt:=True;
end;

procedure TfrmCadTipoMed.btnAnteriorClick(Sender: TObject);
begin
  dmDados.tbTipoMed.Prior;
  BtnProximo.Enabled := True;
  BtnUltimo.Enabled  := True;
  If DMDados.tbTipoMed.Bof Then
    Begin
    BtnPrimeiro.Enabled := False;
    BtnAnterior.Enabled := False;
    End;
  dmDados.vTabStt:=True;
end;

procedure TfrmCadTipoMed.btnProximoClick(Sender: TObject);
begin
  dmDados.tbTipoMed.Next;
  BtnPrimeiro.Enabled := True;
  BtnAnterior.Enabled := True;
  If DMDados.tbTipoMed.Eof Then
    Begin
    BtnProximo.Enabled := False;
    BtnUltimo.Enabled  := False;
    End;
  dmDados.vTabStt:=True;
end;

procedure TfrmCadTipoMed.btnUltimoClick(Sender: TObject);
begin
  dmDados.tbTipoMed.Last;
  BtnPrimeiro.Enabled := True ;
  BtnAnterior.Enabled := True ;
  BtnProximo.Enabled  := False;
  BtnUltimo.Enabled   := False;
  dmDados.vTabStt:=True;
end;

procedure TfrmCadTipoMed.btnNovoClick(Sender: TObject);
begin
  dmdados.tbTipoMed.Append;
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
  dbTipo.Enabled   := True;
  gridTipo.Enabled := True;
  dbTipo.SetFocus;
end;

procedure TfrmCadTipoMed.btnGravarClick(Sender: TObject);
var
  Campos:String;
  Vazio,Gravar:Boolean;
  tabela: ttable;
begin
  Campos :='';
  Gravar :=True;
  Vazio  :=False;
  Tabela := TTable.Create(Application);
  Tabela.DatabaseName := dmDados.tbTipoMed.DatabaseName;
  Tabela.TableName    := dmDados.tbTipoMed.TableName;
  Tabela.IndexName    := dmdados.tbTipoMed.IndexName;
  Tabela.Open;
	if dbTipo.Text='' then
  	begin
    if Length(Campos)>0 then Campos:=Campos+', ';
    Campos:=Campos+'Tipo';
    Gravar:=False;
    Vazio:=True;
  	End
  else
    if Tabela.Locate('TipoMed',dbTipo.Text,[]) then
      if not((DmDados.tbTipoMed.State=dsEdit) And (dmDados.tbTipoMed.RecNo = Tabela.RecNo)) then
        begin
        Gravar:=False;
        MsgDlg.MsgWarning('Tipo j� cadastrado!');
        dbTipo.SetFocus;
        end;
  If Gravar Then
    begin
    dmdados.tbTipoMed.Post;
    NovoItem        := False;
    dmDados.vTabStt := True ;
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
    dbTipo.Enabled     := False;
    gridTipo.Enabled   := False;
    MsgDlg.MsgInformation('Dados gravados com sucesso!');
    dmDados.tbTipoMed.Refresh;
    pnBotoes.SetFocus;
    end
  else
    begin
    if Vazio then
      MsgDlg.MsgWarning('O(s) Campo(s) '+Campos+' n�o tem Valor(es) ');
    dbTipo.Enabled:=true;
    end;
  tabela.Free;
end;

procedure TfrmCadTipoMed.btnCancelarClick(Sender: TObject);
begin
  dmdados.tbTipoMed.cancel;
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
  dbTipo.Enabled   := False;
  gridTipo.Enabled := False;
  pnBotoes.SetFocus;
end;

procedure TfrmCadTipoMed.btnAlterarClick(Sender: TObject);
begin
  if dmdados.tbTipoMed.RecordCount=0 then
    MsgDlg.MsgError('Tabela sem registro!!!')
  else
    begin
    NovoItem := True;
    dmdados.tbTipoMed.Edit;
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
    dbTipo.Enabled      := True ;
    gridTipo.Enabled    := True ;
    dmDados.vTabStt     := False;
    dbTipo.SetFocus;
    end;
end;

procedure TfrmCadTipoMed.btnDeletarClick(Sender: TObject);
begin
  if (dmDados.tbTipoMed.RecordCount = 0) then
    MsgDlg.MsgError('Tabela vazia!!!')
  else
    if (MsgDlg.MsgConfirmation('Tem certeza que deseja excluir este registro?') = id_yes) then
      if (dmdados.tbMedicamento.Locate('CodTipo',dmdados.tbTipoMedCodTipo.Value,[])) then
        MsgDlg.MsgInformation('Tipo de medicamento ativo no cadastro de Medicamentos.||N�o pode ser EXCLU�DO!!!')
      else
        dmDados.tbTipoMed.Delete;
end;

procedure TfrmCadTipoMed.FormActivate(Sender: TObject);
begin
  frmPrincipal.StatusTeclas(True,' [Insert] Novo [Home] Alterar [End] Gravar [Delete] Excluir [Esc] Cancelar ou Sair');
end;

procedure TfrmCadTipoMed.FormCreate(Sender: TObject);
begin
  OutraJan := False;
end;

procedure TfrmCadTipoMed.FormKeyDown(Sender: TObject; var Key: Word;
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

procedure TfrmCadTipoMed.FormShow(Sender: TObject);
begin
  dmDados.vTabStt := True;
  if (dmDados.tbTipoMed.State     = dsInactive) then
    dmDados.tbTipoMed.Open;
  if (dmDados.tbUsoMed.State      = dsInactive) then
    dmDados.tbUsoMed.Open;
  if (dmDados.tbMedicamento.State = dsInactive) then
    dmDados.tbMedicamento.Open;
end;

end.
