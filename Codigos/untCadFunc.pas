//////////////////////////////////////////////////////////////////////////
// Criacao...........: 08/2008
// Sistema...........: Atena - Automacao Clinica Odontologica
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit untCadFunc;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  VerCPF, ToolEdit, RXDBCtrl, RackCtls, StdCtrls, DBCtrls, RXSplit, Mask,
  RXCtrls, ExtCtrls, SpeedBar, jpeg, CurrEdit, fcButton, fcImgbtn, RxLookup,
  DB, DBTables, DCStdCtrls, ImgList, Grids, DBGrids, ComCtrls, EDBZero,
  EFocCol, RxGrdCpt, fcImager, EMsgDlg, EUserAcs, TFlatSplitterUnit,
  LMDCustomControl, LMDCustomPanel, LMDCustomBevelPanel,
  LMDCustomParentPanel, LMDBackPanel, fcLabel, EGrad, JvPanel,
  JvTransparentPanel, JvComponent, JvTransbtn, JvLabel, fcpanel, JvEnterTab,
  JvDBComb, JvLookup, ExtDlgs, RxDBComb;

type
  TfrmCadFunc = class(TForm)
    pnTop: TfcPanel;
    fcLabel2: TfcLabel;
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
    pnCentro: TfcPanel;
    JvLabel1: TJvLabel;
    DBECod: TDBEdit;
    JvLabel9: TJvLabel;
    dbDtAdm: TDBDateEdit;
    JvLabel2: TJvLabel;
    DBnome: TDBEdit;
    JvLabel10: TJvLabel;
    JvLabel11: TJvLabel;
    dbLookCargo: TDBLookupComboBox;
    JvLabel12: TJvLabel;
    dbSal: TRxDBCalcEdit;
    JvEnterAsTab1: TJvEnterAsTab;
    dbFoto: TDBImage;
    JvLabel13: TJvLabel;
    dbEnd: TDBEdit;
    JvLabel16: TJvLabel;
    dbBairro: TDBEdit;
    JvLabel23: TJvLabel;
    DbTel1: TDBEdit;
    dbTel2: TDBEdit;
    dbTel3: TDBEdit;
    btnTel1: TfcImagebtn;
    btnTel2: TfcImagebtn;
    btnTel3: TfcImagebtn;
    JvLabel20: TJvLabel;
    dbObs: TDBMemo;
    JvLabel21: TJvLabel;
    btnCadCid: TfcImagebtn;
    JvLabel18: TJvLabel;
    cmbLkCidade: TRxDBLookupCombo;
    JvLabel19: TJvLabel;
    dbCep: TDBEdit;
    JvLabel17: TJvLabel;
    JvLabel14: TJvLabel;
    dbNum: TEvDBZeroEdit;
    JvLabel15: TJvLabel;
    DbCompl: TDBEdit;
    dbDataCad: TDBDateEdit;
    JvTransparentPanel1: TJvTransparentPanel;
    JvLabel4: TJvLabel;
    dbDtNasc: TDBDateEdit;
    dbIdade: TDBText;
    JvLabel22: TJvLabel;
    dbRG: TDBEdit;
    JvLabel3: TJvLabel;
    dbCPF: TDBEdit;
    cmbTel1: TJvDBComboBox;
    cmbTel2: TJvDBComboBox;
    cmbTel3: TJvDBComboBox;
    cmbUf: TJvDBLookupCombo;
    AbreFigura: TOpenPictureDialog;
    cmbVisUF: TJvDBLookupCombo;
    DBcmbSit: TRxDBComboBox;
    MsgDlg: TEvMsgDlg;
    procedure btnSairClick(Sender: TObject);
    procedure btnCadCidClick(Sender: TObject);
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
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbFotoDblClick(Sender: TObject);
    procedure dbDtNascExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadFunc : TfrmCadFunc;

implementation

uses untCadCidade, untdmDados, untPrincipal;

{$R *.DFM}

