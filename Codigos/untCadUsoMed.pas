//////////////////////////////////////////////////////////////////////////
// Criacao...........: 08/2008
// Sistema...........: Atena - Automacao Clinica Odontologica
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit untCadUsoMed;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls, EMsgDlg, JvTransBtn, Grids, DBGrids,
  JvLabel, JvComponent, JvEnterTab, fcLabel, ExtCtrls, fcpanel, DB, DBTables;

type
  TfrmCadUsoMed = class(TForm)
    pnTop: TfcPanel;
    fcLabel2: TfcLabel;
    JvEnterAsTab1: TJvEnterAsTab;
    pnCentro: TfcPanel;
    JvLabel10: TJvLabel;
    gridUso: TDBGrid;
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
    dbUso: TDBEdit;
    MsgDlg: TEvMsgDlg;
    procedure btnSairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbUsoExit(Sender: TObject);
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
  frmCadUsoMed: TfrmCadUsoMed;
  NovoItem    : Boolean      ;

implementation

uses untdmDados, untPrincipal;

{$R *.dfm}

procedure TfrmCadUsoMed.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmCadUsoMed.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if (not OutraJan) then
    begin
    dmDados.tbMedicamento.Close ;
    dmDados.tbUsoMed.Close;
    dmDados.tbTipoMed.Close;
    frmPrincipal.StatusTeclas(False,'');
    Action := CaFree;
    end;
end;

procedure TfrmCadUsoMed.dbUsoExit(Sender: TObject);
Var
  Tabela: TTable;
begin
  Tabela := TTable.Create(Application);
  Tabela.DatabaseName := dmDados.tbUsoMed.DatabaseName;
  Tabela.TableName    := dmDados.tbUsoMed.TableName   ;
  Tabela.IndexName    := dmdados.tbUsoMed.IndexName   ;
  Tabela.Open;
  if NovoItem then
    if dbUso.Text = '' then
      begin
      MsgDlg.MsgError('� necess�rio Informar o Uso!');
      dbUso.setfocus;
      end
    else
      if Tabela.Locate('Uso',dbUso.Text,[]) then
        if not ((DmDados.tbUsoMed.State=dsEdit) And (dmDados.tbUsoMed.RecNo = Tabela.RecNo)) then
          begin
          MsgDlg.MsgWarning('Uso j� cadastrado!');
          dbUso.Clear;
          dbUso.setfocus;
          end;
  Tabela.Free;
end;

procedure TfrmCadUsoMed.btnPrimeiroClick(Sender: TObject);
begin
  dmDados.tbUsoMed.First;
  BtnPrimeiro.Enabled := False;
  BtnAnterior.Enabled := False;
  BtnProximo.Enabled  := True ;
  BtnUltimo.Enabled   := True ;
  dmDados.vTabStt:=True;
end;

procedure TfrmCadUsoMed.btnAnteriorClick(Sender: TObject);
begin
  dmDados.tbUsoMed.Prior;
  BtnProximo.Enabled := True;
  BtnUltimo.Enabled  := True;
  If DMDados.tbUsoMed.Bof Then
    Begin
    BtnPrimeiro.Enabled := False;
    BtnAnterior.Enabled := False;
    End;
  dmDados.vTabStt:=True;
end;

procedure TfrmCadUsoMed.btnProximoClick(Sender: TObject);
begin
  dmDados.tbUsoMed.Next;
  BtnPrimeiro.Enabled := True;
  BtnAnterior.Enabled := True;
  If DMDados.tbUsoMed.Eof Then
    Begin
    BtnProximo.Enabled := False;
    BtnUltimo.Enabled := False;
    End;
  dmDados.vTabStt:=True;
end;

procedure TfrmCadUsoMed.btnUltimoClick(Sender: TObject);
begin
  dmDados.tbUsoMed.Last;
  BtnPrimeiro.Enabled := True ;
  BtnAnterior.Enabled := True ;
  BtnProximo.Enabled  := False;
  BtnUltimo.Enabled   := False;
  dmDados.vTabStt:=True;
end;

procedure TfrmCadUsoMed.btnNovoClick(Sender: TObject);
begin
  dmdados.tbUsoMed.Append;
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
  dbUso.Enabled   := True;
  gridUso.Enabled := True;
  dbUso.SetFocus;
end;

procedure TfrmCadUsoMed.btnGravarClick(Sender: TObject);
var
  Campos:String;
  Vazio,Gravar:Boolean;
  tabela: ttable;
