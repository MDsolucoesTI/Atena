//////////////////////////////////////////////////////////////////////////
// Criacao...........: 08/2008
// Sistema...........: Atena - Automacao Clinica Odontologica
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit untCadConv;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls, RXCtrls, ExtCtrls, RackCtls, SpeedBar,
  jpeg, RXSplit, fcButton, fcImgBtn, DCStdCtrls, ToolEdit, CurrEdit,
  RXDBCtrl, Grids, DBGrids, LMDCustomComponent, LMDCustomHint,
  LMDCustomShapeHint, RxLookup , db, dbtables, EDBZero, RxGrdCpt, MrgMngr,
  fcImage, fcimageform, fcImager, LMDCustomControl, LMDCustomPanel,
  LMDCustomBevelPanel, LMDCustomParentPanel, LMDBackPanel, JvTransBtn,
  JvLabel, EMsgDlg, JvComponent, JvEnterTab, fcLabel, JvPanel,
  JvTransparentPanel, JvLookup, JvDBComb, ShellApi;

type
  TfrmCadConv = class(TForm)
    pnTop: TLMDBackPanel;
    pnBotoes: TLMDBackPanel;
    pnCentro: TLMDBackPanel;
    dbCod: TDBEdit;
    dbDesc: TDBEdit;
    fcLabel2: TfcLabel;
    JvEnterAsTab1: TJvEnterAsTab;
    JvLabel3: TJvLabel;
    btnPrimeiro: TJvTransparentButton;
    btnAnterior: TJvTransparentButton;
    btnUltimo: TJvTransparentButton;
    btnProximo: TJvTransparentButton;
    btnNovo: TJvTransparentButton;
    btnGravar: TJvTransparentButton;
    btnCancelar: TJvTransparentButton;
    btnAlterar: TJvTransparentButton;
    btnDeletar: TJvTransparentButton;
    btnSair: TJvTransparentButton;
    JvLabel1: TJvLabel;
    JvLabel13: TJvLabel;
    dbEnd: TDBEdit;
    JvLabel14: TJvLabel;
    dbNum: TEvDBZeroEdit;
    JvLabel15: TJvLabel;
    dbCompl: TDBEdit;
    JvLabel16: TJvLabel;
    dbBairro: TDBEdit;
    JvLabel17: TJvLabel;
    dbCep: TDBEdit;
    JvLabel19: TJvLabel;
    cmbLkCidade: TRxDBLookupCombo;
    btnCadCid: TfcImagebtn;
    JvLabel11: TJvLabel;
    dbEmail: TDBEdit;
    btnEmail: TfcImagebtn;
    JvLabel21: TJvLabel;
    dbDataCad: TDBDateEdit;
    JvTransparentPanel1: TJvTransparentPanel;
    JvLabel23: TJvLabel;
    dbTel1: TDBEdit;
    dbTel2: TDBEdit;
    dbTel3: TDBEdit;
    btnTel1: TfcImagebtn;
    btnTel2: TfcImagebtn;
    btnTel3: TfcImagebtn;
    dbObs: TDBMemo;
    JvLabel20: TJvLabel;
    JvLabel18: TJvLabel;
    cmbUf: TJvDBLookupCombo;
    cmbTel1: TJvDBComboBox;
    cmbTel2: TJvDBComboBox;
    cmbTel3: TJvDBComboBox;
    JvLabel2: TJvLabel;
    dbPrazo: TEvDBZeroEdit;
    cmbVisUF: TJvDBLookupCombo;
    MsgDlg: TEvMsgDlg;
    procedure btnSairClick(Sender: TObject);
    procedure btnPrimeiroClick(Sender: TObject);
    procedure btnAnteriorClick(Sender: TObject);
    procedure btnProximoClick(Sender: TObject);
    procedure btnUltimoClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure dbDescExit(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnDeletarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCadCidClick(Sender: TObject);
    procedure btnTel1Click(Sender: TObject);
    procedure btnTel2Click(Sender: TObject);
    procedure btnTel3Click(Sender: TObject);
    procedure cmbTel1Exit(Sender: TObject);
    procedure cmbTel2Exit(Sender: TObject);
    procedure cmbTel3Exit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnEmailClick(Sender: TObject);
   private
     { Private declarations }
    fOutraJan : Boolean;
   public
    { Public declarations }
    property OutraJan : Boolean read fOutraJan write fOutraJan;
   end;

var
  frmCadConv : TfrmCadConv;
  NovoItem   : Boolean    ;
implementation

uses untPrincipal, untdmDados, untCadCidade, untDiscar;

{$R *.dfm}
procedure TfrmCadConv.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmCadConv.btnPrimeiroClick(Sender: TObject);
begin
  dmDados.tbConvenio.First;
  btnprimeiro.Enabled := False;
  btnAnterior.Enabled := False;
  btnProximo.Enabled  := True ;
  btnUltimo.Enabled   := True ;
end;

procedure TfrmCadConv.btnAnteriorClick(Sender: TObject);
begin
  dmDados.tbConvenio.Prior;
  btnProximo.Enabled  := True ;
  btnUltimo.Enabled   := True ;
  if dmDados.tbConvenio.bof then
    begin
    btnPrimeiro.Enabled := False;
    btnAnterior.Enabled := False;
    end;
end;

procedure TfrmCadConv.btnProximoClick(Sender: TObject);
begin
  dmDados.tbConvenio.Next;
  btnPrimeiro.Enabled := True ;
  btnAnterior.Enabled := True ;
  if dmDados.tbConvenio.Eof then
    begin
    btnProximo.Enabled := False;
    btnUltimo.Enabled  := False;
    end;
end;

procedure TfrmCadConv.btnUltimoClick(Sender: TObject);
begin
  dmDados.tbConvenio.Last;
  btnPrimeiro.Enabled := True ;
  btnAnterior.Enabled := True ;
  btnProximo.Enabled  := False;
  btnUltimo.Enabled   := False;
end;

procedure TfrmCadConv.btnAlterarClick(Sender: TObject);
begin
  if (dmDados.tbConvenio.RecordCount = 0) then
    MsgDlg.MsgError('Tabela vazia')
  else
    begin
    cmbLkCidade.LookupSource := dmDados.dsCidade            ;
    dmDados.tbEstado.Locate('EST_SIGLA', dmDados.tbConveniolkUF.Value, []);
    cmbUf.Value              := dmDados.tbConveniolkUF.Value;
    dmDados.tbConvenio.Edit;
    NovoItem := True;
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
    dbDesc.Enabled       := True ;
    dbPrazo.Enabled      := True ;
    dbEnd.Enabled        := True ;
    dbNum.Enabled        := True ;
    dbCompl.Enabled      := True ;
    dbBairro.Enabled     := True ;
    dbCep.Enabled        := True ;
    cmbLkCidade.Enabled  := True ;
    btnCadCid.Enabled    := True ;
    cmbUf.Enabled        := True ;
    dbEmail.Enabled      := True ;
    btnEmail.Enabled     := True ;
    dbDataCad.Enabled    := True ;
    cmbTel1.Enabled      := True ;
    dbTel1.Enabled       := True ;
    btnTel1.Enabled      := True ;
    cmbTel2.Enabled      := True ;
    dbTel2.Enabled       := True ;
    btnTel2.Enabled      := True ;
    cmbTel3.Enabled      := True ;
    dbTel3.Enabled       := True ;
    btnTel3.Enabled      := True ;
    dbObs.Enabled        := True ;
    dmDados.vTabStt      := False;
    dbDesc.SetFocus;
    end;
end;

procedure TfrmCadConv.dbDescExit(Sender: TObject);
begin
  if (NovoItem) then
    if (dbDesc.Text = '') then
      begin
      MsgDlg.MsgWarning('� obrigat�rio o Nome do Conv�nio');
      dbDesc.SetFocus;
      end;
end;

procedure TfrmCadConv.btnNovoClick(Sender: TObject);
begin
  dmDados.tbConvenio.Append;
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
  dbDesc.Enabled       := True ;
  dbPrazo.Enabled      := True ;
  dbEnd.Enabled        := True ;
  dbNum.Enabled        := True ;
  dbCompl.Enabled      := True ;
  dbBairro.Enabled     := True ;
  dbCep.Enabled        := True ;
  cmbLkCidade.Enabled  := True ;
  btnCadCid.Enabled    := True ;
  cmbUf.Enabled        := True ;
  dbEmail.Enabled      := True ;
  btnEmail.Enabled     := True ;
  dbDataCad.Enabled    := True ;
  cmbTel1.Enabled      := True ;
  dbTel1.Enabled       := True ;
  btnTel1.Enabled      := True ;
  cmbTel2.Enabled      := True ;
  dbTel2.Enabled       := True ;
  btnTel2.Enabled      := True ;
  cmbTel3.Enabled      := True ;
  dbTel3.Enabled       := True ;
  btnTel3.Enabled      := True ;
  dbObs.Enabled        := True ;
  dmDados.vTabStt      := False;
  cmbLkCidade.LookupSource            := dmDados.dsCidade;
  dmDados.tbEstado.Locate('EST_SIGLA', 'SP', []);
  dmDados.tbCidade.Locate('CID_CODIGO', 5217, []);
  cmbUf.Value                         := 'SP'            ;
  dmDados.tbConvenioCON_CEP.Value     := '11600000'      ;
  dmDados.tbConvenioCID_CODIGO.Value  := 5217            ;
  dmDados.tbConvenioCON_RETORNO.Value := '0'             ;
  dbDesc.SetFocus;
end;

procedure TfrmCadConv.btnDeletarClick(Sender: TObject);
var
  Flag : Boolean;
begin
  Flag := False;
  if (dmDados.tbConvenio.RecordCount = 0) then
    MsgDlg.MsgError('Tabela vazia')
  else
    if MsgDlg.MsgConfirmation('Tem certeza que deseja excluir este registro?') = id_yes then
      begin
      if (Flag) then
        MsgDlg.MsgInformation('Conv�nio ativo, ou com registro de opera��es anteriores, n�o pode ser exclu�do !!!')
      else
        dmDados.tbConvenio.Delete;
      end
    else
      dmDados.tbConvenio.cancel;
end;

procedure TfrmCadConv.btnCancelarClick(Sender: TObject);
begin
  dmDados.tbConvenio.Cancel;
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
  dbDesc.Enabled       := False;
  dbPrazo.Enabled      := False;
  dbEnd.Enabled        := False;
  dbNum.Enabled        := False;
  dbCompl.Enabled      := False;
  dbBairro.Enabled     := False;
  dbCep.Enabled        := False;
  cmbLkCidade.Enabled  := False;
  btnCadCid.Enabled    := False;
  cmbUf.Enabled        := False;
  dbEmail.Enabled      := False;
  btnEmail.Enabled     := False;
  dbDataCad.Enabled    := False;
  cmbTel1.Enabled      := False;
  dbTel1.Enabled       := False;
  btnTel1.Enabled      := False;
  cmbTel2.Enabled      := False;
  dbTel2.Enabled       := False;
  btnTel2.Enabled      := False;
  cmbTel3.Enabled      := False;
  dbTel3.Enabled       := False;
  btnTel3.Enabled      := False;
  dbObs.Enabled        := False;
  cmbUf.Visible        := False;
  cmbVisUF.Visible     := True ;
  dmDados.vTabStt      := True ;
  pnBotoes.SetFocus;
end;

procedure TfrmCadConv.btnGravarClick(Sender: TObject);
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
  if (dbDesc.Text = '') then
    begin
    if (Length(Campos) > 0) then
      Campos := Campos + ', ';
    Campos := 'Conv�nio';
    Gravar := False ;
    Vazio  := True  ;
    end;
  if (Gravar) then
    begin
    dmDados.tbConvenio.Post;
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
    dbDesc.Enabled       := False;
    dbPrazo.Enabled      := False;
    dbEnd.Enabled        := False;
    dbNum.Enabled        := False;
    dbCompl.Enabled      := False;
    dbBairro.Enabled     := False;
    dbCep.Enabled        := False;
    cmbLkCidade.Enabled  := False;
    btnCadCid.Enabled    := False;
    cmbUf.Enabled        := False;
    dbEmail.Enabled      := False;
    btnEmail.Enabled     := False;
    dbDataCad.Enabled    := False;
    cmbTel1.Enabled      := False;
    dbTel1.Enabled       := False;
    btnTel1.Enabled      := False;
    cmbTel2.Enabled      := False;
    dbTel2.Enabled       := False;
    btnTel2.Enabled      := False;
    cmbTel3.Enabled      := False;
    dbTel3.Enabled       := False;
    btnTel3.Enabled      := False;
    dbObs.Enabled        := False;
    cmbUf.Visible        := False;
    cmbVisUF.Visible     := True ;
    dmDados.vTabStt      := True ;
    MsgDlg.MsgInformation('Dados gravados com sucesso!');
    dmDados.tbConvenio.Refresh;
    pnBotoes.SetFocus;
    end
  else
    if (Vazio) then
      begin
      MsgDlg.MsgWarning('O(s) Campo(s) '+Campos+' n�o tem Valor(es) ');
      dbDesc.Enabled := True;
      dbDesc.SetFocus;
      end;
end;

procedure TfrmCadConv.FormActivate(Sender: TObject);
begin
  frmPrincipal.StatusTeclas(True,' [Insert] Novo [Home] Alterar [End] Gravar [Delete] Excluir [F8] Cidade [F10] E-mail [Esc] Cancelar ou Sair');
  if (frmPrincipal.Acesso=1) then
    btnDeletar.Enabled := True
  else
    btnDeletar.Enabled := False;
end;

procedure TfrmCadConv.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case (key) of
    // Teclas de a��o na tabela
    VK_Insert : if (dmDados.vTabStt) then btnNovo.Click;
    VK_Home   : if (dmDados.vTabStt) then btnAlterar.Click;
    VK_Delete : if ((dmDados.vTabStt) and (frmPrincipal.Acesso = 1))
                   then btnDeletar.Click;
    VK_End    : if not(dmDados.vTabStt) then btnGravar.Click;
    VK_ESCAPE : if not(dmDados.vTabStt) then btnCancelar.Click
                else btnSair.Click;
    VK_F8     : btnCadCid.Click;
    VK_F10    : btnEmail.Click ;
  end;
end;

procedure TfrmCadConv.FormShow(Sender: TObject);
begin
  dmDados.vTabStt := True;
  if (dmDados.tbConvenio.State = dsInactive) then
    dmDados.tbConvenio.Open;
  if (dmDados.tbPais.State     = dsInactive) then
    dmDados.tbPais.Open;
  if (dmDados.tbEstado.State   = dsInactive) then
    dmDados.tbEstado.Open;
  if (dmDados.tbCidade.State   = dsInactive) then
    dmDados.tbCidade.Open;
end;

procedure TfrmCadConv.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if (not OutraJan) then
    begin
    dmDados.tbConvenio.Close ;
    dmDados.tbPais.Close     ;
    dmDados.tbEstado.Close   ;
    dmDados.tbCidade.Close   ;
    frmPrincipal.StatusTeclas(False,'');
    Action := caFree;
    end;
end;

procedure TfrmCadConv.btnCadCidClick(Sender: TObject);
begin
  frmCadCidade:=TfrmCadCidade.create(application);
  frmCadCidade.Show;
end;

procedure TfrmCadConv.btnTel1Click(Sender: TObject);
begin
  frmDiscar:=TfrmDiscar.create(application);
  frmDiscar.Show;
end;

procedure TfrmCadConv.btnTel2Click(Sender: TObject);
begin
  frmDiscar:=TfrmDiscar.create(application);
  frmDiscar.Show;
end;

procedure TfrmCadConv.btnTel3Click(Sender: TObject);
begin
  frmDiscar:=TfrmDiscar.create(application);
  frmDiscar.Show;
end;

procedure TfrmCadConv.cmbTel1Exit(Sender: TObject);
begin
  if (cmbTel1.Text = '0800/0300') then
    dmDados.tbConvenioCON_TEL1.EditMask:='9999-99999##;0;_'
  else
    dmDados.tbConvenioCON_TEL1.EditMask:='\(99\)C999-9999;0;_'
end;

procedure TfrmCadConv.cmbTel2Exit(Sender: TObject);
begin
  if (cmbTel2.Text = '0800/0300') then
    dmDados.tbConvenioCON_TEL2.EditMask:='9999-99999##;0;_'
  else
    dmDados.tbConvenioCON_TEL2.EditMask:='\(99\)C999-9999;0;_'
end;

procedure TfrmCadConv.cmbTel3Exit(Sender: TObject);
begin
  if (cmbTel3.Text = '0800/0300') then
    dmDados.tbConvenioCON_TEL3.EditMask:='9999-99999##;0;_'
  else
    dmDados.tbConvenioCON_TEL3.EditMask:='\(99\)C999-9999;0;_'
end;

procedure TfrmCadConv.FormCreate(Sender: TObject);
begin
  OutraJan := False;
end;

procedure TfrmCadConv.btnEmailClick(Sender: TObject);
var
 url : string;
begin
  url := 'mailto:'+dmDados.tbConvenioCON_EMAIL.Value;
  if (dmDados.tbConvenioCON_EMAIL.Value <> '') then
    shellexecute(0, 'open',Pchar(url), nil, nil, sw_showNormal);
end;

end.

