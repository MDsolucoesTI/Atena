//////////////////////////////////////////////////////////////////////////
// Criacao...........: 08/2008
// Sistema...........: Atena - Automacao Clinica Odontologica
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit untCadCartao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, JvTransBtn, JvComponent, JvEnterTab, fcLabel, ExtCtrls, fcpanel,
  StdCtrls, Mask, DBCtrls, JvLabel, ToolEdit, RXDBCtrl, fcButton, fcImgBtn,
  JvDBComb, CurrEdit, EMsgDlg, EDBZero, JvPanel, JvTransparentPanel, ShellApi,
  DB, DBTables;

type
  TfrmCadCartao = class(TForm)
    pnTop: TfcPanel;
    fcLabel2: TfcLabel;
    JvEnterAsTab2: TJvEnterAsTab;
    pnCentro: TfcPanel;
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
    JvLabel1: TJvLabel;
    dbCod: TDBEdit;
    JvLabel10: TJvLabel;
    dbCartao: TDBEdit;
    JvLabel16: TJvLabel;
    dbLimite: TRxDBCalcEdit;
    JvLabel23: TJvLabel;
    cmbTel1: TJvDBComboBox;
    cmbTel2: TJvDBComboBox;
    dbTel1: TDBEdit;
    dbTel2: TDBEdit;
    dbTel3: TDBEdit;
    btnTel1: TfcImageBtn;
    btnTel2: TfcImageBtn;
    btnTel3: TfcImageBtn;
    JvLabel20: TJvLabel;
    dbObs: TDBMemo;
    JvLabel3: TJvLabel;
    dbDataCad: TDBDateEdit;
    JvLabel14: TJvLabel;
    dbInternet: TDBEdit;
    btnInternt: TfcImageBtn;
    JvLabel15: TJvLabel;
    JvTransparentPanel1: TJvTransparentPanel;
    cmbTel3: TJvDBComboBox;
    JvLabel2: TJvLabel;
    dbDiaVenc: TEvDBZeroEdit;
    dbAnual: TRxDBCalcEdit;
    MsgDlg: TEvMsgDlg;
    procedure btnSairClick(Sender: TObject);
    procedure btnInterntClick(Sender: TObject);
    procedure btnTel1Click(Sender: TObject);
    procedure btnTel2Click(Sender: TObject);
    procedure btnTel3Click(Sender: TObject);
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
    procedure FormShow(Sender: TObject);
    procedure cmbTel1Exit(Sender: TObject);
    procedure cmbTel2Exit(Sender: TObject);
    procedure cmbTel3Exit(Sender: TObject);
    procedure dbCartaoExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadCartao : TfrmCadCartao;
  NovoItem     : Boolean      ;

implementation

uses untdmDados, untDiscar, untPrincipal;

{$R *.dfm}

procedure TfrmCadCartao.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmCadCartao.btnInterntClick(Sender: TObject);
var
 url : string;
begin
  url := dmdados.tbCartaoInternet.Value;
  if dmDados.tbCartaoInternet.Value <> '' then
    shellexecute(0, 'open',Pchar(url), nil, nil, sw_showNormal);
end;

procedure TfrmCadCartao.btnTel1Click(Sender: TObject);
begin
  frmDiscar:=TfrmDiscar.create(application);
  frmDiscar.Show;
end;

procedure TfrmCadCartao.btnTel2Click(Sender: TObject);
begin
  frmDiscar:=TfrmDiscar.create(application);
  frmDiscar.Show;
end;

procedure TfrmCadCartao.btnTel3Click(Sender: TObject);
begin
  frmDiscar:=TfrmDiscar.create(application);
  frmDiscar.Show;
end;

procedure TfrmCadCartao.btnPrimeiroClick(Sender: TObject);
begin
  dmDados.tbCartao.First;
  btnPrimeiro.Enabled := False;
  btnAnterior.Enabled := False;
  btnProximo.Enabled  := True ;
  btnUltimo.Enabled   := True ;
  dmDados.vTabStt     := True ;
end;

procedure TfrmCadCartao.btnAnteriorClick(Sender: TObject);
begin
  dmDados.tbCartao.Prior;
  btnProximo.Enabled := True;
  btnUltimo.Enabled  := True;
  if DMDados.tbCartao.Bof then
    begin
    btnPrimeiro.Enabled := False;
    btnAnterior.Enabled := False;
    end;
  dmDados.vTabStt := True;
end;

