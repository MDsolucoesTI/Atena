//////////////////////////////////////////////////////////////////////////
// Criacao...........: 08/2008
// Sistema...........: Atena - Automacao Clinica Odontologica
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit untCadDentista;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RXCtrls, jpeg, ExtCtrls, StdCtrls, DBCtrls, EDBZero, RxLookup, DB,
  ToolEdit, RXDBCtrl, Mask, fcButton, fcImgbtn, fcImager, LMDCustomControl,
  LMDCustomPanel, LMDCustomBevelPanel, LMDCustomParentPanel, LMDBackPanel,
  ShellApi, JvComponent, JvTransBtn, JvLabel, JvEnterTab, EMsgDlg, fcLabel,
  JvLookup, JvDBComb, JvPanel, JvTransparentPanel, ExtDlgs;

type
  TfrmCadDentista = class(TForm)
    pnTop: TLMDBackPanel;
    pnBotoes: TLMDBackPanel;
    pnCentro: TLMDBackPanel;
    dbNome: TDBEdit;
    DbCrm: TDBEdit;
    DbEsp1: TDBEdit;
    DbEsp2: TDBEdit;
    dbCod: TDBEdit;
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
    btnAgDent: TJvTransparentButton;
    fcLabel1: TfcLabel;
    JvEnterAsTab2: TJvEnterAsTab;
    JvLabel1: TJvLabel;
    JvLabel2: TJvLabel;
    JvLabel3: TJvLabel;
    JvLabel4: TJvLabel;
    JvLabel5: TJvLabel;
    JvLabel13: TJvLabel;
    dbEnd: TDBEdit;
    JvLabel16: TJvLabel;
    dbBairro: TDBEdit;
    JvLabel17: TJvLabel;
    dbCep: TDBEdit;
    JvLabel19: TJvLabel;
    cmbLkCidade: TRxDBLookupCombo;
    JvLabel14: TJvLabel;
    dbNum: TEvDBZeroEdit;
    JvLabel15: TJvLabel;
    DbCompl: TDBEdit;
    btnCadCid: TfcImagebtn;
    JvLabel18: TJvLabel;
    JvLabel12: TJvLabel;
    dbEmail: TDBEdit;
    btnEmail: TfcImagebtn;
    JvLabel20: TJvLabel;
    dbCPF: TDBEdit;
    dbRG: TDBEdit;
    JvLabel22: TJvLabel;
    JvLabel23: TJvLabel;
    btnTel1: TfcImagebtn;
    dbTel2: TDBEdit;
    btnTel2: TfcImagebtn;
    dbTel3: TDBEdit;
    btnTel3: TfcImagebtn;
    JvLabel21: TJvLabel;
    dbObs: TDBMemo;
    dbTel1: TDBEdit;
    dbFoto: TDBImage;
    JvLabel6: TJvLabel;
    dbEsp3: TDBEdit;
    cmbTel1: TJvDBComboBox;
    cmbTel2: TJvDBComboBox;
    cmbTel3: TJvDBComboBox;
    cmbUf: TJvDBLookupCombo;
    JvTransparentPanel1: TJvTransparentPanel;
    JvLabel7: TJvLabel;
    dbDataCad: TDBDateEdit;
    AbreFigura: TOpenPictureDialog;
    cmbVisUF: TJvDBLookupCombo;
    MsgDlg: TEvMsgDlg;
    procedure btnSairClick(Sender: TObject);
    procedure btnCadCidClick(Sender: TObject);
    procedure btnAgDentClick(Sender: TObject);
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
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure dbFotoDblClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadDentista : TfrmCadDentista;
  NovoItem       : Boolean        ;

implementation

uses untdmDados, untCadCidade, untAgDent, untPrincipal;

{$R *.dfm}

procedure TfrmCadDentista.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmCadDentista.btnCadCidClick(Sender: TObject);
begin
  FrmCadCidade:=TFrmCadCidade.create(application);
  FrmCadCidade.Show;
end;

procedure TfrmCadDentista.btnAgDentClick(Sender: TObject);
begin
  FrmAgDent:=TFrmAgDent.create(application);
  FrmAgDent.Show;
end;

