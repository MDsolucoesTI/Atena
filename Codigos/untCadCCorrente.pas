//////////////////////////////////////////////////////////////////////////
// Criacao...........: 08/2008
// Sistema...........: Atena - Automacao Clinica Odontologica
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit untCadCCorrente;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fcLabel, ExtCtrls, fcpanel, JvTransBtn, JvComponent, JvEnterTab,
  EMsgDlg, CurrEdit, RXDBCtrl, RxLookup, fcButton, fcImgBtn, ToolEdit,
  EDBTime, StdCtrls, Mask, DBCtrls, JvLabel, JvPanel, JvTransparentPanel,
  ShellApi, DB, DBTables;

type
  TfrmCadCCorrente = class(TForm)
    pnTop: TfcPanel;
    fcLabel2: TfcLabel;
    pnBotoes: TfcPanel;
    pnCentro: TfcPanel;
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
    JvTransparentPanel2: TJvTransparentPanel;
    JvLabel9: TJvLabel;
    JvLabel15: TJvLabel;
    JvLabel14: TJvLabel;
    JvLabel11: TJvLabel;
    dbInternet: TDBEdit;
    dbHora: TEvDBTimeEdit;
    DbFax: TDBEdit;
    dbEmail: TDBEdit;
    dbDtUlMov: TDBDateEdit;
    dbDataCad: TDBDateEdit;
    btnInternt: TfcImageBtn;
    BtnEmail: TfcImageBtn;
    btnCadBanco: TfcImageBtn;
    JvLabel1: TJvLabel;
    dbDtAb: TDBDateEdit;
    JvLabel2: TJvLabel;
    dbDesc: TDBEdit;
    JvLabel3: TJvLabel;
    cmblLkBanco: TRxDBLookupCombo;
    JvLabel4: TJvLabel;
    dbAgencia: TDBEdit;
    JvLabel5: TJvLabel;
    dbNumConta: TDBEdit;
    JvLabel6: TJvLabel;
    dbTitular: TDBEdit;
    JvLabel16: TJvLabel;
    dbLimite: TRxDBCalcEdit;
    JvLabel17: TJvLabel;
    dbSaldo: TRxDBCalcEdit;
    JvLabel12: TJvLabel;
    JvLabel13: TJvLabel;
    dbGerente: TDBEdit;
    JvLabel7: TJvLabel;
    DbTel1: TDBEdit;
    JvLabel8: TJvLabel;
    JvTransparentPanel1: TJvTransparentPanel;
    MsgDlg: TEvMsgDlg;
    procedure btnSairClick(Sender: TObject);
    procedure dbInternetExit(Sender: TObject);
    procedure btnCadBancoClick(Sender: TObject);
    procedure BtnEmailClick(Sender: TObject);
    procedure dbDtAbExit(Sender: TObject);
    procedure dbDescExit(Sender: TObject);
    procedure dbAgenciaExit(Sender: TObject);
    procedure dbNumContaExit(Sender: TObject);
    procedure dbTitularExit(Sender: TObject);
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
    procedure btnInterntClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadCCorrente: TfrmCadCCorrente;

implementation

uses untdmDados, untCadBanco, untPrincipal;

{$R *.dfm}

procedure TfrmCadCCorrente.btnSairClick(Sender: TObject);
begin
  DmDados.TbCCorrente.Open;
  Close;
end;

procedure TfrmCadCCorrente.dbInternetExit(Sender: TObject);
begin
  pnBotoes.Setfocus;
end;

procedure TfrmCadCCorrente.btnCadBancoClick(Sender: TObject);
begin
  frmCadBanco := TFrmCadBanco.Create(application);
  frmCadBanco.OutraJan := True;
  frmCadBanco.ShowModal;
end;

procedure TfrmCadCCorrente.BtnEmailClick(Sender: TObject);
var
 url : string;
begin
  url := 'mailto:'+dmdados.TbCCorrenteEMail.Value;
  if dmDados.TbCCorrenteEMail.Value <> '' then
    shellexecute(0, 'open',Pchar(url), nil, nil, sw_showNormal);
end;

