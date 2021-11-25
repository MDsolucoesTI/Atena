//////////////////////////////////////////////////////////////////////////
// Criacao...........: 08/2008
// Sistema...........: Atena - Automacao Clinica Odontologica
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit untCadProtetico;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, EMsgDlg, JvComponent, JvEnterTab, fcLabel, LMDCustomControl, DB,
  LMDCustomPanel, LMDCustomBevelPanel, LMDCustomParentPanel, LMDBackPanel,
  DBCtrls, StdCtrls, fcButton, fcImgBtn, EDBZero, RxLookup, Mask, JvLabel,
  JvTransBtn, JvLookup, ExtCtrls, JvPanel, JvTransparentPanel, ToolEdit,
  RXDBCtrl, ShellApi, JvDBComb, ExtDlgs;

type
  TfrmCadProtetico = class(TForm)
    pnTop: TLMDBackPanel;
    fcLabel1: TfcLabel;
    JvEnterAsTab2: TJvEnterAsTab;
    pnBotoes: TLMDBackPanel;
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
    pnCentro: TLMDBackPanel;
    JvLabel1: TJvLabel;
    JvLabel2: TJvLabel;
    JvLabel13: TJvLabel;
    JvLabel16: TJvLabel;
    JvLabel17: TJvLabel;
    JvLabel19: TJvLabel;
    JvLabel14: TJvLabel;
    JvLabel15: TJvLabel;
    JvLabel18: TJvLabel;
    JvLabel12: TJvLabel;
    JvLabel23: TJvLabel;
    JvLabel21: TJvLabel;
    dbCod: TDBEdit;
    dbNome: TDBEdit;
    dbEnd: TDBEdit;
    dbBairro: TDBEdit;
    dbCep: TDBEdit;
    cmbLkCidade: TRxDBLookupCombo;
    dbNum: TEvDBZeroEdit;
    DbCompl: TDBEdit;
    btnCadCid: TfcImageBtn;
    dbEmail: TDBEdit;
    BtnEmail: TfcImageBtn;
    btnTel1: TfcImageBtn;
    dbTel2: TDBEdit;
    btnTel2: TfcImageBtn;
    dbTel3: TDBEdit;
    btnTel3: TfcImageBtn;
    dbObs: TDBMemo;
    dbTel1: TDBEdit;
    dbFoto: TDBImage;
    cmbUf: TJvDBLookupCombo;
    dbDataCad: TDBDateEdit;
    JvLabel3: TJvLabel;
    JvTransparentPanel1: TJvTransparentPanel;
    cmbTel1: TJvDBComboBox;
    cmbTel2: TJvDBComboBox;
    cmbTel3: TJvDBComboBox;
    AbreFigura: TOpenPictureDialog;
    cmbVisUF: TJvDBLookupCombo;
    MsgDlg: TEvMsgDlg;
    procedure btnSairClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
    procedure btnPrimeiroClick(Sender: TObject);
    procedure btnAnteriorClick(Sender: TObject);
    procedure btnProximoClick(Sender: TObject);
    procedure btnUltimoClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnDeletarClick(Sender: TObject);
    procedure btnCadCidClick(Sender: TObject);
    procedure btnEmailClick(Sender: TObject);
    procedure btnTel1Click(Sender: TObject);
    procedure btnTel2Click(Sender: TObject);
    procedure btnTel3Click(Sender: TObject);
    procedure dbFotoDblClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadProtetico : TfrmCadProtetico;
  NovoItem        : Boolean         ;

implementation

uses untdmDados, untPrincipal, untCadCidade, untDiscar;

{$R *.dfm}

procedure TfrmCadProtetico.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmCadProtetico.FormShow(Sender: TObject);
begin
  dmDados.vTabStt := True;
  if (dmDados.tbPais.State      = dsInactive)  then
    dmDados.tbPais.Open;
  if (dmDados.tbEstado.State    = dsInactive)  then
    dmDados.tbEstado.Open;
  if (dmDados.tbCidade.State    = dsInactive)  then
    dmDados.tbCidade.Open;
  if (dmDados.tbProtetico.State = dsInactive)  then
    dmDados.tbProtetico.Open;
end;

procedure TfrmCadProtetico.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  dmDados.tbProtetico.Close ;
  dmDados.tbCidade.Close    ;
  dmDados.tbEstado.Close    ;
  dmDados.tbPais.Close      ;
  frmPrincipal.StatusTeclas(False,'');
  Action := caFree;
end;

procedure TfrmCadProtetico.FormActivate(Sender: TObject);
begin
  frmPrincipal.StatusTeclas(True,' [Insert] Novo [Home] Alterar [End] Gravar [Delete] Excluir [F9] Localizar [Esc] Cancelar ou Sair');
  if (frmPrincipal.Acesso=1) then
    btnDeletar.Enabled := True
  else
    btnDeletar.Enabled := False;
end;

procedure TfrmCadProtetico.btnPrimeiroClick(Sender: TObject);
begin
  dmdados.tbProtetico.First;
  btnprimeiro.Enabled := False;
  btnAnterior.Enabled := False;
  btnProximo.Enabled  := True ;
  btnUltimo.Enabled   := True ;
end;

procedure TfrmCadProtetico.btnAnteriorClick(Sender: TObject);
begin
  dmdados.tbProtetico.Prior;
  btnProximo.Enabled  := True ;
  btnUltimo.Enabled   := True ;
  if dmdados.tbProtetico.bof then
    begin
    btnPrimeiro.Enabled := False;
    btnAnterior.Enabled := False;
    end;
end;