procedure TfrmCadDentista.btnPrimeiroClick(Sender: TObject);
begin
  dmDados.tbProfissional.First;
  btnprimeiro.Enabled := False;
  btnAnterior.Enabled := False;
  btnProximo.Enabled  := True ;
  btnUltimo.Enabled   := True ;
end;

procedure TfrmCadDentista.btnAnteriorClick(Sender: TObject);
begin
  dmDados.tbProfissional.Prior;
  btnProximo.Enabled  := True ;
  btnUltimo.Enabled   := True ;
  if dmDados.tbProfissional.bof then
    begin
    btnPrimeiro.Enabled := False;
    btnAnterior.Enabled := False;
    end;
end;

procedure TfrmCadDentista.btnProximoClick(Sender: TObject);
begin
  dmDados.tbProfissional.Next;
  btnPrimeiro.Enabled := True ;
  btnAnterior.Enabled := True ;
  if dmDados.tbProfissional.Eof then
    begin
    btnProximo.Enabled := False;
    btnUltimo.Enabled  := False;
    end;
end;

procedure TfrmCadDentista.btnUltimoClick(Sender: TObject);
begin
  dmDados.tbProfissional.Next;
  btnPrimeiro.Enabled := True ;
  btnAnterior.Enabled := True ;
  if dmDados.tbProfissional.Eof then
    begin
    btnProximo.Enabled := False;
    btnUltimo.Enabled  := False;
    end;
end;

procedure TfrmCadDentista.btnNovoClick(Sender: TObject);
begin
  dmDados.tbProfissional.Append;
  NovoItem             := True ;
  cmbUf.Visible        := True ;
  cmbVisUF.Visible     := False;
  {habilitando os bot�es}
  btnGravar.Enabled    := True ;
  btnCancelar.Enabled  := True ;
  btnNovo.Enabled      := False;
  btnPrimeiro.Enabled  := False;
  btnAnterior.Enabled  := False;
  btnProximo.Enabled   := False;
  btnUltimo.Enabled    := False;
  btnAlterar.Enabled   := False;
  btnDeletar.Enabled   := False;
  {habilitando os componentes}
  dbNome.Enabled       := True ;
  dbFoto.Enabled       := True ;
  DbCrm.Enabled        := True ;
  DbEsp1.Enabled       := True ;
  DbEsp2.Enabled       := True ;
  dbEsp3.Enabled       := True ;
  dbRG.Enabled         := True ;
  dbCPF.Enabled        := True ;
  dbEnd.Enabled        := True ;
  dbNum.Enabled        := True ;
  dbCompl.Enabled      := True ;
  dbBairro.Enabled     := True ;
  dbCep.Enabled        := True ;
  cmbLkCidade.Enabled  := True ;
  btnCadCid.Enabled    := True ;
  cmbUf.Enabled        := True ;
  dbEmail.Enabled      := True ;
  dbDataCad.Enabled    := True ;
  cmbTel1.Enabled      := True ;
  dbTel1.Enabled       := True ;
  cmbTel2.Enabled      := True ;
  dbTel2.Enabled       := True ;
  cmbTel3.Enabled      := True ;
  dbTel3.Enabled       := True ;
  dbObs.Enabled        := True ;
  dmDados.vTabStt      := False;
  cmbLkCidade.LookupSource               := dmDados.dsCidade;
  dmDados.tbEstado.Locate('EST_SIGLA', 'SP', []);
  dmDados.tbCidade.Locate('CID_CODIGO', 5217, []);
  cmbUf.Value                            := 'SP'            ;
  dmDados.tbProfissionalPRO_CEP.Value    := '11600000'      ;
  dmDados.tbProfissionalCID_CODIGO.Value := 5217            ;
  dbNome.SetFocus;
end;