procedure TfrmCadCCorrente.dbDtAbExit(Sender: TObject);
begin
  if NovoItem then
    if dbDtAb.Text = '  /  /    ' then
      begin
      MsgDlg.MsgError('� obrigat�rio a DATA INICIAL');
      dbDtAb.SetFocus;
      End
  else
    begin
    try
      StrToDate(dbDtAb.Text);
    except
      on EConvertError do
        begin
        MsgDlg.MsgError('Data Inv�lida');
        dbDtAb.SetFocus;
        end;
    end;
  end;
end;

procedure TfrmCadCCorrente.dbDescExit(Sender: TObject);
begin
  if NovoItem then
    begin
    if dbDesc.Text = '' then
      begin
      MsgDlg.MsgError('� obrigat�rio o Tipo de Conta');
      dbDesc.SetFocus;
      end;
    end;
end;

procedure TfrmCadCCorrente.dbAgenciaExit(Sender: TObject);
begin
  if NovoItem then
    begin
    if dbDesc.Text = '' then
      begin
      MsgDlg.MsgError('� obrigat�rio o Tipo de Conta');
      dbDesc.SetFocus;
      end;
    end;
end;

procedure TfrmCadCCorrente.dbNumContaExit(Sender: TObject);
Var
  Tabela : TTable;
begin
  if NovoItem then
    begin
    Tabela              := TTable.Create(Application)      ;
    Tabela.DatabaseName := dmDados.TbCCorrente.DatabaseName;
    Tabela.TableName    := dmDados.TbCCorrente.TableName   ;
    Tabela.IndexName    := dmdados.TbCCorrente.IndexName   ;
    Tabela.Open;
    if dbNumConta.Text = '' then
       begin
       MsgDlg.MsgError('� obrigat�rio o N�MERO DA CONTA');
       dbNumConta.SetFocus;
       end
    else
      if Tabela.Locate('Conta',dbNumConta.Text,[]) then
        if not ((DmDados.TbCCorrente.State=dsEdit) And (dmDados.TbCCorrente.RecNo = Tabela.RecNo)) then
          begin
          MsgDlg.MsgWarning('N�MERO DA CONTA j� Cadastrada');
          dbNumConta.Clear;
          dbNumConta.setfocus;
          end;
    Tabela.Free;
    end;
end;

procedure TfrmCadCCorrente.dbTitularExit(Sender: TObject);
begin
  if NovoItem then
    begin
    if dbTitular.Text = '' then
      begin
      MsgDlg.MsgError('� obrigat�rio o TITULAR');
      dbTitular.SetFocus;
      end;
    end;
end;

procedure TfrmCadCCorrente.btnPrimeiroClick(Sender: TObject);
begin
  dmdados.tbCCorrente.First;
  btnPrimeiro.Enabled := False;
  btnAnterior.Enabled := False;
  btnProximo.Enabled  := True ;
  btnUltimo.Enabled   := True ;
  dmDados.vTabStt     := True ;
end;

procedure TfrmCadCCorrente.btnAnteriorClick(Sender: TObject);
begin
  dmdados.tbCCorrente.Prior;
  btnProximo.Enabled := True;
  btnUltimo.Enabled  := True;
  if dmdados.TbCCorrente.bof then
    begin
    btnPrimeiro.Enabled := False;
    btnAnterior.Enabled := False;
    end;
  dmDados.vTabStt := True;
end;

procedure TfrmCadCCorrente.btnProximoClick(Sender: TObject);
begin
  dmdados.tbCCorrente.next;
  btnPrimeiro.Enabled := True;
  btnAnterior.Enabled := True;
  if dmdados.tbCCorrente.Eof then
    begin
    btnProximo.Enabled := False;
    btnUltimo.Enabled  := False;
    end;
  dmDados.vTabStt := True;
end;

procedure TfrmCadCCorrente.btnUltimoClick(Sender: TObject);
begin
  dmdados.tbCCorrente.Last;
  btnPrimeiro.Enabled := True ;
  btnAnterior.Enabled := True ;
  btnProximo.Enabled  := False;
  btnUltimo.Enabled   := False;
  dmDados.vTabStt     := True ;
end;