begin
  Campos :='';
  Gravar :=True;
  Vazio  :=False;
  Tabela := TTable.Create(Application);
  Tabela.DatabaseName := dmDados.tbUsoMed.DatabaseName;
  Tabela.TableName    := dmDados.tbUsoMed.TableName;
  Tabela.IndexName    := dmdados.tbUsoMed.IndexName;
  Tabela.Open;
	if dbUso.Text='' then
  	begin
    if Length(Campos)>0 then Campos:=Campos+', ';
    Campos:=Campos+'Uso';
    Gravar:=False;
    Vazio:=True;
  	End
  else
    if Tabela.Locate('Uso',dbUso.Text,[]) then
      if not((DmDados.tbUsoMed.State=dsEdit) And (dmDados.tbUsoMed.RecNo = Tabela.RecNo)) then
        begin
        Gravar:=False;
        MsgDlg.MsgWarning('Uso j� cadastrado!');
        dbUso.SetFocus;
        end;
  If Gravar Then
    begin
    dmdados.tbUsoMed.Post;
    NovoItem        := False;
    dmDados.vTabStt := True ;
    // Ajusta Bot�es
    BtnGravar.Enabled   := False;
    BtnCancelar.Enabled := False;
    BtnNovo.Enabled     := True ;
    BtnPrimeiro.Enabled := True ;
    BtnAnterior.Enabled := True ;
    BtnProximo.Enabled  := True ;
    BtnUltimo.Enabled   := True ;
    BtnAlterar.Enabled  := True ;
    Btndeletar.Enabled  := True ;
    // Desabilitando os Componentes
    dbUso.Enabled     := False;
    gridUso.Enabled   := False;
    MsgDlg.MsgInformation('Dados gravados com sucesso!');
    dmDados.tbUsoMed.Refresh;
    pnBotoes.SetFocus;
    end
  else
    begin
    if Vazio then
      MsgDlg.MsgWarning('O(s) Campo(s) '+Campos+' n�o tem Valor(es) ');
    dbUso.Enabled:=true;
    end;
  tabela.Free;
end;

procedure TfrmCadUsoMed.btnCancelarClick(Sender: TObject);
begin
  dmdados.tbUsoMed.cancel;
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
  dbUso.Enabled   := False;
  gridUso.Enabled := False;
  pnBotoes.SetFocus;
end;

procedure TfrmCadUsoMed.btnAlterarClick(Sender: TObject);
begin
  if dmdados.tbUsoMed.RecordCount=0 then
    MsgDlg.MsgError('Tabela sem registro!!!')
  else
    begin
    NovoItem := True;
    dmdados.tbUsoMed.Edit;
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
    dbUso.Enabled      := True ;
    gridUso.Enabled    := True ;
    dmDados.vTabStt:=False;
    dbUso.SetFocus;
    end;
end;

procedure TfrmCadUsoMed.btnDeletarClick(Sender: TObject);
begin
  if (dmDados.tbTipoMed.RecordCount = 0) then
    MsgDlg.MsgError('Tabela vazia!!!')
  else
    if (MsgDlg.MsgConfirmation('Tem certeza que deseja excluir este registro?') = id_yes) then
      if (dmdados.tbMedicamento.Locate('CodUso',dmdados.tbUsoMedCodUso.Value,[])) then
        MsgDlg.MsgInformation('Uso de medicamento ativo no cadastro de Medicamentos.||N�o pode ser EXCLU�DO!!!')
      else
        dmDados.tbUsoMed.Delete;
end;

procedure TfrmCadUsoMed.FormActivate(Sender: TObject);
begin
  frmPrincipal.StatusTeclas(True,' [Insert] Novo [Home] Alterar [End] Gravar [Delete] Excluir [Esc] Cancelar ou Sair');
end;

procedure TfrmCadUsoMed.FormCreate(Sender: TObject);
begin
  OutraJan := False;
end;

procedure TfrmCadUsoMed.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case (key) of
    // Teclas de a��o na tabela
    VK_Insert : if (dmDados.vTabStt) then btnNovo.Click;
    VK_Home   : if (dmDados.vTabStt) then btnAlterar.Click;
    VK_Delete : if (dmDados.vTabStt) then btnDeletar.Click;
    VK_End    : if not(dmDados.vTabStt) then btnGravar.Click;
    VK_ESCAPE : if not(dmDados.vTabStt) then btnCancelar.Click
                else btnSair.Click;
  end;
end;

procedure TfrmCadUsoMed.FormShow(Sender: TObject);
begin
  dmDados.vTabStt := True;
  if (dmDados.tbMedicamento.State = dsInactive) then
    dmDados.tbMedicamento.Open;
  if (dmDados.tbUsoMed.State      = dsInactive) then
    dmDados.tbUsoMed.Open;
  if (dmDados.tbTipoMed.State     = dsInactive) then
    dmDados.tbTipoMed.Open;
end;

end.