procedure TfrmCadDentista.btnGravarClick(Sender: TObject);
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
  if (dbNome.Text = '') then
    begin
    if (Length(Campos) > 0) then
      Campos := Campos + ', ';
    Campos := 'Nome Dentista';
    Gravar := False ;
    Vazio  := True  ;
    end;
  if (Gravar) then
    begin
    dmDados.tbProfissional.Post;
    cmbLkCidade.LookupSource := dmDados.dsVisCidade;
    NovoItem             := False;
    dmDados.vTabStt      := True ;
    //Ajusta bot�es
    btnCancelar.enabled  := False;
    btnGravar.Enabled    := False;
    btnNovo.Enabled      := True ;
    btnPrimeiro.Enabled  := True ;
    btnAnterior.Enabled  := True ;
    btnProximo.Enabled   := True ;
    btnUltimo.Enabled    := True ;
    btnAlterar.Enabled   := True ;
    btndeletar.Enabled   := True ;
    {habilitando os componentes}
    dbNome.Enabled       := False;
    dbFoto.Enabled       := False;
    DbCrm.Enabled        := False;
    DbEsp1.Enabled       := False;
    DbEsp2.Enabled       := False;
    dbEsp3.Enabled       := False;
    dbRG.Enabled         := False;
    dbCPF.Enabled        := False;
    dbEnd.Enabled        := False;
    dbNum.Enabled        := False;
    dbCompl.Enabled      := False;
    dbBairro.Enabled     := False;
    dbCep.Enabled        := False;
    cmbLkCidade.Enabled  := False;
    btnCadCid.Enabled    := False;
    cmbUf.Enabled        := False;
    dbEmail.Enabled      := False;
    dbDataCad.Enabled    := False;
    cmbTel1.Enabled      := False;
    dbTel1.Enabled       := False;
    cmbTel2.Enabled      := False;
    dbTel2.Enabled       := False;
    cmbTel3.Enabled      := False;
    dbTel3.Enabled       := False;
    dbObs.Enabled        := False;
    cmbUf.Visible        := False;
    cmbVisUF.Visible     := True ;
    dmDados.vTabStt      := True ;
    MsgDlg.MsgInformation('Dados gravados com sucesso!');
    dmDados.tbProfissional.Refresh;
    pnBotoes.SetFocus;
    end
  else
    if (Vazio) then
      begin
      MsgDlg.MsgWarning('O(s) Campo(s) '+Campos+' n�o tem Valor(es) ');
      dbNome.Enabled := True;
      dbNome.SetFocus;
      end;
end;

procedure TfrmCadDentista.btnCancelarClick(Sender: TObject);
begin
  dmDados.tbProfissional.Cancel;
  cmbLkCidade.LookupSource := dmDados.dsVisCidade;
  NovoItem             := False;
  dmDados.vTabStt      := True ;
  //Ajusta bot�es
  btnCancelar.enabled  := False;
  btnGravar.Enabled    := False;
  btnNovo.Enabled      := True ;
  btnPrimeiro.Enabled  := True ;
  btnAnterior.Enabled  := True ;
  btnProximo.Enabled   := True ;
  btnUltimo.Enabled    := True ;
  btnAlterar.Enabled   := True ;
  btndeletar.Enabled   := True ;
  {habilitando os componentes}
  dbNome.Enabled       := False;
  dbFoto.Enabled       := False;
  DbCrm.Enabled        := False;
  DbEsp1.Enabled       := False;
  DbEsp2.Enabled       := False;
  dbEsp3.Enabled       := False;
  dbRG.Enabled         := False;
  dbCPF.Enabled        := False;
  dbEnd.Enabled        := False;
  dbNum.Enabled        := False;
  dbCompl.Enabled      := False;
  dbBairro.Enabled     := False;
  dbCep.Enabled        := False;
  cmbLkCidade.Enabled  := False;
  btnCadCid.Enabled    := False;
  cmbUf.Enabled        := False;
  dbEmail.Enabled      := False;
  dbDataCad.Enabled    := False;
  cmbTel1.Enabled      := False;
  dbTel1.Enabled       := False;
  dbTel2.Enabled       := False;
  cmbTel3.Enabled      := False;
  dbTel3.Enabled       := False;
  btnTel3.Enabled      := False;
  dbObs.Enabled        := False;
  cmbUf.Visible        := False;
  cmbVisUF.Visible     := True ;
  dmDados.vTabStt      := True ;
  pnBotoes.SetFocus;
end;