procedure TfrmCadCCorrente.btnNovoClick(Sender: TObject);
begin
  dmDados.tbCCorrente.Append;
  NovoItem            := True ;
  dmDados.vTabStt     := False;
  {habilitando os bot�es}
  btnCadBanco.Enabled := True ;
  BtnGravar.Enabled   := True ;
  BtnCancelar.Enabled := True ;
  BtnNovo.Enabled     := False;
  BtnPrimeiro.Enabled := False;
  BtnAnterior.Enabled := False;
  BtnProximo.Enabled  := False;
  BtnUltimo.Enabled   := False;
  BtnAlterar.Enabled  := False;
  BtnDeletar.Enabled  := False;
  {habilitando os componentes}
  dbDtAb.Enabled      := True ;
  dbDesc.Enabled      := True ;
  cmblLkBanco.Enabled := True ;
  dbAgencia.Enabled   := True ;
  dbNumConta.Enabled  := True ;
  dbTitular.Enabled   := True ;
  dbLimite.Enabled    := True ;
  dbSaldo.Enabled     := True ;
  dbGerente.Enabled   := True ;
  dbDtUlMov.Enabled   := True ;
  dbHora.Enabled      := True ;
  dbTel1.Enabled      := True ;
  dbFax.Enabled       := True ;
  dbEmail.Enabled     := True ;
  dbInternet.Enabled  := True ;
  dmDados.TbCCorrenteHoraMov.Value := Now;
  dbDtAb.SetFocus;
end;

procedure TfrmCadCCorrente.btnGravarClick(Sender: TObject);
Var
  Campos : String ;
  Vazio  : Boolean;
  Gravar : Boolean;
  Tabela : TTable ;
begin
  Campos              := ''                              ;
  Gravar              := True                            ;
  Vazio               := False                           ;
  Tabela              := TTable.Create(Application)      ;
  Tabela.DatabaseName := dmDados.TbCCorrente.DatabaseName;
  Tabela.TableName    := dmDados.TbCCorrente.TableName   ;
  Tabela.IndexName    := dmdados.TbCCorrente.IndexName   ;
  Tabela.Open;
  //Campo que n�o pode repetir
  if dbNumConta.Text = '' then
    begin
    if Length(Campos) > 0 then Campos := Campos+', ';
    Campos := Campos+'N�mero da Conta';
    Gravar := False                   ;
    Vazio  := True                    ;
    end
  else
    if Tabela.Locate('Conta',dbNumConta.Text,[]) then
      if Not((DmDados.TbCCorrente.State=dsEdit) And (dmDados.TbCCorrente.RecNo = Tabela.RecNo)) then
        begin
       	Gravar := False;
        MsgDlg.MsgWarning('N�mero da Conta j� Cadastrado');
        end;
  if dbDesc.Text = '' then
    begin
    if Length(Campos) > 0 then Campos := Campos+', ';
    Campos := Campos+'Descri��o';
    Gravar := False             ;
    Vazio  := True              ;
    end
  else
    if Tabela.Locate('Descricao',dbDesc.Text,[]) then
      if Not((DmDados.TbCCorrente.State=dsEdit) And (dmDados.TbCCorrente.RecNo = Tabela.RecNo)) then
        begin
       	Gravar := False;
        MsgDlg.MsgWarning('Descri��o j� Cadastrada');
        end;
  //Campo que n�o pode estar vazio
  if dbTitular.Text = '' then
    begin
    If Length(Campos) > 0 then Campos := Campos+', ';
    Campos := Campos+'Titular';
    Gravar := False           ;
    Vazio  := True            ;
    end;
  if dbAgencia.Text = '' then
    begin
    if Length(Campos) > 0 Then Campos := Campos+', ';
    Campos := Campos+'Ag�ncia';
    Gravar := False           ;
    Vazio  := True            ;
    end;
  //Campo Data n�o podendo ser vazio
  if dbDtAb.Text= '  /  /    ' then
    begin
    if Length(Campos) > 0 then Campos := Campos+', ';
    Campos := Campos+'Data de Abertura';
    Gravar := False                    ;
    Vazio  := True                     ;
    end;
  if cmblLkBanco.Text = '' then
    begin
    if Length(campos) > 0 then Campos := Campos+', ';
    Campos := Campos+'BANCO';
    Gravar := False         ;
    Vazio  := True          ;
    End;
  if (dbDtAb.text <> '') then
    try StrToDate(dbDtAb.text)
    except on EConvertError do
      begin
      MsgDlg.MsgError('Data de Abertura Inv�lida');
      Gravar := False;
      end;
    end;
  if Gravar then
    begin
    dmdados.tbCCorrente.Post;
    //lan�a o primeiro movimento ref. a cadastro
    if Not (dmDados.TbMovConta.Locate('NumAgencia;Conta',
       VarArrayOf([dmDados.TbCCorrenteNumAgencia.Value,dmDados.TbCCorrenteConta.Value]),[])) then
      begin
      dmDados.TbMovConta.Append;
      dmdados.TbMovContaTipoOper.Value:='E';
      dmdados.TbMovContaNumAgencia.Value:=dmdados.TbCCorrenteNumAgencia.Value;
      dmdados.TbMovContaConta.Value:=dmdados.TbCCorrenteConta.Value;
      dmdados.TbMovContaCodHist.Value:='2';
      dmdados.TbMovContaComplHist.Value:='ABERTURA/CRIA��O DA CONTA';
      dmdados.TbMovContaDataMov.Value:=dmdados.TbCCorrenteDataCad.Value;
      dmDados.TbMovContaValor.Value:=dmdados.TbCCorrenteSaldo.Value;
      dmDados.TbMovContaDataReg.Value:=dmDados.TbCCorrenteUltMov.Value;
      dmdados.TbMovContaHoraReg.Value:=StrToTime('00:00:00');
      dmdados.TbMovConta.Post;
      end;
    NovoItem            := False;
    dmDados.vTabStt     := True ;
    btnCadBanco.Enabled := False;
    BtnGravar.enabled   := False;
    BtnCancelar.Enabled := False;
    BtnNovo.Enabled     := True ;
    BtnPrimeiro.Enabled := True ;
    BtnAnterior.Enabled := True ;
    BtnProximo.Enabled  := True ;
    BtnUltimo.Enabled   := True ;
    BtnAlterar.Enabled  := True ;
    Btndeletar.Enabled  := True ;
    {desabilitando os componentes}
    dbDtAb.Enabled      := False;
    dbDesc.Enabled      := False;
    cmblLkBanco.Enabled := False;
    dbAgencia.Enabled   := False;
    dbNumConta.Enabled  := False;
    dbTel1.Enabled      := False;
    dbFax.Enabled       := False;
    dbGerente.Enabled   := False;
    dbDtUlMov.Enabled   := False;
    dbHora.Enabled      := False;
    dbTitular.Enabled   := False;
    dbLimite.Enabled    := False;
    dbSaldo.Enabled     := False;
    dbEmail.Enabled     := False;
    dbInternet.Enabled  := False;
    MsgDlg.MsgInformation('Dados gravados com sucesso!');
    pnBotoes.SetFocus;
    end
  else
    begin
    if Vazio then
      MsgDlg.MsgWarning('O(s) Campo(s) '+Campos+' n�o tem Valor(es) ');
    dbDtAb.SetFocus;
    end;
  Tabela.Free;