procedure TfrmCadFunc.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmCadFunc.btnCadCidClick(Sender: TObject);
begin
  frmCadCidade:=TfrmCadCidade.create(application);
  frmCadCidade.Show;
end;

procedure TfrmCadFunc.btnPrimeiroClick(Sender: TObject);
begin
  dmdados.tbFuncionario.First;
  btnprimeiro.Enabled := False;
  btnAnterior.Enabled := False;
  btnProximo.Enabled  := True ;
  btnUltimo.Enabled   := True ;
end;

procedure TfrmCadFunc.btnAnteriorClick(Sender: TObject);
begin
  dmdados.tbFuncionario.Prior;
  btnProximo.Enabled  := True ;
  btnUltimo.Enabled   := True ;
  if dmdados.tbFuncionario.bof then
    begin
    btnPrimeiro.Enabled := False;
    btnAnterior.Enabled := False;
    end;
end;

procedure TfrmCadFunc.btnProximoClick(Sender: TObject);
begin
  dmdados.tbFuncionario.Next;
  btnPrimeiro.Enabled := True ;
  btnAnterior.Enabled := True ;
  if dmdados.tbFuncionario.Eof then
    begin
    btnProximo.Enabled := False;
    btnUltimo.Enabled  := False;
    end;
end;

procedure TfrmCadFunc.btnUltimoClick(Sender: TObject);
begin
  dmdados.tbFuncionario.Last;
  btnPrimeiro.Enabled := True ;
  btnAnterior.Enabled := True ;
  btnProximo.Enabled  := False;
  btnUltimo.Enabled   := False;
end;

procedure TfrmCadFunc.btnNovoClick(Sender: TObject);
begin
  dmdados.tbFuncionario.Append;
  cmbUf.Visible        := True ;
  cmbVisUF.Visible     := False;
  NovoItem             := True ;
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
  DBnome.Enabled       := True ;
  dbDtAdm.Enabled      := True ;
  DBcmbSit.Enabled     := True ;
  dbLookCargo.Enabled  := True ;
  dbSal.Enabled        := True ;
  dbDtNasc.Enabled     := True ;
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
  dbDataCad.Enabled    := True ;
  cmbTel1.Enabled      := True ;
  dbTel1.Enabled       := True ;
  cmbTel2.Enabled      := True ;
  dbTel2.Enabled       := True ;
  cmbTel3.Enabled      := True ;
  dbTel3.Enabled       := True ;
  dbObs.Enabled        := True ;
  dmDados.vTabStt      := False;
  cmbLkCidade.LookupSource              := dmDados.dsCidade;
  dmDados.tbEstado.Locate('EST_SIGLA', 'SP', []);
  dmDados.tbCidade.Locate('CID_CODIGO', 5217, []);
  cmbUf.Value                           := 'SP'            ;
  dmDados.tbFuncionarioFUN_CEP.Value    := '11600000'      ;
  dmDados.tbFuncionarioCID_CODIGO.Value := 5217            ;
  DBnome.SetFocus;
end;

procedure TfrmCadFunc.btnGravarClick(Sender: TObject);
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
  if (Gravar) then
    begin
    dmDados.tbFuncionario.Post;
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
    DBnome.Enabled       := False;
    dbDtAdm.Enabled      := False;
    DBcmbSit.Enabled     := False;
    dbLookCargo.Enabled  := False;
    dbSal.Enabled        := False;
    dbDtNasc.Enabled     := False;
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
    MsgDlg.MsgInformation('Dados gravados com sucesso!');
    dmDados.tbFuncionario.Refresh;
    pnBotoes.SetFocus;
    end
  else
    if (Vazio) then
      begin
      MsgDlg.MsgWarning('O(s) Campo(s) '+Campos+' n�o tem Valor(es) ');
      DBnome.Enabled := True;
      DBnome.SetFocus;
      end;
end;

procedure TfrmCadFunc.btnCancelarClick(Sender: TObject);
begin
  dmDados.tbFuncionario.Cancel;
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
  DBnome.Enabled       := False;
  dbDtAdm.Enabled      := False;
  DBcmbSit.Enabled     := False;
  dbLookCargo.Enabled  := False;
  dbSal.Enabled        := False;
  dbDtNasc.Enabled     := False;
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
  pnBotoes.SetFocus;
