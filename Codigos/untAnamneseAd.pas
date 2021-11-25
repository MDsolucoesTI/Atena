unit untAnamneseAd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, JvComponent, JvTransBtn, fcLabel, ExtCtrls, fcpanel, StdCtrls,
  Mask, DBCtrls, fcButton, fcImgBtn, JvLabel, JvScrollBox, EMsgDlg, DB,
  LMDCustomComponent, lmdcont, LMDCustomControl, LMDCustomPanel,
  LMDCustomBevelPanel, LMDCustomParentPanel, LMDCustomGroupBox,
  LMDCustomButtonGroup, LMDCustomRadioGroup, LMDRadioGroup, ComCtrls,
  JvEnterTab, RxDBComb, JvScrollMax, ToolEdit, RXDBCtrl, RxLookup, JvPanel,
  JvTransparentPanel, ELibFnc;

type
  TfrmAnamneseAd = class(TForm)
    pnTop: TfcPanel;
    fcLabel1: TfcLabel;
    pnBotoes: TfcPanel;
    btnGravar: TJvTransparentButton;
    btnCancelar: TJvTransparentButton;
    btnAlterar: TJvTransparentButton;
    btnDeletar: TJvTransparentButton;
    btnSair: TJvTransparentButton;
    pnCentro: TfcPanel;
    btnLembrete: TJvTransparentButton;
    pgAnamAd: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    JvEnterAsTab1: TJvEnterAsTab;
    JvScrollBox1: TJvScrollBox;
    JvLabel1: TJvLabel;
    JvLabel3: TJvLabel;
    JvLabel4: TJvLabel;
    JvLabel5: TJvLabel;
    JvLabel6: TJvLabel;
    JvLabel7: TJvLabel;
    JvLabel8: TJvLabel;
    JvLabel9: TJvLabel;
    JvLabel11: TJvLabel;
    JvLabel12: TJvLabel;
    JvLabel13: TJvLabel;
    JvLabel14: TJvLabel;
    JvLabel15: TJvLabel;
    JvLabel16: TJvLabel;
    JvLabel17: TJvLabel;
    JvLabel18: TJvLabel;
    JvLabel19: TJvLabel;
    JvLabel20: TJvLabel;
    JvLabel21: TJvLabel;
    JvLabel22: TJvLabel;
    JvLabel23: TJvLabel;
    JvLabel24: TJvLabel;
    JvLabel25: TJvLabel;
    JvLabel26: TJvLabel;
    JvLabel27: TJvLabel;
    JvLabel28: TJvLabel;
    JvLabel29: TJvLabel;
    JvLabel30: TJvLabel;
    JvLabel10: TJvLabel;
    JvLabel31: TJvLabel;
    chP5S: TDBCheckBox;
    chP5N: TDBCheckBox;
    chP5NS: TDBCheckBox;
    chP6S: TDBCheckBox;
    chP6N: TDBCheckBox;
    chP6NS: TDBCheckBox;
    chP7S: TDBCheckBox;
    chP7N: TDBCheckBox;
    chP7NS: TDBCheckBox;
    chP8S: TDBCheckBox;
    chP8N: TDBCheckBox;
    chP8NS: TDBCheckBox;
    chP10S: TDBCheckBox;
    chP10N: TDBCheckBox;
    chP10NS: TDBCheckBox;
    chP11S: TDBCheckBox;
    chP11N: TDBCheckBox;
    chP11NS: TDBCheckBox;
    chP12S: TDBCheckBox;
    chP12N: TDBCheckBox;
    chP12NS: TDBCheckBox;
    chP13S: TDBCheckBox;
    chP13N: TDBCheckBox;
    chP13NS: TDBCheckBox;
    chP14S: TDBCheckBox;
    chP14N: TDBCheckBox;
    chP14NS: TDBCheckBox;
    chP15S: TDBCheckBox;
    chP15N: TDBCheckBox;
    chP15NS: TDBCheckBox;
    chP16S: TDBCheckBox;
    chP16N: TDBCheckBox;
    chP16NS: TDBCheckBox;
    chP17S: TDBCheckBox;
    chP17N: TDBCheckBox;
    chP17NS: TDBCheckBox;
    chP18S: TDBCheckBox;
    chP18N: TDBCheckBox;
    chP18NS: TDBCheckBox;
    chP19S: TDBCheckBox;
    chP19N: TDBCheckBox;
    chP19NS: TDBCheckBox;
    chP20S: TDBCheckBox;
    chP20N: TDBCheckBox;
    chP20NS: TDBCheckBox;
    chP21S: TDBCheckBox;
    chP21N: TDBCheckBox;
    chP21NS: TDBCheckBox;
    chP22S: TDBCheckBox;
    chP22N: TDBCheckBox;
    chP22NS: TDBCheckBox;
    chP23S: TDBCheckBox;
    chP23N: TDBCheckBox;
    chP23NS: TDBCheckBox;
    chP24S: TDBCheckBox;
    chP24N: TDBCheckBox;
    chP24NS: TDBCheckBox;
    chP25S: TDBCheckBox;
    chP25N: TDBCheckBox;
    chP25NS: TDBCheckBox;
    chP26S: TDBCheckBox;
    chP26N: TDBCheckBox;
    chP26NS: TDBCheckBox;
    chP27S: TDBCheckBox;
    chP27N: TDBCheckBox;
    chP27NS: TDBCheckBox;
    chP28S: TDBCheckBox;
    chP28N: TDBCheckBox;
    chP28NS: TDBCheckBox;
    chP29S: TDBCheckBox;
    chP29N: TDBCheckBox;
    chP29NS: TDBCheckBox;
    chP9S: TDBCheckBox;
    chP9N: TDBCheckBox;
    chP9NS: TDBCheckBox;
    JvLabel34: TJvLabel;
    JvLabel32: TJvLabel;
    dbMotivo: TDBEdit;
    JvLabel2: TJvLabel;
    perg1: TDBMemo;
    perg2: TDBMemo;
    perg3: TDBMemo;
    perg4: TDBMemo;
    perg5: TDBMemo;
    perg6: TDBMemo;
    perg7: TDBMemo;
    perg8: TDBMemo;
    perg9: TDBMemo;
    perg10: TDBMemo;
    perg11: TDBMemo;
    perg12: TDBMemo;
    perg13: TDBMemo;
    perg14: TDBMemo;
    perg15: TDBMemo;
    perg16: TDBMemo;
    perg17: TDBMemo;
    perg18: TDBMemo;
    perg19: TDBMemo;
    perg20: TDBMemo;
    perg21: TDBMemo;
    perg22: TDBMemo;
    perg23: TDBMemo;
    perg24: TDBMemo;
    perg25: TDBMemo;
    perg26: TDBMemo;
    perg27: TDBMemo;
    perg28: TDBMemo;
    perg29: TDBMemo;
    perg30: TDBMemo;
    chP1S: TDBCheckBox;
    chP1N: TDBCheckBox;
    chP2S: TDBCheckBox;
    chP2N: TDBCheckBox;
    chP3S: TDBCheckBox;
    chP3N: TDBCheckBox;
    chP3NS: TDBCheckBox;
    chP4S: TDBCheckBox;
    chP4N: TDBCheckBox;
    chP4NS: TDBCheckBox;
    MsgDlg: TEvMsgDlg;
    dbRadio: TDBRadioGroup;
    cmbLkPac: TRxDBLookupCombo;
    JvScrollBox2: TJvScrollBox;
    JvLabel35: TJvLabel;
    JvLabel36: TJvLabel;
    dbDtUlAt: TDBDateEdit;
    chComp: TDBCheckBox;
    chIncomp: TDBCheckBox;
    dbExpNeg: TDBMemo;
    JvLabel37: TJvLabel;
    Bevel1: TBevel;
    chRoer: TDBCheckBox;
    chMorder: TDBCheckBox;
    chResp: TDBCheckBox;
    chTomar: TDBCheckBox;
    chChup: TDBCheckBox;
    chRang: TDBCheckBox;
    chOut: TDBCheckBox;
    JvLabel41: TJvLabel;
    chDiS: TDBCheckBox;
    chDiN: TDBCheckBox;
    chCreme: TDBCheckBox;
    chEscova: TDBCheckBox;
    chPalito: TDBCheckBox;
    chInter: TDBCheckBox;
    chUni: TDBCheckBox;
    chFio: TDBCheckBox;
    Bevel2: TBevel;
    JvLabel39: TJvLabel;
    JvLabel38: TJvLabel;
    chFAg: TDBCheckBox;
    chFboch: TDBCheckBox;
    chFcreme: TDBCheckBox;
    chFgel: TDBCheckBox;
    Bevel3: TBevel;
    JvLabel40: TJvLabel;
    dbCremeDent: TDBEdit;
    JvLabel33: TJvLabel;
    Bevel4: TBevel;
    JvTransparentPanel1: TJvTransparentPanel;
    btnImprimir: TJvTransparentButton;
    EvLibFunctions1: TEvLibFunctions;
    JvTransparentPanel2: TJvTransparentPanel;
    procedure btnSairClick(Sender: TObject);
    procedure btnLembreteClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cmbLkPacExit(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnDeletarClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure perg30Exit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
  private
    { Private declarations }
    fPaciente : Integer;
  public
    { Public declarations }
    property Paciente : Integer read fPaciente write fPaciente;
  end;

var
  frmAnamneseAd : TfrmAnamneseAd;
  NovoItem      : Boolean       ;
  BotaoNovo     : Boolean       ;

implementation

uses untLembrete, untLocPac, untdmDados, untAnamneseInf, untPrincipal,
     untQRAnamAd, untqrAnamAd2;

{$R *.dfm}

procedure TfrmAnamneseAd.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmAnamneseAd.btnLembreteClick(Sender: TObject);
begin
  FrmLembrete:=TFrmLembrete.create(application);
  FrmLembrete.ShowModal;
end;

procedure TfrmAnamneseAd.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  frmPrincipal.StatusTeclas(False,'');
  Action := CaFree;
end;

procedure TfrmAnamneseAd.cmbLkPacExit(Sender: TObject);
begin
  if (NovoItem) then
    if (cmbLkPac.Text = '') then
      begin
      MsgDlg.MsgWarning('É obrigatório escolher o Paciente!');
      cmbLkPac.SetFocus;
      end;
end;

procedure TfrmAnamneseAd.btnCancelarClick(Sender: TObject);
begin
  dmDados.tbAnamneseAd.cancel;
  NovoItem            := False;
  dmDados.vTabStt     := True ;
  BtnGravar.enabled   := False;
  BtnCancelar.Enabled := False;
  btnLembrete.Enabled := False;
  BtnAlterar.Enabled  := True ;
  BtnDeletar.Enabled  := True ;
  {desabilitando os componentes}
  cmbLkPac.Enabled  := False;
  dbMotivo.Enabled  := False;
  dbRadio.Enabled   := False;
  pgAnamAd.Enabled  := False;
  pgAnamAd.ActivePage := TabSheet1;  
  pnBotoes.setfocus;
end;

procedure TfrmAnamneseAd.btnAlterarClick(Sender: TObject);
begin
  if dmdados.tbAnamneseAd.RecordCount = 0 then
    begin
    MsgDlg.MsgInformation('Tabela sem registro');
    end
  else
    begin
    dmDados.tbAnamneseAd.Edit;
    NovoItem            := True ;
    dmDados.vTabStt     := False;
    BtnCancelar.enabled := True ;
    BtnGravar.Enabled   := True ;
    btnLembrete.Enabled := True ;
    BtnAlterar.Enabled  := False;
    Btndeletar.Enabled  := False;
    {habilitando os componentes}
    cmbLkPac.Enabled  := True;
    dbMotivo.Enabled  := True;
    dbRadio.Enabled   := True;
    pgAnamAd.Enabled  := true;
    pgAnamAd.ActivePage := TabSheet1;
    cmbLkPac.setfocus;
    end;
end;

procedure TfrmAnamneseAd.btnDeletarClick(Sender: TObject);
begin
  if (dmDados.tbAnamneseAd.RecordCount = 0) then
    MsgDlg.MsgError('Tabela vazia')
  else
    if (MsgDlg.MsgConfirmation('Tem certeza que deseja excluir este registro?') = id_yes) then
      dmDados.tbAnamneseAd.Delete;
end;

procedure TfrmAnamneseAd.btnGravarClick(Sender: TObject);
var
  Campos : string ;
  Gravar : boolean;
  Vazio  : boolean;
  x      : integer;
  Flag   : boolean;
begin
  Campos := '';
  Gravar := True;
  Vazio  := False;
  if (cmbLkPac.Text = '') then
    begin
    if (Length(Campos) > 0) then
      Campos := Campos + ', ';
    Campos := 'Nome';
    Gravar := False ;
    Vazio  := True  ;
    end;
  if Gravar Then
    begin
    NovoItem := False;
    dmdados.tbAnamneseAd.Post;
    dmDados.vTabStt := True;
    // Ajusta Botões
    btnGravar.Enabled   := False;
    btnCancelar.Enabled := False;
    btnLembrete.Enabled := False;
    btnAlterar.Enabled  := True ;
    btndeletar.Enabled  := True ;
    // Desabilitando os Componentes
    cmbLkPac.Enabled  := False;
    dbMotivo.Enabled  := False;
    dbRadio.Enabled   := False;
    pgAnamAd.Enabled  := False;
    MsgDlg.MsgInformation('Dados gravados com sucesso!');
    dmDados.tbAnamneseAd.Refresh;
    pgAnamAd.ActivePage := TabSheet1;
    pnBotoes.SetFocus;
    end
  else
    if (Vazio) then
      begin
      MsgDlg.MsgWarning('O(s) Campo(s) '+Campos+' não tem Valor(es) ');
      cmbLkPac.Enabled := True;
      cmbLkPac.SetFocus;
      end;
end;

procedure TfrmAnamneseAd.FormActivate(Sender: TObject);
begin
  frmPrincipal.StatusTeclas(True,' [Insert] Novo [Home] Alterar [End] Gravar [Delete] Excluir [F2] Lembrete [Esc] Cancelar ou Sair');
end;

procedure TfrmAnamneseAd.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case (key) of
    // Teclas de ação na tabela
    VK_Home   : if (dmDados.vTabStt) then btnAlterar.Click;
    VK_Delete : if (dmDados.vTabStt) then btnDeletar.Click;
    VK_End    : if not(dmDados.vTabStt) then btnGravar.Click;
    VK_ESCAPE : if not(dmDados.vTabStt) then btnCancelar.Click
                else btnSair.Click;
    VK_F2     : btnLembrete.Click;
  end;
end;

procedure TfrmAnamneseAd.FormShow(Sender: TObject);
Var
  Cont : Integer;
begin
  dmDados.vTabStt := True;
  if (dmDados.tbAnamneseAd.State = dsInactive) then
    dmDados.tbAnamneseAd.Open;
  if (dmDados.tbPaciente.State   = dsInactive) then
    dmDados.tbPaciente.Open;
  if (Paciente <> 0) then
    if not(dmDados.tbAnamneseAd.Locate('CodPac',Paciente,[])) then
      begin
      dmdados.tbAnamneseAd.Append;
      NovoItem             := True ;
      dmDados.vTabStt      := False;
      for cont:=0 to Componentcount-1 do
        if (Components[cont] is TDBCheckBox) then
          TDBCheckBox(Components[Cont]).Checked := False;
      dmDados.tbAnamneseAd.Edit;
      if (Paciente <> 0) then
        dmDados.tbAnamneseAdCodPac.Value := Paciente;
      {habilitando os botões}
      btnGravar.Enabled    := True ;
      btnCancelar.Enabled  := True ;
      btnLembrete.Enabled  := True ;
      btnAlterar.Enabled   := False;
      btnDeletar.Enabled   := False;
      {habilitando os componentes}
      cmbLkPac.Enabled  := True;
      dbMotivo.Enabled  := True;
      dbRadio.Enabled   := True;
      pgAnamAd.Enabled  := True;
      dbMotivo.setfocus;
      end
    else
      dmDados.tbAnamneseAd.Edit;
end;

procedure TfrmAnamneseAd.perg30Exit(Sender: TObject);
begin
  pgAnamAd.ActivePage := TabSheet2;
end;

procedure TfrmAnamneseAd.FormCreate(Sender: TObject);
begin
  Paciente := 0;
end;

procedure TfrmAnamneseAd.btnImprimirClick(Sender: TObject);
begin
  qrAnamAd := TqrAnamAd.Create(Application);
  qrAnamAd.tbPaciente.Filtered := False;
  qrAnamAd.tbPaciente.Filter   := '(PAC_CODIGO = '''+IntToStr(Paciente)+''')';
  qrAnamAd.tbPaciente.Filtered := True;
  qrAnamAd.tbPaciente.First;
  with qrAnamAd do
    begin
    //Pergunta 1
    if (tbAnamneseAdP1Sim.Value) then
      lP1Sim.Caption := '(X)Sim ( )Não'
    else if (tbAnamneseAdP1Nao.Value) then
      lP1Sim.Caption := '( )Sim (X)Não'
    else
      lP1Sim.Caption := '( )Sim ( )Não';
    //Pergunta 2
    if (tbAnamneseAdP2Sim.Value) then
      lP2Sim.Caption := '(X)Sim ( )Não'
    else if (tbAnamneseAdP2Nao.Value) then
      lP2Sim.Caption := '( )Sim (X)Não'
    else
      lP2Sim.Caption := '( )Sim ( )Não';
    //Pergunta 3
    if (tbAnamneseAdP3Sim.Value) then
      lP3Sim.Caption := '(X)Sim ( )Não ( )Não Sei'
    else if (tbAnamneseAdP3Nao.Value) then
      lP3Sim.Caption := '( )Sim (X)Não ( )Não Sei'
    else if (tbAnamneseAdP3NaoSei.Value) then
      lP3Sim.Caption := '( )Sim ( )Não (X)Não Sei'
    else
      lP3Sim.Caption := '( )Sim ( )Não ( )Não Sei';
    //Pergunta 4
    if (tbAnamneseAdP4Sim.Value) then
      lP4Sim.Caption := '(X)Sim ( )Não ( )Não Sei'
    else if (tbAnamneseAdP4Nao.Value) then
      lP4Sim.Caption := '( )Sim (X)Não ( )Não Sei'
    else if (tbAnamneseAdP4NaoSei.Value) then
      lP4Sim.Caption := '( )Sim ( )Não (X)Não Sei'
    else
       lP4Sim.Caption := '( )Sim ( )Não ( )Não Sei';
    //Pergunta 5
    if (tbAnamneseAdP5Sim.Value) then
      lP5Sim.Caption := '(X)Sim ( )Não ( )Não Sei'
    else if (tbAnamneseAdP5Nao.Value) then
      lP5Sim.Caption := '( )Sim (X)Não ( )Não Sei'
    else if (tbAnamneseAdP5NaoSei.Value) then
      lP5Sim.Caption := '( )Sim ( )Não (X)Não Sei'
    else
      lP5Sim.Caption := '( )Sim ( )Não ( )Não Sei';
    //Pergunta 6
    if (tbAnamneseAdP6Sim.Value) then
      lP6Sim.Caption := '(X)Sim ( )Não ( )Não Sei'
    else if (tbAnamneseAdP6Nao.Value) then
      lP6Sim.Caption := '( )Sim (X)Não ( )Não Sei'
    else if (tbAnamneseAdP6NaoSei.Value) then
      lP6Sim.Caption := '( )Sim ( )Não (X)Não Sei'
    else
      lP6Sim.Caption := '( )Sim ( )Não ( )Não Sei';
    //Pergunta 7
    if (tbAnamneseAdP7Sim.Value) then
      lP7Sim.Caption := '(X)Sim ( )Não ( )Não Sei'
    else if (tbAnamneseAdP7Nao.Value) then
      lP7Sim.Caption := '( )Sim (X)Não ( )Não Sei'
    else if (tbAnamneseAdP7NaoSei.Value) then
      lP7Sim.Caption := '( )Sim ( )Não (X)Não Sei'
    else
      lP7Sim.Caption := '( )Sim ( )Não ( )Não Sei';
    //Pergunta 8
    if (tbAnamneseAdP8Sim.Value) then
      lP8Sim.Caption := '(X)Sim ( )Não ( )Não Sei'
    else if (tbAnamneseAdP8Nao.Value) then
      lP8Sim.Caption := '( )Sim (X)Não ( )Não Sei'
    else if (tbAnamneseAdP8NaoSei.Value) then
      lP8Sim.Caption := '( )Sim ( )Não (X)Não Sei'
    else
      lP8Sim.Caption := '( )Sim ( )Não ( )Não Sei';
    //Pergunta 9
    if (tbAnamneseAdP9Sim.Value) then
      lP9Sim.Caption := '(X)Sim ( )Não ( )Não Sei'
    else if (tbAnamneseAdP9Nao.Value) then
      lP9Sim.Caption := '( )Sim (X)Não ( )Não Sei'
    else if (tbAnamneseAdP9NaoSei.Value) then
      lP9Sim.Caption := '( )Sim ( )Não (X)Não Sei'
    else
      lP9Sim.Caption := '( )Sim ( )Não ( )Não Sei';
    //Pergunta 10
    if (tbAnamneseAdP10Sim.Value) then
      lP10Sim.Caption := '(X)Sim ( )Não ( )Não Sei'
    else if (tbAnamneseAdP10Nao.Value) then
      lP10Sim.Caption := '( )Sim (X)Não ( )Não Sei'
    else if (tbAnamneseAdP10NaoSei.Value) then
      lP10Sim.Caption := '( )Sim ( )Não (X)Não Sei'
    else
      lP10Sim.Caption := '( )Sim ( )Não ( )Não Sei';
    //Pergunta 11
    if (tbAnamneseAdP11Sim.Value) then
      lP11Sim.Caption := '(X)Sim ( )Não ( )Não Sei'
    else if (tbAnamneseAdP11Nao.Value) then
      lP11Sim.Caption := '( )Sim (X)Não ( )Não Sei'
    else if (tbAnamneseAdP11NaoSei.Value) then
      lP11Sim.Caption := '( )Sim ( )Não (X)Não Sei'
    else
      lP11Sim.Caption := '( )Sim ( )Não ( )Não Sei';
    //Pergunta 12
    if (tbAnamneseAdP12Sim.Value) then
      lP12Sim.Caption := '(X)Sim ( )Não ( )Não Sei'
    else if (tbAnamneseAdP12Nao.Value) then
      lP12Sim.Caption := '( )Sim (X)Não ( )Não Sei'
    else if (tbAnamneseAdP12NaoSei.Value) then
      lP12Sim.Caption := '( )Sim ( )Não (X)Não Sei'
    else
      lP12Sim.Caption := '( )Sim ( )Não ( )Não Sei';
    //Pergunta 13
    if (tbAnamneseAdP13Sim.Value) then
      lP13Sim.Caption := '(X)Sim ( )Não ( )Não Sei'
    else if (tbAnamneseAdP13Nao.Value) then
      lP13Sim.Caption := '( )Sim (X)Não ( )Não Sei'
    else if (tbAnamneseAdP13NaoSei.Value) then
      lP13Sim.Caption := '( )Sim ( )Não (X)Não Sei'
    else
      lP13Sim.Caption := '( )Sim ( )Não ( )Não Sei';
    //Pergunta 14
    if (tbAnamneseAdP14Sim.Value) then
      lP14Sim.Caption := '(X)Sim ( )Não ( )Não Sei'
    else if (tbAnamneseAdP14Nao.Value) then
      lP14Sim.Caption := '( )Sim (X)Não ( )Não Sei'
    else if (tbAnamneseAdP14NaoSei.Value) then
      lP14Sim.Caption := '( )Sim ( )Não (X)Não Sei'
    else
      lP14Sim.Caption := '( )Sim ( )Não ( )Não Sei';
    //Pergunta 15
    if (tbAnamneseAdP15Sim.Value) then
      lP15Sim.Caption := '(X)Sim ( )Não ( )Não Sei'
    else if (tbAnamneseAdP15Nao.Value) then
      lP15Sim.Caption := '( )Sim (X)Não ( )Não Sei'
    else if (tbAnamneseAdP15NaoSei.Value) then
      lP15Sim.Caption := '( )Sim ( )Não (X)Não Sei'
    else
      lP15Sim.Caption := '( )Sim ( )Não ( )Não Sei';
    //Pergunta 16
    if (tbAnamneseAdP16Sim.Value) then
      lP16Sim.Caption := '(X)Sim ( )Não ( )Não Sei'
    else if (tbAnamneseAdP16Nao.Value) then
      lP16Sim.Caption := '( )Sim (X)Não ( )Não Sei'
    else if (tbAnamneseAdP16NaoSei.Value) then
      lP16Sim.Caption := '( )Sim ( )Não (X)Não Sei'
    else
      lP16Sim.Caption := '( )Sim ( )Não ( )Não Sei';
    //Pergunta 17
    if (tbAnamneseAdP17Sim.Value) then
      lP17Sim.Caption := '(X)Sim ( )Não ( )Não Sei'
    else if (tbAnamneseAdP17Nao.Value) then
      lP17Sim.Caption := '( )Sim (X)Não ( )Não Sei'
    else if (tbAnamneseAdP17NaoSei.Value) then
      lP17Sim.Caption := '( )Sim ( )Não (X)Não Sei'
    else
      lP17Sim.Caption := '( )Sim ( )Não ( )Não Sei';
    //Pergunta 18
    if (tbAnamneseAdP18Sim.Value) then
      lP18Sim.Caption := '(X)Sim ( )Não ( )Não Sei'
    else if (tbAnamneseAdP18Nao.Value) then
      lP18Sim.Caption := '( )Sim (X)Não ( )Não Sei'
    else if (tbAnamneseAdP18NaoSei.Value) then
      lP18Sim.Caption := '( )Sim ( )Não (X)Não Sei'
    else
      lP18Sim.Caption := '( )Sim ( )Não ( )Não Sei';
    //Pergunta 19
    if (tbAnamneseAdP19Sim.Value) then
      lP19Sim.Caption := '(X)Sim ( )Não ( )Não Sei'
    else if (tbAnamneseAdP19Nao.Value) then
      lP19Sim.Caption := '( )Sim (X)Não ( )Não Sei'
    else if (tbAnamneseAdP19NaoSei.Value) then
      lP19Sim.Caption := '( )Sim ( )Não (X)Não Sei'
    else
      lP19Sim.Caption := '( )Sim ( )Não ( )Não Sei';
    //Pergunta 20
    if (tbAnamneseAdP20Sim.Value) then
      lP20Sim.Caption := '(X)Sim ( )Não ( )Não Sei'
    else if (tbAnamneseAdP20Nao.Value) then
      lP20Sim.Caption := '( )Sim (X)Não ( )Não Sei'
    else if (tbAnamneseAdP20NaoSei.Value) then
      lP20Sim.Caption := '( )Sim ( )Não (X)Não Sei'
    else
      lP20Sim.Caption := '( )Sim ( )Não ( )Não Sei';
    //Pergunta 21
    if (tbAnamneseAdP21Sim.Value) then
      lP21Sim.Caption := '(X)Sim ( )Não ( )Não Sei'
    else if (tbAnamneseAdP21Nao.Value) then
      lP21Sim.Caption := '( )Sim (X)Não ( )Não Sei'
    else if (tbAnamneseAdP21NaoSei.Value) then
      lP21Sim.Caption := '( )Sim ( )Não (X)Não Sei'
    else
      lP21Sim.Caption := '( )Sim ( )Não ( )Não Sei';
    //Pergunta 22
    if (tbAnamneseAdP22Sim.Value) then
      lP22Sim.Caption := '(X)Sim ( )Não ( )Não Sei'
    else if (tbAnamneseAdP22Nao.Value) then
      lP22Sim.Caption := '( )Sim (X)Não ( )Não Sei'
    else if (tbAnamneseAdP22NaoSei.Value) then
      lP22Sim.Caption := '( )Sim ( )Não (X)Não Sei'
    else
      lP22Sim.Caption := '( )Sim ( )Não ( )Não Sei';
    //Pergunta 23
    if (tbAnamneseAdP23Sim.Value) then
      lP23Sim.Caption := '(X)Sim ( )Não ( )Não Sei'
    else if (tbAnamneseAdP23Nao.Value) then
      lP23Sim.Caption := '( )Sim (X)Não ( )Não Sei'
    else if (tbAnamneseAdP23NaoSei.Value) then
      lP23Sim.Caption := '( )Sim ( )Não (X)Não Sei'
    else
      lP23Sim.Caption := '( )Sim ( )Não ( )Não Sei';
    //Pergunta 24
    if (tbAnamneseAdP24Sim.Value) then
      lP24Sim.Caption := '(X)Sim ( )Não ( )Não Sei'
    else if (tbAnamneseAdP24Nao.Value) then
      lP24Sim.Caption := '( )Sim (X)Não ( )Não Sei'
    else if (tbAnamneseAdP24NaoSei.Value) then
      lP24Sim.Caption := '( )Sim ( )Não (X)Não Sei'
    else
      lP24Sim.Caption := '( )Sim ( )Não ( )Não Sei';
    //Pergunta 25
    if (tbAnamneseAdP25Sim.Value) then
      lP25Sim.Caption := '(X)Sim ( )Não ( )Não Sei'
    else if (tbAnamneseAdP25Nao.Value) then
      lP25Sim.Caption := '( )Sim (X)Não ( )Não Sei'
    else if (tbAnamneseAdP25NaoSei.Value) then
      lP25Sim.Caption := '( )Sim ( )Não (X)Não Sei'
    else
      lP25Sim.Caption := '( )Sim ( )Não ( )Não Sei';
    //Pergunta 26
    if (tbAnamneseAdP26Sim.Value) then
      lP26Sim.Caption := '(X)Sim ( )Não ( )Não Sei'
    else if (tbAnamneseAdP26Nao.Value) then
      lP26Sim.Caption := '( )Sim (X)Não ( )Não Sei'
    else if (tbAnamneseAdP26NaoSei.Value) then
      lP26Sim.Caption := '( )Sim ( )Não (X)Não Sei'
    else
      lP26Sim.Caption := '( )Sim ( )Não ( )Não Sei';
    //Pergunta 27
    if (tbAnamneseAdP27Sim.Value) then
      lP27Sim.Caption := '(X)Sim ( )Não ( )Não Sei'
    else if (tbAnamneseAdP27Nao.Value) then
      lP27Sim.Caption := '( )Sim (X)Não ( )Não Sei'
    else if (tbAnamneseAdP27NaoSei.Value) then
      lP27Sim.Caption := '( )Sim ( )Não (X)Não Sei'
    else
      lP27Sim.Caption := '( )Sim ( )Não ( )Não Sei';
    //Pergunta 28
    if (tbAnamneseAdP28Sim.Value) then
      lP28Sim.Caption := '(X)Sim ( )Não ( )Não Sei'
    else if (tbAnamneseAdP28Nao.Value) then
      lP28Sim.Caption := '( )Sim (X)Não ( )Não Sei'
    else if (tbAnamneseAdP28NaoSei.Value) then
      lP28Sim.Caption := '( )Sim ( )Não (X)Não Sei'
    else
      lP28Sim.Caption := '( )Sim ( )Não ( )Não Sei';
    //Pergunta 29
    if (tbAnamneseAdP29Sim.Value) then
      lP29Sim.Caption := '(X)Sim ( )Não ( )Não Sei'
    else if (tbAnamneseAdP29Nao.Value) then
      lP29Sim.Caption := '( )Sim (X)Não ( )Não Sei'
    else if (tbAnamneseAdP29NaoSei.Value) then
      lP29Sim.Caption := '( )Sim ( )Não (X)Não Sei'
    else
      lP29Sim.Caption := '( )Sim ( )Não ( )Não Sei';
    //Pergunta 30
    if (tbAnamneseAdConsulta.Value = 'C') then
      lPSimCon.Caption := 'Consulta';
    if (tbAnamneseAdConsulta.Value = 'E') then
      lPSimCon.Caption := 'Emergência';
    if (tbAnamneseAdConsulta.Value = 'T') then
      lPSimCon.Caption := 'Tratamento';
    end;
  qrAnamAd.Print;
  qrAnamAd.tbPaciente.Filtered := False;
  qrAnamAd.Free;
  qrAnamAd2 := TqrAnamAd2.Create(Application);
  qrAnamAd2.tbPaciente.Filtered := False;
  qrAnamAd2.tbPaciente.Filter   := '(PAC_CODIGO = '''+IntToStr(Paciente)+''')';
  qrAnamAd2.tbPaciente.Filtered := True;
  qrAnamAd2.tbPaciente.First;
  with qrAnamAd2 do
    begin
  if (tbAnamneseAdCompleto.Value) then
    lP30Sim.Caption := 'Completo';
  if (tbAnamneseAdImcompleto.Value) then
    lP30Sim.Caption := 'Incompleto';
  if (tbAnamneseAdRoerUnha.Value) then
    lP31Sim.Caption := 'X'
  else
    lP31Sim.Caption := '';
  if (tbAnamneseAdRepirar.Value) then
    lP32Sim.Caption := 'X'
  else
    lP32Sim.Caption := '';
  if (tbAnamneseAdTomar.Value) then
    lP33Sim.Caption := 'X'
  else
    lP33Sim.Caption := '';
  if (tbAnamneseAdChupar.Value) then
    lP34Sim.Caption := 'X'
  else
    lP34Sim.Caption := '';
  if (tbAnamneseAdMorder.Value) then
    lP35Sim.Caption := 'X'
  else
    lP35Sim.Caption := '';
  if (tbAnamneseAdRanger.Value) then
    lP36Sim.Caption := 'X'
  else
    lP36Sim.Caption := '';
  if (tbAnamneseAdOutros.Value) then
    lP37Sim.Caption := 'X'
  else
    lP37Sim.Caption := '';
  if (tbAnamneseAdFio.Value) then
    lP38Sim.Caption := 'X'
  else
    lP38Sim.Caption := '';
  if (tbAnamneseAdFio.Value) then
    lP39Sim.Caption := 'X'
  else
    lP39Sim.Caption := '';
  if (tbAnamneseAdEscova.Value) then
    lP40Sim.Caption := 'X'
  else
    lP40Sim.Caption := '';
  if (tbAnamneseAdUnitufo.Value) then
    lP41Sim.Caption := 'X'
  else
    lP41Sim.Caption := '';
  if (tbAnamneseAdPalito.Value) then
    lP42Sim.Caption := 'X'
  else
    lP42Sim.Caption := '';
  if (tbAnamneseAdCreme.Value) then
    lP43Sim.Caption := 'X'
  else
    lP43Sim.Caption := '';
  if (tbAnamneseAdFGel.Value) then
    lP44Sim.Caption := 'X'
  else
    lP44Sim.Caption := '';
  if (tbAnamneseAdFCreme.Value) then
    lP45Sim.Caption := 'X'
  else
    lP45Sim.Caption := '';
  if (tbAnamneseAdFBochecho.Value) then
    lP46Sim.Caption := 'X'
  else
    lP46Sim.Caption := '';
  if (tbAnamneseAdFAgua.Value) then
    lP47Sim.Caption := 'X'
  else
    lP47Sim.Caption := '';
  if (tbAnamneseAdDietaSim.Value) then
    lP48Sim.Caption := 'Sim';
  if (tbAnamneseAdDietaNao.Value) then
    lP48Sim.Caption := 'Não';
  Dia.Caption := IntToStr(Day(Date));
  Mes.Caption := MonthName(Date);
  Ano.Caption := IntToStr(Year(Date));
  end;
  qrAnamAd2.Print;
  qrAnamAd2.tbPaciente.Filtered := False;
  qrAnamAd2.Free;
end;

end.