procedure TfrmCadDentista.btnAlterarClick(Sender: TObject);
begin
  if (dmDados.tbProfissional.RecordCount = 0) then
    MsgDlg.MsgError('Tabela vazia')
  else
    begin
    cmbLkCidade.LookupSource := dmDados.dsCidade                ;
    dmDados.tbEstado.Locate('EST_SIGLA', dmDados.tbProfissionallkUF.Value, []);
    cmbUf.Value              := dmDados.tbProfissionallkUF.Value;
    dmDados.tbProfissional.Edit;
    NovoItem             := True ;
    cmbUf.Visible        := True ;
    cmbVisUF.Visible     := False;
    {habilitando os bot�es}
    btnCancelar.Enabled  := True ;
    btnGravar.Enabled    := True ;
    btnNovo.Enabled      := False;
    btnPrimeiro.Enabled  := False;
    btnAnterior.Enabled  := False;
    btnProximo.Enabled   := False;
    btnUltimo.Enabled    := False;
    btnAlterar.Enabled   := False;
    btndeletar.Enabled   := False;
    {habilitando os componentes}
    dbNome.Enabled       := True ;
    dbFoto.Enabled       := True ;
    DbCrm.Enabled        := True ;
    DbEsp1.Enabled       := True ;
    DbEsp2.Enabled       := True ;
    dbEsp3.Enabled       := True ;
    dbRG.Enabled         := True ;
    dbCPF.Enabled        := True ;
    dbEnd.Enabled        := True ;
    dbNum.Enabled        := True ;
    dbCompl.Enabled      := True ;
    dbBairro.Enabled     := True ;
    dbCep.Enabled        := True ;
    cmbLkCidade.Enabled  := True ;
    btnCadCid.Enabled    := True ;
    cmbUf.Enabled        := True ;
    dbEmail.Enabled      := True ;
    dbDataCad.Enabled    := True ;
    cmbTel1.Enabled      := True ;
    dbTel1.Enabled       := True ;
    cmbTel2.Enabled      := True ;
    dbTel2.Enabled       := True ;
    cmbTel3.Enabled      := True ;
    dbTel3.Enabled       := True ;
    dbObs.Enabled        := True ;
    dmDados.vTabStt      := False;
    dbNome.SetFocus;
    end;
end;

procedure TfrmCadDentista.btnDeletarClick(Sender: TObject);
var
  Flag : Boolean;
begin
  Flag := False;
  if (dmDados.tbProfissional.RecordCount = 0) then
    MsgDlg.MsgError('Tabela vazia')
  else
    if MsgDlg.MsgConfirmation('Tem certeza que deseja excluir este registro?') = id_yes then
      begin
      if (Flag) then
        MsgDlg.MsgInformation('Dentista ativo, ou com registro de opera��es anteriores, n�o pode ser exclu�do !!!')
      else
        dmDados.tbProfissional.Delete;
      end
    else
      dmDados.tbProfissional.Cancel;
end;

procedure TfrmCadDentista.FormActivate(Sender: TObject);
begin
  FrmPrincipal.StatusTeclas(True,'[Insert] Novo [Home] Alterar [End] Gravar [Delete] Excluir [F9] Localizar [Esc] Cancelar ou Sair');
end;

procedure TfrmCadDentista.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  dmDados.tbProfissional.Close ;
  dmDados.tbCidade.Close       ;
  dmDados.tbEstado.Close       ;
  dmDados.tbPais.Close         ;
  FrmPrincipal.StatusTeclas(False,'');
  Action := caFree;
end;

procedure TfrmCadDentista.FormShow(Sender: TObject);
begin
  dmDados.vTabStt := True;
  if (dmDados.tbPais.State         = dsInactive) then
    dmDados.tbPais.Open;
  if (dmDados.tbEstado.State       = dsInactive) then
    dmDados.tbEstado.Open;
  if (dmDados.tbCidade.State       = dsInactive) then
    dmDados.tbCidade.Open;
  if (dmDados.tbProfissional.State = dsInactive) then
    dmDados.tbProfissional.Open;
end;

procedure TfrmCadDentista.dbFotoDblClick(Sender: TObject);
begin
  if AbreFigura.Execute then dmDados.tbProfissionalPRO_FOTO.LoadFromFile(AbreFigura.FileName);
end;

procedure TfrmCadDentista.FormKeyDown(Sender: TObject; var Key: Word;
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

end.