procedure TfrmCadProtetico.btnProximoClick(Sender: TObject);
begin
  dmdados.tbProtetico.Next;
  btnPrimeiro.Enabled := True ;
  btnAnterior.Enabled := True ;
  if dmdados.tbProtetico.Eof then
    begin
    btnProximo.Enabled := False;
    btnUltimo.Enabled  := False;
    end;
end;

procedure TfrmCadProtetico.btnUltimoClick(Sender: TObject);
begin
  dmdados.tbProtetico.Next;
  btnPrimeiro.Enabled := True ;
  btnAnterior.Enabled := True ;
  if dmdados.tbProtetico.Eof then
    begin
    btnProximo.Enabled := False;
    btnUltimo.Enabled  := False;
    end;
end;

procedure TfrmCadProtetico.btnNovoClick(Sender: TObject);
begin
  dmdados.tbProtetico.Append;
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
  cmbLkCidade.LookupSource            := dmDados.dsCidade;
  dmDados.tbEstado.Locate('EST_SIGLA', 'SP', []);
  dmDados.tbCidade.Locate('CID_CODIGO', 5217, []);
  cmbUf.Value                         := 'SP'            ;
  dmDados.tbProteticoPRT_CEP.Value    := '11600000'      ;
  dmDados.tbProteticoCID_CODIGO.Value := 5217            ;
  dbNome.SetFocus;
end;

procedure TfrmCadProtetico.btnGravarClick(Sender: TObject);
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
    Campos := 'Nome Prot�tico';
    Gravar := False ;
    Vazio  := True  ;
    end;
  if (Gravar) then
    begin
    dmDados.tbProtetico.Post;
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
    if (frmPrincipal.Acesso=1) then
     btnDeletar.Enabled := True
    else
      btnDeletar.Enabled := False;
    {habilitando os componentes}
    dbNome.Enabled       := False;
    dbFoto.Enabled       := False;
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
    dmDados.tbProtetico.Refresh;
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

procedure TfrmCadProtetico.btnCancelarClick(Sender: TObject);
begin
  dmDados.tbProtetico.Cancel;
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
  if (frmPrincipal.Acesso=1) then
    btnDeletar.Enabled := True
  else
    btnDeletar.Enabled := False;
  {habilitando os componentes}
  dbNome.Enabled       := False;
  dbFoto.Enabled       := False;
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
  pnBotoes.SetFocus;
end;

procedure TfrmCadProtetico.btnAlterarClick(Sender: TObject);
begin
  if (dmdados.tbProtetico.RecordCount = 0) then
    MsgDlg.MsgError('Tabela vazia')
  else
    begin
    cmbLkCidade.LookupSource := dmDados.dsCidade             ;
    dmDados.tbEstado.Locate('EST_SIGLA', dmDados.tbProteticolkUF.Value, []);
    cmbUf.Value              := dmDados.tbProteticolkUF.Value;
    dmDados.tbProtetico.Edit;
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

procedure TfrmCadProtetico.btnDeletarClick(Sender: TObject);
var
  Flag : Boolean;
begin
  Flag := False;
  if (dmDados.tbProtetico.RecordCount = 0) then
    MsgDlg.MsgError('Tabela vazia')
  else
    if MsgDlg.MsgConfirmation('Tem certeza que deseja excluir este registro?') = id_yes then
      begin
      if (Flag) then
        MsgDlg.MsgInformation('Prot�tico ativo, ou com registro de opera��es anteriores, n�o pode ser exclu�do !!!')
      else
        dmdados.tbProtetico.Delete;
      end
    else
      dmdados.tbProtetico.Cancel;
end;

procedure TfrmCadProtetico.btnCadCidClick(Sender: TObject);
begin
  frmCadCidade:=TfrmCadCidade.create(application);
  frmCadCidade.Show;
end;

procedure TfrmCadProtetico.btnEmailClick(Sender: TObject);
var
 url : string;
begin
  url := 'mailto:'+dmdados.tbProteticoPRT_EMAIL.Value;
  if (dmDados.tbProteticoPRT_EMAIL.Value <> '') then
    shellexecute(0, 'open',Pchar(url), nil, nil, sw_showNormal);
end;

procedure TfrmCadProtetico.btnTel1Click(Sender: TObject);
begin
  frmDiscar:=TfrmDiscar.create(application);
  frmDiscar.Show;
end;

procedure TfrmCadProtetico.btnTel2Click(Sender: TObject);
begin
  frmDiscar:=TfrmDiscar.create(application);
  frmDiscar.Show;
end;

procedure TfrmCadProtetico.btnTel3Click(Sender: TObject);
begin
  frmDiscar:=TfrmDiscar.create(application);
  frmDiscar.Show;
end;

procedure TfrmCadProtetico.dbFotoDblClick(Sender: TObject);
begin
  if AbreFigura.Execute then DMdados.tbProteticoPRT_FOTO.LoadFromFile(AbreFigura.FileName);
end;

procedure TfrmCadProtetico.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case (key) of
    // Teclas de a��o na tabela
    VK_Insert : if (dmDados.vTabStt)    then btnNovo.Click   ;
    VK_Home   : if (dmDados.vTabStt)    then btnAlterar.Click;
    VK_Delete : if ((dmDados.vTabStt) and (frmPrincipal.Acesso = 1))
                   then btnDeletar.Click;
    VK_End    : if not(dmDados.vTabStt) then btnGravar.Click ;
    VK_ESCAPE : if not(dmDados.vTabStt) then btnCancelar.Click
                else btnSair.Click;
  end;
end;

end.