procedure TfrmCadCartao.btnProximoClick(Sender: TObject);
begin
  dmDados.tbCartao.Next;
  btnPrimeiro.Enabled := True;
  btnAnterior.Enabled := True;
  If dmDados.tbCartao.Eof Then
    Begin
    btnProximo.Enabled := False;
    btnUltimo.Enabled  := False;
    End;
  dmDados.vTabStt := True;
end;

procedure TfrmCadCartao.btnUltimoClick(Sender: TObject);
begin
  dmDados.tbCartao.Last;
  btnPrimeiro.Enabled := True ;
  btnAnterior.Enabled := True ;
  btnProximo.Enabled  := False;
  btnUltimo.Enabled   := False;
  dmDados.vTabStt     := True ;
end;

procedure TfrmCadCartao.btnNovoClick(Sender: TObject);
begin
  dmdados.tbCartao.Append;
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
  dbCartao.Enabled    := True;
  dbAnual.Enabled     := True;
  dbDiaVenc.Enabled   := True;
  dbLimite.Enabled    := True;
  dbDataCad.Enabled   := True;
  dbInternet.Enabled  := True;
  cmbTel1.Enabled     := True;
  dbTel1.Enabled      := True;
  cmbTel2.Enabled     := True;
  dbTel2.Enabled      := True;
  cmbTel3.Enabled     := True;
  dbTel3.Enabled      := True;
  dbObs.Enabled       := True;
  dbCartao.SetFocus;
end;

procedure TfrmCadCartao.btnGravarClick(Sender: TObject);
Var
  Campos:String;
  Vazio,Gravar:Boolean;
  tabela: ttable;
begin
  Campos :='';
  Gravar :=True;
  Vazio  :=False;
  Tabela := TTable.Create(Application);
  Tabela.DatabaseName := dmDados.tbCartao.DatabaseName;
  Tabela.TableName    := dmDados.tbCartao.TableName;
  Tabela.IndexName    := dmdados.tbCartao.IndexName;
  Tabela.Open;
	if dbCartao.Text='' then
  	begin
    if Length(Campos)>0 then Campos:=Campos+', ';
    Campos:=Campos+'Cart�o';
    Gravar:=False;
    Vazio:=True;
  	End
  else
    if Tabela.Locate('Cartao',dbCartao.Text,[]) then
      if not((DmDados.tbCartao.State=dsEdit) And (dmDados.tbCartao.RecNo = Tabela.RecNo)) then
        begin
        Gravar:=False;
        MsgDlg.MsgWarning('Cart�o j� cadastrado!');
        dbCartao.SetFocus;
        end;
  if gravar then
    begin
    NovoItem := False;
    dmdados.tbCartao.Post;
    dmDados.vTabStt     := True ;
    BtnGravar.Enabled   := False;
    BtnCancelar.Enabled := False;
    BtnNovo.Enabled     := True ;
    BtnPrimeiro.Enabled := True ;
    BtnAnterior.Enabled := True ;
    BtnProximo.Enabled  := True ;
    BtnUltimo.Enabled   := True ;
    BtnAlterar.Enabled  := True ;
    Btndeletar.Enabled  := True ;
    {Desabilitando os componentes}
    dbCartao.Enabled    := False;
    dbAnual.Enabled     := False;
    dbDiaVenc.Enabled   := False;
    dbLimite.Enabled    := False;
    dbDataCad.Enabled   := False;
    dbInternet.Enabled  := False;
    cmbTel1.Enabled     := False;
    dbTel1.Enabled      := False;
    cmbTel2.Enabled     := False;
    dbTel2.Enabled      := False;
    cmbTel3.Enabled     := False;
    dbTel3.Enabled      := False;
    dbObs.Enabled       := False;
    MsgDlg.MsgInformation('Dados gravados com sucesso!');
    pnBotoes.SetFocus;
    end
  else
    begin
    if Vazio then
      MsgDlg.MsgWarning('O(s) Campo(s) '+Campos+' n�o tem Valor(es) ');
    dbCartao.Enabled:=true;
    end;
  tabela.Free;
end;

procedure TfrmCadCartao.btnCancelarClick(Sender: TObject);
begin
  dmDados.tbCartao.Cancel;
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
  dbCartao.Enabled    := False;
  dbAnual.Enabled     := False;
  dbDiaVenc.Enabled   := False;
  dbLimite.Enabled    := False;
  dbDataCad.Enabled   := False;
  dbInternet.Enabled  := False;
  cmbTel1.Enabled     := False;
  dbTel1.Enabled      := False;
  cmbTel2.Enabled     := False;
  dbTel2.Enabled      := False;
  cmbTel3.Enabled     := False;
  dbTel3.Enabled      := False;
  dbObs.Enabled       := False;
  dmDados.vTabStt     := True ;
  pnBotoes.SetFocus;