end;

procedure TfrmCadCCorrente.btnCancelarClick(Sender: TObject);
begin
  dmDados.tbCCorrente.cancel;
  NovoItem            := False;
  dmDados.vTabStt     := True ;
  btnCadBanco.Enabled := False;
  BtnGravar.enabled   := False;
  BtnCancelar.Enabled := False;
  BtnNovo.Enabled     := True ;
  BtnPrimeiro.Enabled := True ;
  BtnAnterior.Enabled := True ;
  Btnproximo.Enabled  := True ;
  BtnUltimo.Enabled   := True ;
  BtnAlterar.Enabled  := True ;
  BtnDeletar.Enabled  := True ;
  {desabilitando os componentes}
  dbDtAb.Enabled      := False;
  dbDesc.Enabled      := False;
  cmblLkBanco.Enabled := False;
  dbAgencia.Enabled   := False;
  dbNumConta.Enabled  := False;
  dbTel1.Enabled      := False;
  dbFax.Enabled       := False;
  dbGerente.Enabled   := False;
  dbDtUlMov.Enabled   := False;
  dbHora.Enabled      := False;
  dbTitular.Enabled   := False;
  dbLimite.Enabled    := False;
  dbSaldo.Enabled     := False;
  dbEmail.Enabled     := False;
  dbInternet.Enabled  := False;
  pnBotoes.SetFocus;
end;

