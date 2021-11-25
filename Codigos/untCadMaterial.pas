//////////////////////////////////////////////////////////////////////////
// Criacao...........: 08/2008
// Sistema...........: Atena - Automacao Clinica Odontologica
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit untCadMaterial;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, JvComponent, JvTransBtn, fcLabel, ExtCtrls, fcpanel, ToolEdit, DB,
  Menus, RxMenus, EMsgDlg, Grids, DBGrids, RXDBCtrl, JvPanel,
  JvTransparentPanel, JvToolEdit, JvCurrEdit, JvDBCtrl, DBCtrls, RxLookup,
  StdCtrls, Mask, JvLabel, JvEnterTab, fcButton, fcImgBtn, ExtDlgs;

type
  TfrmCadMaterial = class(TForm)
    pnTop: TfcPanel;
    pnBotoes: TfcPanel;
    pnCentro: TfcPanel;
    btnPrimeiro: TJvTransparentButton;
    btnAnterior: TJvTransparentButton;
    btnProximo: TJvTransparentButton;
    btnUltimo: TJvTransparentButton;
    btnNovo: TJvTransparentButton;
    btnGravar: TJvTransparentButton;
    btnCancelar: TJvTransparentButton;
    btnAlterar: TJvTransparentButton;
    btnDeletar: TJvTransparentButton;
    btnLocalizar: TJvTransparentButton;
    btnSair: TJvTransparentButton;
    JvLabel10: TJvLabel;
    JvLabel1: TJvLabel;
    JvLabel2: TJvLabel;
    dbGrupo: TDBEdit;
    JvLabel3: TJvLabel;
    cmbSubGrupo: TRxDBLookupCombo;
    JvLabel4: TJvLabel;
    cmbMarca: TRxDBLookupCombo;
    JvLabel5: TJvLabel;
    cmbUnid: TRxDBLookupCombo;
    JvLabel9: TJvLabel;
    dbEstMin: TDBEdit;
    JvLabel11: TJvLabel;
    dbEstMax: TDBEdit;
    JvLabel12: TJvLabel;
    dbEstAt: TDBEdit;
    JvLabel6: TJvLabel;
    JvLabel7: TJvLabel;
    dbDtUlComp: TDBDateEdit;
    btnCompra: TJvTransparentButton;
    dbFoto: TDBImage;
    JvLabel8: TJvLabel;
    dbCodMat: TDBEdit;
    dbMat: TDBEdit;
    dbPrComp: TJvDBCalcEdit;
    JvLabel13: TJvLabel;
    dbDtCad: TDBDateEdit;
    JvTransparentPanel1: TJvTransparentPanel;
    GridMat: TRxDBGrid;
    JvEnterAsTab1: TJvEnterAsTab;
    popFoto: TRxPopupMenu;
    Incluir1: TMenuItem;
    Excluir1: TMenuItem;
    fcLabel1: TfcLabel;
    AbreFigura: TOpenPictureDialog;
    MsgDlg: TEvMsgDlg;
    procedure btnSairClic(Sender: TObject);
    procedure btnLocalizarClick(Sender: TObject);
    procedure dbDtUlCompExit(Sender: TObject);
    procedure btnCompraClick(Sender: TObject);
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
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbFotoDblClick(Sender: TObject);
    procedure Incluir1Click(Sender: TObject);
    procedure Excluir1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadMaterial : TfrmCadMaterial;
  NovoItem       : Boolean        ;

implementation

uses untdmDados, untPrincipal, untLocMat, untCadCompra;

{$R *.dfm}

procedure TfrmCadMaterial.btnSairClic(Sender: TObject);
begin
  Close;
end;

procedure TfrmCadMaterial.btnLocalizarClick(Sender: TObject);
begin
  frmLocMat:=TfrmLocMat.create(application);
  frmLocMat.Show;
end;

procedure TfrmCadMaterial.dbDtUlCompExit(Sender: TObject);
begin
  pnBotoes.SetFocus;
end;

procedure TfrmCadMaterial.btnCompraClick(Sender: TObject);
begin
  frmCadCompra:=TfrmCadCompra.create(application);
  frmCadCompra.Show;
end;

procedure TfrmCadMaterial.btnPrimeiroClick(Sender: TObject);
begin
  dmDados.tbMaterial.First;
  btnPrimeiro.Enabled := False;
  btnAnterior.Enabled := False;
  btnProximo.Enabled  := True ;
  btnUltimo.Enabled   := True ;
  dmDados.vTabStt     := True ;