end;

procedure TfrmCadCartao.btnAlterarClick(Sender: TObject);
begin
  if (dmDados.tbCartao.RecordCount = 0) then
    MsgDlg.MsgError('Tabela vazia')
  else
    begin
    dmDados.tbCartao.Edit;
    NovoItem             := True ;
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
    dbCartao.Enabled    := True ;
    dbAnual.Enabled     := True ;
    dbDiaVenc.Enabled   := True ;
    dbLimite.Enabled    := True ;
    dbDataCad.Enabled   := True ;
    dbInternet.Enabled  := True ;
    cmbTel1.Enabled     := True ;
    dbTel1.Enabled      := True ;
    cmbTel2.Enabled     := True ;
    dbTel2.Enabled      := True ;
    cmbTel3.Enabled     := True ;
    dbTel3.Enabled      := True ;
    dbObs.Enabled       := True ;
    dmDados.vTabStt     := False;
    dbCartao.SetFocus;
    end;
end;

procedure TfrmCadCartao.btnDeletarClick(Sender: TObject);
var
  Flag : Boolean;
begin
  Flag := False;
  if (dmDados.tbCartao.RecordCount = 0) then
    MsgDlg.MsgError('Tabela vazia')
  else
    if MsgDlg.MsgConfirmation('Tem certeza que deseja excluir este registro?') = id_yes then
      begin
      if (Flag) then
        MsgDlg.MsgInformation('Cart�o ativo, ou com registro de opera��es anteriores, n�o pode ser exclu�do !!!')
      else
        dmDados.tbCartao.Delete;
      end
    else
      dmDados.tbCartao.cancel;
end;

procedure TfrmCadCartao.FormActivate(Sender: TObject);
begin
  frmPrincipal.StatusTeclas(True,' [Insert] Novo [Home] Alterar [End] Gravar [Delete] Excluir [F2] E-mail [Esc] Cancelar ou Sair');
end;

procedure TfrmCadCartao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  dmDados.tbCartao.Close ;
  frmPrincipal.StatusTeclas(False,'');
  Action := CaFree;
end;

procedure TfrmCadCartao.FormKeyDown(Sender: TObject; var Key: Word;
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
    VK_F2     : btnInternt.Click;
  end;
end;

procedure TfrmCadCartao.FormShow(Sender: TObject);
begin
  dmDados.vTabStt := True;
  if (dmDados.tbCartao.State = dsInactive) then
    dmDados.tbCartao.Open;
end;

procedure TfrmCadCartao.cmbTel1Exit(Sender: TObject);
begin
  if (cmbTel1.Text = '0800/0300') then
    dmDados.tbCartaoTel1.EditMask:='9999-99999##;0;_'
  else
    dmDados.tbCartaoTel1.EditMask:='\(99\)C999-9999;0;_'
end;

procedure TfrmCadCartao.cmbTel2Exit(Sender: TObject);
begin
  if (cmbTel2.Text = '0800/0300') then
    dmDados.tbCartaoTel2.EditMask:='9999-99999##;0;_'
  else
    dmDados.tbCartaoTel2.EditMask:='\(99\)C999-9999;0;_'
end;

procedure TfrmCadCartao.cmbTel3Exit(Sender: TObject);
begin
  if (cmbTel3.Text = '0800/0300') then
    dmDados.tbCartaoTel3.EditMask:='9999-99999##;0;_'
  else
    dmDados.tbCartaoTel3.EditMask:='\(99\)C999-9999;0;_'
end;

procedure TfrmCadCartao.dbCartaoExit(Sender: TObject);
Var
  Tabela: TTable;
begin
  Tabela := TTable.Create(Application);
  Tabela.DatabaseName := dmDados.tbCartao.DatabaseName;
  Tabela.TableName    := dmDados.tbCartao.TableName   ;
  Tabela.IndexName    := dmdados.tbCartao.IndexName   ;
  Tabela.Open;
  if NovoItem then
    if dbCartao.Text = '' then
      begin
      MsgDlg.MsgError('� necess�rio Informar o Cart�o!');
      dbCartao.setfocus;
      end
    else
      if Tabela.Locate('Cartao',dbCartao.Text,[]) then
        if not ((DmDados.tbCartao.State=dsEdit) And (dmDados.tbCartao.RecNo = Tabela.RecNo)) then
          begin
          MsgDlg.MsgWarning('Cart�o j� cadastrado!');
          dbCartao.Clear;
          dbCartao.setfocus;
          end;
  Tabela.Free;
end;

end.
