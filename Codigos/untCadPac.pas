//////////////////////////////////////////////////////////////////////////
// Criacao...........: 08/2008
// Sistema...........: Atena - Automacao Clinica Odontologica
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit untCadPac;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, JvComponent, JvTransBtn, ExtCtrls, fcpanel, StdCtrls, Grids, DB,
  DBGrids, JvLabel, Mask, EDBZero, ComCtrls, DBCtrls, EMsgDlg, fcLabel,
  fcButton, fcImgBtn, RxLookup, ToolEdit, RXDBCtrl, RxDBComb, JvPanel,
  JvTransparentPanel, JvEnterTab, JvLookup, JvDBComb, ExtDlgs, ShellApi,
  Menus, RxMenus, ImgList, DBTables, ELibFnc, JvImage, JvWavePlayer,
  JvThread, LMDCustomComponent, lmdclass;

type
  TfrmCadPac = class(TForm)
    pnBotoes: TfcPanel;
    pnTop: TfcPanel;
    pnCentro: TfcPanel;
    fcLabel1: TfcLabel;
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
    JvLabel1: TJvLabel;
    dbCodPac: TDBEdit;
    JvLabel2: TJvLabel;
    dbNome: TDBEdit;
    dbFoto: TDBImage;
    cmbCor: TRxDBComboBox;
    dbDtNasc: TDBDateEdit;
    dbIdade: TDBText;
    cmbLkConv: TRxDBLookupCombo;
    JvLabel3: TJvLabel;
    JvLabel4: TJvLabel;
    JvLabel8: TJvLabel;
    dbDataCad: TDBDateEdit;
    JvLabel13: TJvLabel;
    dbEnd: TDBEdit;
    JvLabel14: TJvLabel;
    dbNum: TEvDBZeroEdit;
    JvLabel15: TJvLabel;
    DbCompl: TDBEdit;
    JvLabel16: TJvLabel;
    dbBairro: TDBEdit;
    JvLabel17: TJvLabel;
    dbCep: TDBEdit;
    JvLabel18: TJvLabel;
    JvLabel20: TJvLabel;
    dbObs: TDBMemo;
    JvLabel21: TJvLabel;
    JvTransparentPanel1: TJvTransparentPanel;
    DbTel1: TDBEdit;
    JvLabel12: TJvLabel;
    dbCPF: TDBEdit;
    JvLabel22: TJvLabel;
    dbRG: TDBEdit;
    btnTel1: TfcImagebtn;
    JvLabel23: TJvLabel;
    dbTel2: TDBEdit;
    dbTel3: TDBEdit;
    btnTel2: TfcImagebtn;
    btnTel3: TfcImageBtn;
    JvLabel11: TJvLabel;
    dbEmail: TDBEdit;
    btnEmail: TfcImagebtn;
    btnAnamnese: TJvTransparentButton;
    JvEnterAsTab1: TJvEnterAsTab;
    dbInd: TDBEdit;
    JvLabel6: TJvLabel;
    JvLabel10: TJvLabel;
    cmbArcada: TRxDBComboBox;
    JvLabel7: TJvLabel;
    dbProf: TDBEdit;
    JvLabel24: TJvLabel;
    dbPai: TDBEdit;
    JvLabel5: TJvLabel;
    cmbCivil: TDBComboBox;
    JvLabel9: TJvLabel;
    dbMae: TDBEdit;
    cmbTel1: TJvDBComboBox;
    cmbTel2: TJvDBComboBox;
    cmbTel3: TJvDBComboBox;
    cmbUf: TJvDBLookupCombo;
    JvLabel19: TJvLabel;
    cmbLkCidade: TRxDBLookupCombo;
    AbreFigura: TOpenPictureDialog;
    JvLabel25: TJvLabel;
    cmbSexo: TRxDBComboBox;
    btnCadCid: TfcImagebtn;
    cmbVisUF: TJvDBLookupCombo;
    popFoto: TRxPopupMenu;
    Incluir1: TMenuItem;
    Excluir1: TMenuItem;
    imgPop: TImageList;
    EvLibFunctions1: TEvLibFunctions;
    MsgDlg: TEvMsgDlg;
    btnLemb: TfcImageBtn;
    btnLembrete: TJvTransparentButton;
    Alerta: TJvWavePlayer;
    procedure btnAnamneseClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure btnLocalizarClick(Sender: TObject);
    procedure btnConvClick(Sender: TObject);
    procedure btnCidClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnPrimeiroClick(Sender: TObject);
    procedure btnAnteriorClick(Sender: TObject);
    procedure btnProximoClick(Sender: TObject);
    procedure btnUltimoClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnDeletarClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbNomeExit(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbFotoDblClick(Sender: TObject);
    procedure cmbCorExit(Sender: TObject);
    procedure cmbSexoExit(Sender: TObject);
    procedure dbEndExit(Sender: TObject);
    procedure dbNumExit(Sender: TObject);
    procedure cmbLkCidadeExit(Sender: TObject);
    procedure cmbUfExit(Sender: TObject);
    procedure btnTel1Click(Sender: TObject);
    procedure btnTel2Click(Sender: TObject);
    procedure btnTel3Click(Sender: TObject);
    procedure btnEmailClick(Sender: TObject);
    procedure cmbCivilExit(Sender: TObject);
    procedure btnCadCidClick(Sender: TObject);
    procedure dbDtNascExit(Sender: TObject);
    procedure Incluir1Click(Sender: TObject);
    procedure Excluir1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btnLembreteClick(Sender: TObject);
    procedure btnLembClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadPac : TfrmCadPac;
  NovoItem  : Boolean   ;

implementation

uses untLocPac, untCadConv, untCadCidade, untdmDados,
     untPrincipal, untDiscar, untAnamneseAd, untAnamneseInf, untLembrete;

{$R *.dfm}

procedure TfrmCadPac.btnAnamneseClick(Sender: TObject);
var
  Idade : Integer;
begin
  Idade := (DaysBetween(dmDados.tbPacientePAC_NASC.Value,Date)) div 365;
  if (idade > 18) then
    begin
    frmAnamneseAd:=TfrmAnamneseAd.create(application);
    frmAnamneseAd.Paciente := dmDados.tbPacientePAC_CODIGO.Value;
    frmAnamneseAd.ShowModal;
    end
  else
    begin
    frmAnamneseInf:=TfrmAnamneseInf.create(application);
    frmAnamneseInf.Paciente := dmDados.tbPacientePAC_CODIGO.Value;    
    frmAnamneseInf.ShowModal;
    end;
end;

procedure TfrmCadPac.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmCadPac.btnLocalizarClick(Sender: TObject);
begin
  frmLocPac := TfrmLocPac.Create(Application);
  frmLocPac.showmodal;
  frmLocPac.Free;
end;

procedure TfrmCadPac.btnConvClick(Sender: TObject);
begin
  frmCadConv:=TfrmCadConv.create(application);
  frmCadConv.ShowModal;
end;

procedure TfrmCadPac.btnCidClick(Sender: TObject);
begin
  frmCadCidade:=TfrmCadCidade.create(application);
  frmCadCidade.Show;
end;

procedure TfrmCadPac.btnNovoClick(Sender: TObject);
begin
  dmdados.tbPaciente.Append;
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
  btnLocalizar.Enabled := False;
  btnAnamnese.Enabled  := False;
  {habilitando os componentes}
  DbNome.Enabled       := True ;
  dbFoto.Enabled       := True ;
  dbPai.Enabled        := True ;
  dbMae.Enabled        := True ;
  cmbCor.Enabled       := True ;
  cmbSexo.Enabled      := True ;
  dbDtNasc.Enabled     := True ;
  dbIdade.Enabled      := True ;
  cmbArcada.Enabled    := True ;
  dbInd.Enabled        := True ;
  cmbCivil.Enabled     := True ;
  dbProf.Enabled       := True ;
  cmbLkConv.Enabled    := True ;
  dbEnd.Enabled        := True ;
  dbNum.Enabled        := True ;
  dbCompl.Enabled      := True ;
  dbBairro.Enabled     := True ;
  dbCep.Enabled        := True ;
  cmbLkCidade.Enabled  := True ;
  btnCadCid.Enabled    := True ;
  cmbUf.Enabled        := True ;
  dbRG.Enabled         := True ;
  dbCPF.Enabled        := True ;
  dbEmail.Enabled      := True ;
  dbDataCad.Enabled    := True ;
  dbDataCad.Enabled    := True ;
  cmbTel1.Enabled      := True ;
  DbTel1.Enabled       := True ;
  cmbTel2.Enabled      := True ;
  dbTel2.Enabled       := True ;
  cmbTel3.Enabled      := True ;
  dbTel3.Enabled       := True ;
  dbObs.Enabled        := True ;
  dmDados.vTabStt      := False;
  cmbLkCidade.LookupSource           := dmDados.dsCidade;
  dmDados.tbConvenio.Locate('CON_CODIGO', 1, []);
  dmDados.tbEstado.Locate('EST_SIGLA', 'SP', []);
  dmDados.tbCidade.Locate('CID_CODIGO', 5217, []);
  dmDados.tbPacientePAC_CEP.Value    := '11600000'      ;
  dmDados.tbPacienteCON_CODIGO.Value := 1               ;
  dmDados.tbPacienteCID_CODIGO.Value := 5217            ;
  cmbUf.Value                        := 'SP'            ;
  dbNome.setfocus;
end;

procedure TfrmCadPac.btnPrimeiroClick(Sender: TObject);
begin
  dmdados.tbPaciente.First;
  btnprimeiro.Enabled := False;
  btnAnterior.Enabled := False;
  btnProximo.Enabled  := True ;
  btnUltimo.Enabled   := True ;
  if dmDados.tbLembrete.RecordCount > 0 then
    Begin
    btnLemb.Visible := True;
    Alerta.Play;
    end
  else
    btnLemb.Visible := False;
end;

procedure TfrmCadPac.btnAnteriorClick(Sender: TObject);
begin
  dmdados.tbPaciente.Prior;
  btnProximo.Enabled  := True ;
  btnUltimo.Enabled   := True ;
  if dmdados.tbPaciente.bof then
    begin
    btnPrimeiro.Enabled := False;
    btnAnterior.Enabled := False;
    end;
  if dmDados.tbLembrete.RecordCount > 0 then
    Begin
    btnLemb.Visible := True;
    Alerta.Play;
    end
  else
    btnLemb.Visible := False;
end;

procedure TfrmCadPac.btnProximoClick(Sender: TObject);
begin
  dmdados.tbPaciente.Next;
  btnPrimeiro.Enabled := True ;
  btnAnterior.Enabled := True ;
  if dmdados.tbPaciente.Eof then
    begin
    btnProximo.Enabled := False;
    btnUltimo.Enabled  := False;
    end;
  if dmDados.tbLembrete.RecordCount > 0 then
    Begin
    btnLemb.Visible := True;
    Alerta.Play;
    end
  else
    btnLemb.Visible := False;
end;

procedure TfrmCadPac.btnUltimoClick(Sender: TObject);
begin
  dmdados.tbPaciente.Last;
  btnPrimeiro.Enabled := True ;
  btnAnterior.Enabled := True ;
  btnProximo.Enabled  := False;
  btnUltimo.Enabled   := False;
  if dmDados.tbLembrete.RecordCount > 0 then
    Begin
    btnLemb.Visible := True;
    Alerta.Play;
    end
  else
    btnLemb.Visible := False;
end;

procedure TfrmCadPac.btnAlterarClick(Sender: TObject);
begin
  if (dmdados.tbPaciente.RecordCount = 0) then
    MsgDlg.MsgError('Tabela vazia')
  else
    begin
    cmbLkCidade.LookupSource := dmDados.dsCidade            ;
    dmDados.tbEstado.Locate('EST_SIGLA', dmDados.tbPacientelkUF.Value, []);
    cmbUf.Value              := dmDados.tbPacientelkUF.Value;
    dmDados.tbPaciente.Edit;
    NovoItem             := True ;
    cmbUf.Visible        := True ;
    cmbVisUF.Visible     := False;
    {habilitando os bot�es}
    if (frmPrincipal.Acesso=1) then
     begin
     btnAnamnese.Enabled := True;
      btnLembrete.Enabled := True;
      end
    else
      begin
      btnAnamnese.Enabled := False;
      btnLembrete.Enabled := False;
      end;
    btnCancelar.Enabled   := True ;
    btnGravar.Enabled     := True ;
    btnNovo.Enabled       := False;
    btnPrimeiro.Enabled   := False;
    btnAnterior.Enabled   := False;
    btnProximo.Enabled    := False;
    btnUltimo.Enabled     := False;
    btnAlterar.Enabled    := False;
    btndeletar.Enabled    := False;
    btnLocalizar.Enabled  := False;
    {habilitando os componentes}
    DbNome.Enabled        := True ;
    dbFoto.Enabled        := True ;
    dbPai.Enabled         := True ;
    dbMae.Enabled         := True ;
    cmbCor.Enabled        := True ;
    cmbSexo.Enabled       := True ;
    dbDtNasc.Enabled      := True ;
    dbIdade.Enabled       := True ;
    cmbArcada.Enabled     := True ;
    dbInd.Enabled         := True ;
    cmbCivil.Enabled      := True ;
    dbProf.Enabled        := True ;
    cmbLkConv.Enabled     := True ;
    btnCadCid.Enabled     := True ;
    dbEnd.Enabled         := True ;
    dbNum.Enabled         := True ;
    dbCompl.Enabled       := True ;
    dbBairro.Enabled      := True ;
    dbCep.Enabled         := True ;
    cmbLkCidade.Enabled   := True ;
    cmbUf.Enabled         := True ;
    dbRG.Enabled          := True ;
    dbCPF.Enabled         := True ;
    dbEmail.Enabled       := True ;
    dbDataCad.Enabled     := True ;
    dbDataCad.Enabled     := True ;
    cmbTel1.Enabled       := True ;
    DbTel1.Enabled        := True ;
    cmbTel2.Enabled       := True ;
    dbTel2.Enabled        := True ;
    cmbTel3.Enabled       := True ;
    dbTel3.Enabled        := True ;
    dbObs.Enabled         := True ;
    dmDados.vTabStt       := False;
    dbNome.SetFocus;
    end;
end;

procedure TfrmCadPac.btnDeletarClick(Sender: TObject);
var
  Flag : Boolean;
begin
  Flag := False;
  if (dmDados.tbPaciente.RecordCount = 0) then
    MsgDlg.MsgError('Tabela vazia')
  else
    if MsgDlg.MsgConfirmation('Tem certeza que deseja excluir este registro?') = id_yes then
      begin
      if (Flag) then
        MsgDlg.MsgInformation('Cliente ativo, ou com registro de opera��es anteriores, n�o pode ser exclu�do !!!')
      else
        dmdados.tbPaciente.Delete;
      end
    else
      dmdados.tbPaciente.cancel;
end;

procedure TfrmCadPac.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case (key) of
    // Teclas de a��o na tabela
    VK_Insert : if (dmDados.vTabStt) then btnNovo.Click;
    VK_Home   : if ((dmDados.vTabStt) and (frmPrincipal.Acesso = 1))
                    then btnAlterar.Click;
    VK_Delete : if (dmDados.vTabStt) then btnDeletar.Click;
    VK_End    : if not(dmDados.vTabStt) then btnGravar.Click;
    VK_ESCAPE : if not(dmDados.vTabStt) then btnCancelar.Click
                else btnSair.Click;
    VK_F8     : btnCadCid.Click;
    VK_F9     : btnLocalizar.Click;
    VK_F10    : btnEmail.Click ;
  end;
end;

procedure TfrmCadPac.dbNomeExit(Sender: TObject);
Var
  Tabela: TTable;
begin
  Tabela := TTable.Create(Application);
  Tabela.DatabaseName := dmDados.tbPaciente.DatabaseName;
  Tabela.TableName    := dmDados.tbPaciente.TableName   ;
  Tabela.IndexName    := dmdados.tbPaciente.IndexName   ;
  Tabela.Open;
  if NovoItem then
    if dbNome.Text = '' then
      begin
      MsgDlg.MsgError('� necess�rio Informar o Nome!');
      dbNome.setfocus;
      end
    else
      if Tabela.Locate('PAC_Nome',dbNome.Text,[]) then
        if not ((DmDados.tbPaciente.State=dsEdit) And (dmDados.tbPaciente.RecNo = Tabela.RecNo)) then
          begin
          MsgDlg.MsgWarning('Nome j� Cadastrado!');
          dbNome.Clear;
          dbNome.setfocus;
          end;
  Tabela.Free;
end;

procedure TfrmCadPac.btnGravarClick(Sender: TObject);
var
  Campos:String;
  Vazio,Gravar:Boolean;
  tabela: ttable;
  x      : integer;
  Flag   : boolean;
begin
  Campos:='';
  Gravar:=True;
  Vazio:=False;
  Campos :='';
  Gravar :=True;
  Vazio  :=False;
  Tabela := TTable.Create(Application);
  Tabela.DatabaseName := dmDados.tbPaciente.DatabaseName;
  Tabela.TableName    := dmDados.tbPaciente.TableName;
  Tabela.IndexName    := dmdados.tbPaciente.IndexName;
  Tabela.Open;
	if dbNome.Text='' then
  	begin
    if Length(Campos)>0 then Campos:=Campos+', ';
    Campos:=Campos+'Nome';
    Gravar:=False;
    Vazio:=True;
  	End
  else
    if Tabela.Locate('PAC_Nome',dbNome.Text,[]) then
      if not((DmDados.tbPaciente.State=dsEdit) And (dmDados.tbPaciente.RecNo = Tabela.RecNo)) then
        begin
        Gravar:=False;
        MsgDlg.MsgWarning('Nome j� cadastrado!');
        dbNome.SetFocus;
        end;
  if (cmbCor.Text = '') then
    begin
    if (Length(Campos) > 0) then
      Campos := Campos + ', ';
    Campos := 'Cor';
    Gravar := False ;
    Vazio  := True  ;
    end
  else
    begin
    Flag := True;
    for x := 0 to cmbCor.Items.Count-1 do
      if cmbCor.Text = cmbCor.Items[x] then
        Flag := False;
    if (Flag) then
      begin
      MsgDlg.MsgError('Valor de Cor inv�lido');
      Gravar := False;
      end;
    end;
  if (cmbSexo.Text = '') then
    begin
    if (Length(Campos) > 0) then
      Campos := Campos + ', ';
    Campos := 'Sexo';
    Gravar := False ;
    Vazio  := True  ;
    end
  else
    begin
    Flag := True;
    for x := 0 to cmbSexo.Items.Count-1 do
      if cmbSexo.Text = cmbSexo.Items[x] then
        Flag := False;
    if (Flag) then
      begin
      MsgDlg.MsgError('Valor de Sexo inv�lido');
      Gravar := False;
      end;
    end;
  if (dbEnd.Text = '') then
    begin
    if (Length(Campos) > 0) then
      Campos := Campos + ', ';
    Campos := 'Endere�o';
    Gravar := False ;
    Vazio  := True  ;
    end;
  if (dbNum.Text = '') then
    begin
    if (Length(Campos) > 0) then
      Campos := Campos + ', ';
    Campos := 'N�mero';
    Gravar := False ;
    Vazio  := True  ;
    end;
  if (cmbLkCidade.Text = '') then
    begin
    if (Length(Campos) > 0) then
      Campos := Campos + ', ';
    Campos := 'Cidade';
    Gravar := False ;
    Vazio  := True  ;
    end;
  if (cmbUf.Text = '') then
    begin
    if (Length(Campos) > 0) then
      Campos := Campos + ', ';
    Campos := 'Estado';
    Gravar := False ;
    Vazio  := True  ;
    end;
  if (Gravar) then
    begin
    dmDados.tbPaciente.Post;
    cmbLkCidade.LookupSource := dmDados.dsVisCidade;
    NovoItem             := False;
    dmDados.vTabStt      := True ;
    //Ajusta bot�es
    btnCancelar.enabled  := False;
    btnGravar.Enabled    := False;
    btnAnamnese.Enabled  := False;
    btnNovo.Enabled      := True ;
    btnPrimeiro.Enabled  := True ;
    btnAnterior.Enabled  := True ;
    btnProximo.Enabled   := True ;
    btnUltimo.Enabled    := True ;
    btnAlterar.Enabled   := True ;
    btndeletar.Enabled   := True ;
    btnLocalizar.Enabled := True ;
    if (frmPrincipal.Acesso=1) then
      begin
      btnAnamnese.Enabled := True;
      btnLembrete.Enabled := True;
      end
    else
      begin
      btnAnamnese.Enabled := False;
      btnLembrete.Enabled := False;
      end;
    {desabilitando os componentes}
    dbNome.Enabled        := False;
    dbFoto.Enabled        := False;
    dbPai.Enabled         := False;
    dbMae.Enabled         := False;
    cmbCor.Enabled        := False;
    cmbSexo.Enabled       := False;
    dbDtNasc.Enabled      := False;
    dbIdade.Enabled       := False;
    cmbArcada.Enabled     := False;
    dbInd.Enabled         := False;
    cmbCivil.Enabled      := False;
    dbProf.Enabled        := False;
    cmbLkConv.Enabled     := False;
    dbEnd.Enabled         := False;
    dbNum.Enabled         := False;
    dbCompl.Enabled       := False;
    dbBairro.Enabled      := False;
    dbCep.Enabled         := False;
    cmbLkCidade.Enabled   := False;
    btnCadCid.Enabled     := False;
    cmbUf.Enabled         := False;
    dbRG.Enabled          := False;
    dbCPF.Enabled         := False;
    dbEmail.Enabled       := False;
    dbDataCad.Enabled     := False;
    dbDataCad.Enabled     := False;
    cmbTel1.Enabled       := False;
    DbTel1.Enabled        := False;
    cmbTel2.Enabled       := False;
    dbTel2.Enabled        := False;
    cmbTel3.Enabled       := False;
    dbTel3.Enabled        := False;
    dbObs.Enabled         := False;
    cmbUf.Visible         := False;
    cmbVisUF.Visible      := True ;
    MsgDlg.MsgInformation('Dados gravados com sucesso!');
    dmDados.tbPaciente.Refresh;
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

procedure TfrmCadPac.btnCancelarClick(Sender: TObject);
begin
  dmDados.tbPaciente.Cancel;
  cmbLkCidade.LookupSource := dmDados.dsVisCidade;
  NovoItem             := False;
  dmDados.vTabStt      := True ;
  //Ajusta bot�es
  btnCancelar.enabled  := False;
  btnGravar.Enabled    := False;
  btnAnamnese.Enabled  := True ;
  btnNovo.Enabled      := True ;
  btnPrimeiro.Enabled  := True ;
  btnAnterior.Enabled  := True ;
  btnProximo.Enabled   := True ;
  btnUltimo.Enabled    := True ;
  btnAlterar.Enabled   := True ;
  btndeletar.Enabled   := True ;
  btnLocalizar.Enabled := True ;
  if (frmPrincipal.Acesso=1) then
    begin
    btnAnamnese.Enabled := True;
    btnLembrete.Enabled := True;
    end
  else
    begin
    btnAnamnese.Enabled := False;
    btnLembrete.Enabled := False;
    end;
  {desabilitando os componentes}
  dbNome.Enabled       := False;
  dbFoto.Enabled       := False;
  dbPai.Enabled        := False;
  dbMae.Enabled        := False;
  cmbCor.Enabled       := False;
  cmbSexo.Enabled      := False;
  dbDtNasc.Enabled     := False;
  dbIdade.Enabled      := False;
  cmbArcada.Enabled    := False;
  dbInd.Enabled        := False;
  cmbCivil.Enabled     := False;
  dbProf.Enabled       := False;
  cmbLkConv.Enabled    := False;
  dbEnd.Enabled        := False;
  dbNum.Enabled        := False;
  dbCompl.Enabled      := False;
  dbBairro.Enabled     := False;
  dbCep.Enabled        := False;
  cmbLkCidade.Enabled  := False;
  btnCadCid.Enabled    := False;
  cmbUf.Enabled        := False;
  dbRG.Enabled         := False;
  dbCPF.Enabled        := False;
  dbEmail.Enabled      := False;
  dbDataCad.Enabled    := False;
  dbDataCad.Enabled    := False;
  cmbTel1.Enabled      := False;
  DbTel1.Enabled       := False;
  cmbTel2.Enabled      := False;
  dbTel2.Enabled       := False;
  cmbTel3.Enabled      := False;
  dbTel3.Enabled       := False;
  dbObs.Enabled        := False;
  cmbUf.Visible        := False;
  cmbVisUF.Visible     := True ;
  pnBotoes.SetFocus;
end;

procedure TfrmCadPac.FormShow(Sender: TObject);
begin
  dmDados.vTabStt := True;
  if (dmDados.tbPais.State         = dsInactive) then
    dmDados.tbPais.Open;
  if (dmDados.tbEstado.State       = dsInactive) then
    dmDados.tbEstado.Open;
  if (dmDados.tbCidade.State       = dsInactive) then
    dmDados.tbCidade.Open;
  if (dmDados.tbVisCidade.State    = dsInactive) then
    dmDados.tbVisCidade.Open;
  if (dmDados.tbVisEstado.State    = dsInactive) then
    dmDados.tbVisEstado.Open;
  if (dmDados.tbConvenio.State     = dsInactive) then
    dmDados.tbConvenio.Open;
  if (dmDados.tbPaciente.State     = dsInactive) then
    dmDados.tbPaciente.Open;
  if (dmDados.tbLembrete.State     = dsInactive) then
    dmDados.tbLembrete.Open;
  if (dmDados.tbAnamneseAd.State   = dsInactive) then
    dmDados.tbAnamneseAd.Open;
  if (dmDados.tbAnamneseInf.State  = dsInactive) then
    dmDados.tbAnamneseInf.Open;
  if (dmDados.tbProfissional.State = dsInactive) then
    dmDados.tbProfissional.Open;

  if dmDados.tbLembrete.RecordCount > 0 then
    Begin
    btnLemb.Visible := True;
    Alerta.Play;
    end
  else
    btnLemb.Visible := False;
  frmPrincipal.StatusTeclas(True,' [Insert] Novo [Home] Alterar [End] Gravar [Delete] Excluir [F8] Cidade [F9] Localizar [F10] E-mail [Esc] Cancelar ou Sair');
end;

procedure TfrmCadPac.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dmDados.tbConvenio.Close ;
  dmDados.tbCidade.Close;
  dmDados.tbEstado.Close;
  dmDados.tbPais.Close;
  dmDados.tbPaciente.Close ;
  dmDados.tbLembrete.Close;
  dmDados.tbAnamneseAd.Close;
  dmDados.tbAnamneseInf.Close;
  dmDados.tbProfissional.Close;
  frmPrincipal.StatusTeclas(False,'');
  Action := CaFree;
end;

procedure TfrmCadPac.dbFotoDblClick(Sender: TObject);
begin
  if (dmdados.tbPaciente.State=dsedit)or(dmdados.tbPaciente.State=dsInsert) then
    if AbreFigura.Execute then
      DMdados.tbPacientePAC_FOTO.LoadFromFile(AbreFigura.FileName);
end;

procedure TfrmCadPac.cmbCorExit(Sender: TObject);
Var
  x:integer;
  Flag:Boolean;
begin
  if (NovoItem) then
    if (cmbCor.Text = '') then
      begin
      MsgDlg.MsgWarning('� obrigat�rio a Cor!');
      cmbCor.SetFocus;
      end
    else
      begin
      Flag := True;
      for x := 0 to cmbCor.Items.Count-1 do
        if cmbCor.Text = cmbCor.Items[x] then
          Flag := False;
      if (Flag) then
        begin
        MsgDlg.MsgError('Valor de Cor inv�lido');
        cmbCor.SetFocus;
        end;
      end;
end;

procedure TfrmCadPac.cmbSexoExit(Sender: TObject);
Var
  x    : integer;
  Flag : Boolean;
begin
  if (NovoItem) then
    if (cmbSexo.Text = '') then
      begin
      MsgDlg.MsgWarning('� obrigat�rio o Sexo');
      cmbSexo.SetFocus;
      end
    else
      begin
      Flag := True;
      for x := 0 to cmbSexo.Items.Count-1 do
        if cmbSexo.Text = cmbSexo.Items[x] then
          Flag := False;
      if (Flag) then
        begin
        MsgDlg.MsgError('Valor de Sexo inv�lido');
        cmbSexo.SetFocus;
        end;
      end;
end;

procedure TfrmCadPac.dbEndExit(Sender: TObject);
begin
  if (NovoItem) then
    if (dbEnd.Text = '') then
      begin
      MsgDlg.MsgWarning('� obrigat�rio o Endere�o');
      dbEnd.SetFocus;
      end;
end;

procedure TfrmCadPac.dbNumExit(Sender: TObject);
begin
  if (NovoItem) then
    if (dbNum.Text = '') then
      begin
      MsgDlg.MsgWarning('� obrigat�rio o N�mero');
      dbNum.SetFocus;
      end;
end;

procedure TfrmCadPac.cmbLkCidadeExit(Sender: TObject);
begin
  if (NovoItem) then
    if (cmbLkCidade.Text = '') then
      begin
      MsgDlg.MsgWarning('� obrigat�rio a Cidade');
      cmbLkCidade.SetFocus;
      end;
end;

procedure TfrmCadPac.cmbUfExit(Sender: TObject);
begin
  if (NovoItem) then
    if (cmbUf.Text = '') then
      begin
      MsgDlg.MsgWarning('� obrigat�rio o Estado');
      cmbUf.SetFocus;
      end;
end;

procedure TfrmCadPac.btnTel1Click(Sender: TObject);
begin
  frmDiscar:=TfrmDiscar.create(application);
  frmDiscar.Show;
end;

procedure TfrmCadPac.btnTel2Click(Sender: TObject);
begin
  frmDiscar:=TfrmDiscar.create(application);
  frmDiscar.Show;
end;

procedure TfrmCadPac.btnTel3Click(Sender: TObject);
begin
  frmDiscar:=TfrmDiscar.create(application);
  frmDiscar.Show;
end;

procedure TfrmCadPac.btnEmailClick(Sender: TObject);
var
 url : string;
begin
  url := 'mailto:'+dmdados.tbPacientePAC_EMAIL.Value;
  if (dmDados.tbPacientePAC_EMAIL.Value <> '') then
    shellexecute(0, 'open',Pchar(url), nil, nil, sw_showNormal);
end;

procedure TfrmCadPac.cmbCivilExit(Sender: TObject);
Var
  x    : integer;
  Flag : Boolean;
begin
  if (NovoItem) then
    if (cmbCivil.Text = '') then
      begin
      MsgDlg.MsgWarning('� obrigat�rio o Estado Civil');
      cmbCivil.SetFocus;
      end
    else
      begin
      Flag := True;
      for x := 0 to cmbCivil.Items.Count-1 do
        if cmbCivil.Text = cmbCivil.Items[x] then
          Flag := False;
      if (Flag) then
        begin
        MsgDlg.MsgError('Valor do Estado Civil inv�lido');
        cmbCivil.SetFocus;
        end;
      end;
end;

procedure TfrmCadPac.btnCadCidClick(Sender: TObject);
begin
  frmCadCidade:=TfrmCadCidade.Create(application);
  frmCadCidade.OutraJan := True;
  frmCadCidade.ShowModal;
end;

procedure TfrmCadPac.dbDtNascExit(Sender: TObject);
begin
  dbIdade.Caption := frmPrincipal.CalcIdade(dbDtNasc.Date, Now);
end;

procedure TfrmCadPac.Incluir1Click(Sender: TObject);
begin
  if (dmdados.tbPaciente.State=dsedit)or(dmdados.tbPaciente.State=dsInsert) then
    if AbreFigura.Execute then
      dmDados.tbPacientePAC_FOTO.LoadFromFile(AbreFigura.FileName);
end;

procedure TfrmCadPac.Excluir1Click(Sender: TObject);
begin
  if (dmdados.tbPaciente.State=dsedit)or(dmdados.tbPaciente.State=dsInsert) then
    dmDados.tbPacientePAC_FOTO.Clear;
end;

procedure TfrmCadPac.FormActivate(Sender: TObject);
begin
  if (frmPrincipal.Acesso=1) then
    begin
    btnAnamnese.Enabled := True;
    btnLembrete.Enabled := True;
    end
  else
    begin
    btnAnamnese.Enabled := False;
    btnLembrete.Enabled := False;
    end;
end;

procedure TfrmCadPac.btnLembreteClick(Sender: TObject);
begin

  frmLembrete:=TFrmLembrete.Create(application);
  frmLembrete.Paciente := dmDados.tbPacientePAC_CODIGO.Value;
  frmLembrete.ShowModal;
end;

procedure TfrmCadPac.btnLembClick(Sender: TObject);
begin
  if (frmPrincipal.Acesso=1) then
    btnLembrete.Click;
end;

end.