end;

procedure TfrmCadMaterial.btnAnteriorClick(Sender: TObject);
begin
  dmDados.tbMaterial.Prior;
  btnProximo.Enabled := True;
  btnUltimo.Enabled  := True;
  if DMDados.tbMaterial.Bof then
    begin
    btnPrimeiro.Enabled := False;
    btnAnterior.Enabled := False;
    end;
  dmDados.vTabStt    := True;
end;

procedure TfrmCadMaterial.btnProximoClick(Sender: TObject);
begin
  dmDados.tbMaterial.Next;
  btnPrimeiro.Enabled := True;
  btnAnterior.Enabled := True;
  If dmDados.tbMaterial.Eof Then
    Begin
    btnProximo.Enabled := False;
    btnUltimo.Enabled  := False;
    End;
  dmDados.vTabStt     := True;
end;

procedure TfrmCadMaterial.btnUltimoClick(Sender: TObject);
begin
  dmDados.tbMaterial.Last;
  btnPrimeiro.Enabled := True ;
  btnAnterior.Enabled := True ;
  btnProximo.Enabled  := False;
  btnUltimo.Enabled   := False;
  dmDados.vTabStt     := True ;
end;

procedure TfrmCadMaterial.btnNovoClick(Sender: TObject);
begin
  dmdados.tbMaterial.Append;
  NovoItem            := True ;
  dmDados.vTabStt     := False;
  // Ajusta bot�es
  btnGravar.Enabled   := true ;
  btnCancelar.Enabled := true ;
  btnNovo.Enabled     := False;
  btnPrimeiro.Enabled := False;
  btnAnterior.Enabled := False;
  btnProximo.Enabled  := False;
  btnUltimo.Enabled   := False;
  btnAlterar.Enabled  := False;
  btnDeletar.Enabled  := False;
  // Habilitando os componentes
  cmbMarca.Enabled    := True ;
  cmbSubGrupo.Enabled := True ;
  cmbUnid.Enabled     := True ;
  dbCodMat.Enabled    := True ;
  dbDtCad.Enabled     := True ;
  dbDtUlComp.Enabled  := True ;
  dbEstAt.Enabled     := True ;
  dbEstMax.Enabled    := True ;
  dbEstMin.Enabled    := True ;
  dbFoto.Enabled      := True ;
  dbMat.Enabled       := True ;
  dbPrComp.Enabled    := True ;
  GridMat.Enabled     := True ;
  dbCodMat.SetFocus;
end;

procedure TfrmCadMaterial.btnGravarClick(Sender: TObject);
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
  if (dbCodMat.Text = '') then
    begin
    if (Length(Campos) > 0) then
      Campos := Campos + ', ';
    Campos := 'C�digo';
    Gravar := False ;
    Vazio  := True  ;
    end;
  if (dbMat.Text = '') then
    begin
    if (Length(Campos) > 0) then
      Campos := Campos + ', ';
    Campos := 'Material';
    Gravar := False ;
    Vazio  := True  ;
    end;
  if Gravar Then
    begin
    NovoItem:= False;
    dmdados.tbMaterial.Post;
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
    cmbMarca.Enabled    := False;
    cmbSubGrupo.Enabled := False;
    cmbUnid.Enabled     := False;
    dbCodMat.Enabled    := False;
    dbDtCad.Enabled     := False;
    dbDtUlComp.Enabled  := False;
    dbEstAt.Enabled     := False;
    dbEstMax.Enabled    := False;
    dbEstMin.Enabled    := False;
    dbFoto.Enabled      := False;
    dbMat.Enabled       := False;
    dbPrComp.Enabled    := False;
    GridMat.Enabled     := False;
    MsgDlg.MsgInformation('Dados gravados com sucesso!');
    dmDados.tbMaterial.Refresh;
    pnBotoes.SetFocus;
    end
  else
    if (Vazio) then
      begin
      MsgDlg.MsgWarning('O(s) Campo(s) '+Campos+' n�o tem Valor(es) ');
      dbCodMat.Enabled := True;
      dbCodMat.SetFocus;
      end;
end;

procedure TfrmCadMaterial.btnCancelarClick(Sender: TObject);
begin
  dmdados.tbMaterial.Cancel;
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
  // Desabilitando os Componentes
  cmbMarca.Enabled    := False;
  cmbSubGrupo.Enabled := False;
  cmbUnid.Enabled     := False;
  dbCodMat.Enabled    := False;
  dbDtCad.Enabled     := False;
  dbDtUlComp.Enabled  := False;
  dbEstAt.Enabled     := False;
  dbEstMax.Enabled    := False;
  dbEstMin.Enabled    := False;
  dbFoto.Enabled      := False;
  dbMat.Enabled       := False;
  dbPrComp.Enabled    := False;
  GridMat.Enabled     := False;
  pnBotoes.SetFocus;