procedure TfrmCadCCorrente.btnAlterarClick(Sender: TObject);
begin
  if dmdados.tbCCorrente.RecordCount = 0 then
    begin
    MsgDlg.MsgInformation('Tabela sem registro');
    end
  else
    begin
    dmDados.tbCCorrente.Edit;
    NovoItem            := True ;
    dmDados.vTabStt     := False;
    btnCadBanco.Enabled := True ;
    BtnCancelar.enabled := True ;
    BtnGravar.Enabled   := True ;
    BtnNovo.Enabled     := False;
    BtnPrimeiro.Enabled := False;
    BtnAnterior.Enabled := False;
    BtnProximo.Enabled  := False;
    BtnUltimo.Enabled   := False;
    BtnAlterar.Enabled  := False;
    Btndeletar.Enabled  := False;
    {habilitando os componentes}
    dbDtAb.Enabled      := True ;
    DbDesc.Enabled      := True ;
    cmblLkBanco.Enabled := True ;
    dbAgencia.Enabled   := True ;
    dbNumConta.Enabled  := True ;
    dbTel1.Enabled      := True ;
    dbFax.Enabled       := True ;
    dbGerente.Enabled   := True ;
    dbDtUlMov.Enabled   := True ;
    dbHora.Enabled      := True ;
    dbTitular.Enabled   := True ;
    dbLimite.Enabled    := True ;
    dbSaldo.Enabled     := True ;
    dbEmail.Enabled     := True ;
    dbInternet.Enabled  := True ;
    dbDtAb.SetFocus;
    end;
end;

procedure TfrmCadCCorrente.btnDeletarClick(Sender: TObject);
begin
  if dmdados.tbCCorrente.RecordCount=0 then
    MsgDlg.MsgInformation('Tabela sem registro')
  else
    if MsgDlg.MsgConfirmation('Tem certeza que deseja exluir esse registro?') = id_yes then
      if dmDados.TbMovConta.Locate('NumAgencia;Conta',VarArrayOf([dmDados.TbCCorrenteNumAgencia.Value,dmDados.TbCCorrenteConta.Value]),[]) then
        MsgDlg.MsgWarning('CONTA CORRENTE ativa, n�o pode ser excluida !!!')
      else
        dmdados.tbCCorrente.Delete;
end;

procedure TfrmCadCCorrente.FormActivate(Sender: TObject);
begin
  dmDados.TbCCorrente.Open;
  dmDados.tbBanco.Open;
  dmDados.TbMovConta.Open;
  dmDados.vTabStt := True ;
  NovoItem        := False;
  FrmPrincipal.StatusTeclas(True,'[Insert] Novo [Home] Alterar [End] Gravar [F2] Banco [Delete] Excluir [Esc] Cancelar ou Sair');
  if dmdados.TbCCorrente.RecordCount = 0 then
    begin
    Btnprimeiro.Enabled := False;
    BtnAnterior.Enabled := False;
    BtnProximo.Enabled  := False;
    BtnUltimo.Enabled   := False;
    btnGravar.Enabled   := False;
    btnAlterar.Enabled  := False;
    btnCancelar.Enabled := False;
    btnDeletar.Enabled  := False;
    end;
end;

procedure TfrmCadCCorrente.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FrmPrincipal.StatusTeclas(False,'');
  dmDados.TbCCorrente.Close;
  dmDados.TbMovConta.Close;
  dmDados.tbBanco.Close;
  Action := Cafree;
end;

procedure TfrmCadCCorrente.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    case (key) of
      // Teclas de a��o na tabela
      VK_Insert : if (dmDados.vTabStt) then BtnNovo.Click;
      VK_Home   : if (dmDados.vTabStt) then BtnAlterar.Click;
      VK_Delete : if (dmDados.vTabStt) then BtnDeletar.Click;
      VK_End    : if not(dmDados.vTabStt) then BtnGravar.Click;
      VK_ESCAPE : if not(dmDados.vTabStt) then BtnCancelar.Click
                  else BtnSair.Click;
      VK_F2     : btnCadBanco.Click;
    end;
end;

procedure TfrmCadCCorrente.btnInterntClick(Sender: TObject);
var
 url : string;
begin
  url := dmdados.TbCCorrenteInternet.Value;
  if dmDados.TbCCorrenteInternet.Value <> '' then
    shellexecute(0, 'open',Pchar(url), nil, nil, sw_showNormal);
end;

end.