end;

procedure TfrmCadFunc.btnAlterarClick(Sender: TObject);
begin
  if (dmdados.tbFuncionario.RecordCount = 0) then
    MsgDlg.MsgError('Tabela vazia')
  else
    begin
    cmbLkCidade.LookupSource := dmDados.dsCidade               ;
    dmDados.tbEstado.Locate('EST_SIGLA', dmDados.tbFuncionariolkUF.Value, []);
    cmbUf.Value              := dmDados.tbFuncionariolkUF.Value;
    dmDados.tbFuncionario.Edit;
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
    DBnome.Enabled       := True ;
    dbDtAdm.Enabled      := True ;
    DBcmbSit.Enabled     := True ;
    dbLookCargo.Enabled  := True ;
    dbSal.Enabled        := True ;
    dbDtNasc.Enabled     := True ;
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
    dbDataCad.Enabled    := True ;
    cmbTel1.Enabled      := True ;
    dbTel1.Enabled       := True ;
    cmbTel2.Enabled      := True ;
    dbTel2.Enabled       := True ;
    cmbTel3.Enabled      := True ;
    dbTel3.Enabled       := True ;
    dbObs.Enabled        := True ;
    dmDados.vTabStt      := False;
    DBnome.SetFocus;
    end;
end;

procedure TfrmCadFunc.btnDeletarClick(Sender: TObject);
var
  Flag : Boolean;
begin
  Flag := False;
  if (dmDados.tbFuncionario.RecordCount = 0) then
    MsgDlg.MsgError('Tabela vazia')
  else
    if MsgDlg.MsgConfirmation('Tem certeza que deseja excluir este registro?') = id_yes then
      begin
      if (Flag) then
        MsgDlg.MsgInformation('Funcion�rio ativo, ou com registro de opera��es anteriores, n�o pode ser exclu�do !!!')
      else
        dmdados.tbFuncionario.Delete;
      end
    else
      dmdados.tbFuncionario.cancel;
end;

procedure TfrmCadFunc.FormActivate(Sender: TObject);
begin
  frmPrincipal.StatusTeclas(True,' [Insert] Novo [Home] Alterar [End] Gravar [Delete] Excluir [Esc] Cancelar ou Sair');
  dmDados.vTabStt := True;
  if (dmDados.tbFuncionario.State = dsInactive) then
    dmDados.tbFuncionario.Open;
  if (dmDados.tbCargo.State       = dsInactive) then
    dmDados.tbCargo.Open;
  if (dmDados.tbPais.State        = dsInactive) then
    dmDados.tbPais.Open;
  if (dmDados.tbEstado.State      = dsInactive) then
    dmDados.tbEstado.Open;
  if (dmDados.tbCidade.State      = dsInactive) then
    dmDados.tbCidade.Open;
  if (frmPrincipal.Acesso=1) then
    btnDeletar.Enabled := True
  else
    btnDeletar.Enabled := False;
end;

procedure TfrmCadFunc.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dmDados.tbFuncionario.Close ;
  dmDados.tbCargo.Close       ;
  dmDados.tbPais.Close        ;
  dmDados.tbEstado.Close      ;
  dmDados.tbCidade.Close      ;
  frmPrincipal.StatusTeclas(False,'');
  Action := caFree;
end;

procedure TfrmCadFunc.FormKeyDown(Sender: TObject; var Key: Word;
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
  end;
end;

procedure TfrmCadFunc.dbFotoDblClick(Sender: TObject);
begin
  if AbreFigura.Execute then dmDados.tbFuncionarioFUN_FOTO.LoadFromFile(AbreFigura.FileName);
end;

procedure TfrmCadFunc.dbDtNascExit(Sender: TObject);
begin
  dbIdade.Caption := frmPrincipal.CalcIdade(dbDtNasc.Date, Now);
end;

end.