end;

procedure TfrmCadMaterial.btnAlterarClick(Sender: TObject);
begin
  if (dmDados.tbMaterial.RecordCount = 0) then
    MsgDlg.MsgError('Tabela sem registro!!!')
  else
    begin
    NovoItem            := True ;
    dmDados.vTabStt     := False;
    dmdados.tbMaterial.Edit;
    // Ajusta Bot�es
    BtnCancelar.Enabled := True ;
    BtnGravar.Enabled   := True ;
    BtnNovo.Enabled     := False;
    BtnPrimeiro.Enabled := False;
    BtnAnterior.Enabled := False;
    BtnProximo.Enabled  := False;
    BtnUltimo.Enabled   := False;
    BtnAlterar.Enabled  := False;
    Btndeletar.Enabled  := False;
    // Habilitando os componentes
    cmbMarca.Enabled    := True ;
    cmbSubGrupo.Enabled := True ;
    cmbUnid.Enabled     := True ;
    dbCodMat.Enabled    := True ;
    dbDtCad.Enabled     := True ;
    dbDtUlComp.Enabled  := True ;
    dbEstAt.Enabled     := True ;
    dbEstMax.Enabled    := True ;
    dbEstMin.Enabled    := True ;
    dbFoto.Enabled      := True ;
    dbMat.Enabled       := True ;
    dbPrComp.Enabled    := True ;
    GridMat.Enabled     := True ;
    dbCodMat.SetFocus;
    end;
end;

procedure TfrmCadMaterial.btnDeletarClick(Sender: TObject);
begin
  if (dmDados.tbMaterial.RecordCount = 0) then
    MsgDlg.MsgError('Tabela vazia')
  else
    if (MsgDlg.MsgConfirmation('Tem certeza que deseja excluir este registro?') = id_yes) then
      dmDados.tbMaterial.Delete;
end;

procedure TfrmCadMaterial.FormKeyDown(Sender: TObject; var Key: Word;
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

procedure TfrmCadMaterial.FormShow(Sender: TObject);
begin
  dmDados.vTabStt:=True;
  if (dmDados.tbMaterial.State = dsInactive)  then
    dmDados.tbMaterial.Open;
  if (dmDados.tbMarca.State    = dsInactive)  then
    dmDados.tbMarca.Open;
  if (dmDados.tbGrupo.State    = dsInactive)  then
    dmDados.tbGrupo.Open;
  if (dmDados.tbSubGrupo.State = dsInactive)  then
    dmDados.tbSubGrupo.Open;
  if (dmDados.tbUnidade.State  = dsInactive)  then
    dmDados.tbUnidade.Open;
  FrmPrincipal.StatusTeclas(True,'[Insert] Novo [Home] Alterar [End] Gravar [Delete] Excluir [Esc] Cancelar ou Sair');
end;

procedure TfrmCadMaterial.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  dmDados.tbMaterial.Close ;
  dmDados.tbMarca.Close ;
  dmdados.tbGrupo.Close;
  dmdados.tbSubGrupo.Close;
  dmDados.tbUnidade.Close;
  FrmPrincipal.StatusTeclas(False,'');
  Action:=Cafree;
end;

procedure TfrmCadMaterial.dbFotoDblClick(Sender: TObject);
begin
  if (dmdados.tbMaterial.State=dsedit)or(dmdados.tbMaterial.State=dsInsert) then
    if AbreFigura.Execute then
      dmDados.tbMaterialMAT_FOTO.LoadFromFile(AbreFigura.FileName);
end;

procedure TfrmCadMaterial.Incluir1Click(Sender: TObject);
begin
if (dmdados.tbMaterial.State=dsedit)or(dmdados.tbMaterial.State=dsInsert) then
    if AbreFigura.Execute then
      dmDados.tbMaterialMAT_FOTO.LoadFromFile(AbreFigura.FileName);
end;

procedure TfrmCadMaterial.Excluir1Click(Sender: TObject);
begin
  if (dmdados.tbMaterial.State=dsedit)or(dmdados.tbMaterial.State=dsInsert) then
    dmDados.tbMaterialMAT_FOTO.Clear;
end;

end.
