//////////////////////////////////////////////////////////////////////////
// Criacao...........: 08/2008
// Sistema...........: Atena - Automacao Clinica Odontologica
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit untAnamneseInf;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fcButton, fcImgBtn, DBCtrls, Mask, ToolEdit, RXDBCtrl, ExtCtrls,
  StdCtrls, JvScrollBox, ComCtrls, JvLabel, JvTransBtn, JvComponent, DB,
  JvEnterTab, fcLabel, fcpanel, EMsgDlg, RxLookup, JvPanel,
  JvTransparentPanel, ELibFnc;

type
  TfrmAnamneseInf = class(TForm)
    pnTop: TfcPanel;
    fcLabel1: TfcLabel;
    JvEnterAsTab1: TJvEnterAsTab;
    pnBotoes: TfcPanel;
    btnGravar: TJvTransparentButton;
    btnCancelar: TJvTransparentButton;
    btnAlterar: TJvTransparentButton;
    btnDeletar: TJvTransparentButton;
    btnSair: TJvTransparentButton;
    btnLembrete: TJvTransparentButton;
    pnCentro: TfcPanel;
    JvLabel34: TJvLabel;
    pgAnamInf: TPageControl;
    TabSheet1: TTabSheet;
    JvScrollBox1: TJvScrollBox;
    JvLabel1: TJvLabel;
    JvLabel3: TJvLabel;
    JvLabel4: TJvLabel;
    JvLabel5: TJvLabel;
    JvLabel6: TJvLabel;
    JvLabel7: TJvLabel;
    chBi: TDBCheckBox;
    chTi: TDBCheckBox;
    chCal: TDBCheckBox;
    ch4S: TDBCheckBox;
    ch4N: TDBCheckBox;
    perg1: TDBMemo;
    perg2: TDBMemo;
    perg5: TDBMemo;
    perg6: TDBMemo;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    TabSheet5: TTabSheet;
    TabSheet6: TTabSheet;
    chAn: TDBCheckBox;
    chEx: TDBCheckBox;
    chMa: TDBCheckBox;
    chMe: TDBCheckBox;
    chMi: TDBCheckBox;
    chDe: TDBCheckBox;
    chAg: TDBCheckBox;
    chIn: TDBCheckBox;
    chAgi: TDBCheckBox;
    perg4: TDBMemo;
    JvScrollBox2: TJvScrollBox;
    JvLabel2: TJvLabel;
    JvLabel8: TJvLabel;
    JvLabel9: TJvLabel;
    JvLabel10: TJvLabel;
    JvLabel11: TJvLabel;
    pergHist1: TDBMemo;
    pergHist2: TDBMemo;
    pergHist5: TDBMemo;
    DBMemo5: TDBMemo;
    pergHist3: TDBMemo;
    JvLabel13: TJvLabel;
    pergHist6: TDBMemo;
    JvLabel12: TJvLabel;
    JvLabel14: TJvLabel;
    ch7Med: TDBCheckBox;
    ch7Ali: TDBCheckBox;
    ch7An: TDBCheckBox;
    ch7Pi: TDBCheckBox;
    pergHist8: TDBMemo;
    JvLabel15: TJvLabel;
    pergHist9: TDBMemo;
    JvLabel16: TJvLabel;
    pergHist10: TDBMemo;
    JvLabel17: TJvLabel;
    pergHist11: TDBMemo;
    JvLabel18: TJvLabel;
    pergHist12: TDBMemo;
    JvScrollBox3: TJvScrollBox;
    JvLabel19: TJvLabel;
    JvLabel20: TJvLabel;
    JvLabel21: TJvLabel;
    JvLabel22: TJvLabel;
    JvLabel23: TJvLabel;
    JvLabel24: TJvLabel;
    JvLabel25: TJvLabel;
    JvLabel27: TJvLabel;
    JvLabel28: TJvLabel;
    JvLabel29: TJvLabel;
    JvLabel30: TJvLabel;
    pergHab1: TDBMemo;
    pergHab2: TDBMemo;
    pergHab5: TDBMemo;
    pergHab4: TDBMemo;
    pergHab3: TDBMemo;
    pergHab6: TDBMemo;
    pergHab7: TDBMemo;
    pergHab8: TDBMemo;
    pergHab9: TDBMemo;
    pergHab10: TDBMemo;
    pergHab11: TDBMemo;
    JvLabel31: TJvLabel;
    pergHab12: TDBMemo;
    JvLabel32: TJvLabel;
    pergHab13: TDBMemo;
    JvScrollBox4: TJvScrollBox;
    JvLabel26: TJvLabel;
    JvLabel33: TJvLabel;
    JvLabel35: TJvLabel;
    JvLabel36: TJvLabel;
    JvLabel37: TJvLabel;
    JvLabel38: TJvLabel;
    JvLabel39: TJvLabel;
    pergMet1: TDBMemo;
    pergMet2: TDBMemo;
    pergMet5: TDBMemo;
    pergMet4: TDBMemo;
    pergMet3: TDBMemo;
    pergMet6: TDBMemo;
    pergMet7: TDBMemo;
    JvScrollBox5: TJvScrollBox;
    JvLabel40: TJvLabel;
    JvLabel41: TJvLabel;
    JvLabel42: TJvLabel;
    JvLabel43: TJvLabel;
    JvLabel44: TJvLabel;
    JvLabel45: TJvLabel;
    pergAv1: TDBMemo;
    pergAv2: TDBMemo;
    pergAv5: TDBMemo;
    Bevel1: TBevel;
    ch3Sup: TDBCheckBox;
    ch3Inf: TDBCheckBox;
    ch4Sup: TDBCheckBox;
    ch4Inf: TDBCheckBox;
    JvLabel47: TJvLabel;
    pergAv6: TDBMemo;
    JvLabel48: TJvLabel;
    Bevel2: TBevel;
    JvLabel49: TJvLabel;
    pergAv7: TDBMemo;
    JvLabel50: TJvLabel;
    pergAv8: TDBMemo;
    JvLabel51: TJvLabel;
    ch9Di: TDBCheckBox;
    ch9Es: TDBCheckBox;
    JvLabel52: TJvLabel;
    pergAv9: TDBMemo;
    JvLabel53: TJvLabel;
    pergAv10: TDBMemo;
    MsgDlg: TEvMsgDlg;
    cmbLkPac: TRxDBLookupCombo;
    JvTransparentPanel1: TJvTransparentPanel;
    EvLibFunctions1: TEvLibFunctions;
    JvTransparentPanel2: TJvTransparentPanel;
    btnImprimir: TJvTransparentButton;
    procedure btnSairClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnDeletarClick(Sender: TObject);
    procedure btnLembreteClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure perg6Exit(Sender: TObject);
    procedure pergHist12Exit(Sender: TObject);
    procedure pergHab13Exit(Sender: TObject);
    procedure pergMet7Exit(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
  private
    { Private declarations }
    fPaciente : Integer;
  public
    { Public declarations }
    property Paciente : Integer read fPaciente write fPaciente;
  end;

var
  frmAnamneseInf: TfrmAnamneseInf;
  NovoItem      : Boolean        ;
  BotaoNovo     : Boolean        ;

implementation

uses untdmDados, untLembrete, untPrincipal, untQRAnamInf, untQRAnamInf2,
  untqrAnamAd2, untQRAnamAd;

{$R *.dfm}

procedure TfrmAnamneseInf.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmAnamneseInf.btnGravarClick(Sender: TObject);
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
    dmdados.tbAnamneseInf.Post;
    dmDados.vTabStt := True;
    // Ajusta Bot�es
    btnGravar.Enabled   := False;
    btnCancelar.Enabled := False;
    btnLembrete.Enabled := False;
    btnAlterar.Enabled  := True ;
    btndeletar.Enabled  := True ;
    // Desabilitando os Componentes
    cmbLkPac.Enabled    := False;
    pgAnamInf.Enabled   := False;
    MsgDlg.MsgInformation('Dados gravados com sucesso!');
    dmDados.tbAnamneseInf.Refresh;
    pgAnamInf.ActivePage := TabSheet1;
    pnBotoes.SetFocus;
    end
  else
    if (Vazio) then
      begin
      MsgDlg.MsgWarning('O(s) Campo(s) '+Campos+' n�o tem Valor(es) ');
      cmbLkPac.Enabled := True;
      cmbLkPac.SetFocus;
      end;
end;

procedure TfrmAnamneseInf.btnCancelarClick(Sender: TObject);
begin
  dmDados.tbAnamneseInf.cancel;
  NovoItem            := False;
  dmDados.vTabStt     := True ;
  BtnGravar.Enabled   := False;
  BtnCancelar.Enabled := False;
  btnLembrete.Enabled := False;
  BtnAlterar.Enabled  := True ;
  BtnDeletar.Enabled  := True ;
  {desabilitando os componentes}
  cmbLkPac.Enabled     := False;
  pgAnamInf.Enabled    := False;
  pgAnamInf.ActivePage := TabSheet1;
  pnBotoes.setfocus;
end;

procedure TfrmAnamneseInf.btnAlterarClick(Sender: TObject);
begin
  if dmdados.tbAnamneseInf.RecordCount = 0 then
    begin
    MsgDlg.MsgInformation('Tabela sem registro');
    end
  else
    begin
    dmDados.tbAnamneseInf.Edit;
    NovoItem            := True ;
    dmDados.vTabStt     := False;
    BtnCancelar.enabled := True ;
    BtnGravar.Enabled   := True ;
    btnLembrete.Enabled := True ;
    BtnAlterar.Enabled  := False;
    Btndeletar.Enabled  := False;
    {habilitando os componentes}
    cmbLkPac.Enabled     := True;
    pgAnamInf.Enabled    := true;
    pgAnamInf.ActivePage := TabSheet1;
    cmbLkPac.setfocus;
    end;
end;

procedure TfrmAnamneseInf.btnDeletarClick(Sender: TObject);
begin
  if (dmDados.tbAnamneseInf.RecordCount = 0) then
    MsgDlg.MsgError('Tabela vazia')
  else
    if (MsgDlg.MsgConfirmation('Tem certeza que deseja excluir este registro?') = id_yes) then
      dmDados.tbAnamneseInf.Delete;
end;

procedure TfrmAnamneseInf.btnLembreteClick(Sender: TObject);
begin
  FrmLembrete:=TFrmLembrete.create(application);
  FrmLembrete.ShowModal;
end;

procedure TfrmAnamneseInf.FormActivate(Sender: TObject);
begin
  frmPrincipal.StatusTeclas(True,' [Insert] Novo [Home] Alterar [End] Gravar [Delete] Excluir [F2] Lembrete [Esc] Cancelar ou Sair');
end;

procedure TfrmAnamneseInf.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  frmPrincipal.StatusTeclas(False,'');
  Action := CaFree;
end;

procedure TfrmAnamneseInf.FormCreate(Sender: TObject);
begin
  Paciente := 0;
end;

procedure TfrmAnamneseInf.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case (key) of
    // Teclas de a��o na tabela
    VK_Home   : if (dmDados.vTabStt) then btnAlterar.Click;
    VK_Delete : if (dmDados.vTabStt) then btnDeletar.Click;
    VK_End    : if not(dmDados.vTabStt) then btnGravar.Click;
    VK_ESCAPE : if not(dmDados.vTabStt) then btnCancelar.Click
                else btnSair.Click;
    VK_F2     : btnLembrete.Click;
  end;
end;

procedure TfrmAnamneseInf.FormShow(Sender: TObject);
Var
  Cont : Integer;
begin
  dmDados.vTabStt := True;
  if (dmDados.tbAnamneseInf.State = dsInactive) then
    dmDados.tbAnamneseInf.Open;
  if (dmDados.tbPaciente.State    = dsInactive) then
    dmDados.tbPaciente.Open;
  if (Paciente <> 0) then
    if not(dmDados.tbAnamneseInf.Locate('CodPac',Paciente,[])) then
      begin
      dmdados.tbAnamneseInf.Append;
      NovoItem             := True ;
      dmDados.vTabStt      := False;
      for cont:=0 to Componentcount-1 do
        if (Components[cont] is TDBCheckBox) then
          TDBCheckBox(Components[Cont]).Checked := False;
      dmDados.tbAnamneseInf.Edit;
      if (Paciente <> 0) then
        dmDados.tbAnamneseInfCodPac.Value := Paciente;
      {habilitando os bot�es}
      btnGravar.Enabled    := True ;
      btnCancelar.Enabled  := True ;
      btnLembrete.Enabled  := True ;
      btnAlterar.Enabled   := False;
      btnDeletar.Enabled   := False;
      {habilitando os componentes}
      cmbLkPac.Enabled   := True;
      pgAnamInf.Enabled  := True;
      perg1.setfocus;
      end
    else
      dmDados.tbAnamneseInf.Edit;
end;

procedure TfrmAnamneseInf.perg6Exit(Sender: TObject);
begin
  pgAnamInf.ActivePage := TabSheet2;
end;

procedure TfrmAnamneseInf.pergHist12Exit(Sender: TObject);
begin
  pgAnamInf.ActivePage := TabSheet3;
end;

procedure TfrmAnamneseInf.pergHab13Exit(Sender: TObject);
begin
  pgAnamInf.ActivePage := TabSheet5;
end;

procedure TfrmAnamneseInf.pergMet7Exit(Sender: TObject);
begin
  pgAnamInf.ActivePage := TabSheet6;
end;

procedure TfrmAnamneseInf.btnImprimirClick(Sender: TObject);
begin
  qrAnamInf := TqrAnamInf.Create(Application);
  qrAnamInf.tbPaciente.Filtered := False;
  qrAnamInf.tbPaciente.Filter   := '(PAC_CODIGO = '''+IntToStr(Paciente)+''')';
  qrAnamInf.tbPaciente.Filtered := True;
  qrAnamInf.tbPaciente.First;
  with qrAnamInf do
    begin
    //Pergunta 3
    if (tbAnamneseInfP3Bi.Value) then
      lP3bSim.Caption := 'X'
    else
      lP3bSim.Caption := '';
    if (tbAnamneseInfP3Ti.Value) then
      lP3tSim.Caption := 'X'
    else
      lP3tSim.Caption := '';
    if (tbAnamneseInfP3Cal.Value) then
      lP3cSim.Caption := 'X'
    else
      lP3cSim.Caption := '';
    if (tbAnamneseInfP3An.Value) then
      lP3aSim.Caption := 'X'
    else
      lP3aSim.Caption := '';
    if (tbAnamneseInfP3Ex.Value) then
      lP3eSim.Caption := 'X'
    else
      lP3eSim.Caption := '';
    if (tbAnamneseInfP3Ma.Value) then
      lP3mSim.Caption := 'X'
    else
      lP3mSim.Caption := '';
    if (tbAnamneseInfP3Me.Value) then
      lP3meSim.Caption := 'X'
    else
      lP3meSim.Caption := '';
    if (tbAnamneseInfP3Mi.Value) then
      lP3miSim.Caption := 'X'
    else
      lP3miSim.Caption := '';
    if (tbAnamneseInfP3Des.Value) then
      lP3deSim.Caption := 'X'
    else
      lP3deSim.Caption := '';
    if (tbAnamneseInfP3Agr.Value) then
      lP3agrSim.Caption := 'X'
    else
      lP3agrSim.Caption := '';
    if (tbAnamneseInfP3Ins.Value) then
      lP3inSim.Caption := 'X'
    else
      lP3inSim.Caption := '';
    if (tbAnamneseInfP3Agi.Value) then
      lP3agiSim.Caption := 'X'
    else
      lP3agiSim.Caption := '';
    //Pergunta 4
    if (tbAnamneseInfP4Sim.Value) then
      lP4Sim.Caption := '(X)Sim ( )N�o'
    else if (tbAnamneseInfP4Nao.Value) then
      lP4Sim.Caption := '( )Sim (X)N�o'
    else
      lP4Sim.Caption := '( )Sim ( )N�o';
    //Pergunta 7 (Hist�ria M�dica)
    if (tbAnamneseInfP7HistMed.Value) then
      lPmedSim.Caption := 'X'
    else
      lPmedSim.Caption := '';
    if (tbAnamneseInfP7HIstAli.Value) then
      lPaliSim.Caption := 'X'
    else
      lPaliSim.Caption := '';
    if (tbAnamneseInfP7HistPi.Value) then
      lPpiSim.Caption := 'X'
    else
      lPpiSim.Caption := '';
    if (tbAnamneseInfP7HistAn.Value) then
      lPaneSim.Caption := 'X'
    else
      lPaneSim.Caption := '';
    end;
  qrAnamInf.Print;
  qrAnamInf.tbPaciente.Filtered := False;
  qrAnamInf.Free;
  qrAnamInf2 := TqrAnamInf2.Create(Application);
  qrAnamInf2.tbPaciente.Filtered := False;
  qrAnamInf2.tbPaciente.Filter   := '(PAC_CODIGO = '''+IntToStr(Paciente)+''')';
  qrAnamInf2.tbPaciente.Filtered := True;
  qrAnamInf2.tbPaciente.First;
  with qrAnamInf2 do
    begin
    //Pergunta 3(Avalia��o)
    if (tbAnamneseInfP3AvSup.Value) then
      lP39Sim.Caption := '(X)Sup ( )Inf'
    else if (tbAnamneseInfP3AvInf.Value) then
      lP39Sim.Caption := '( )Sup (X)Inf'
    else
      lP39Sim.Caption := '( )Sup ( )Inf';
    //Pergunta 4(Avalia��o)
    if (tbAnamneseInfP4AvSup.Value) then
      lP40Sim.Caption := '(X)Sup ( )Inf'
    else if (tbAnamneseInfP4AvInf.Value) then
      lP40Sim.Caption := '( )Sup (X)Inf'
    else
      lP40Sim.Caption := '( )Sup ( )Inf';
    //Pergunta 9(Avalia��o)
    if (tbAnamneseInfP9AvDi.Value) then
      lP45Sim.Caption := '(X)Dir ( )Esq'
    else if (tbAnamneseInfP4AvInf.Value) then
      lP45Sim.Caption := '( )Dir (X)Esq'
    else
      lP45Sim.Caption := '( )Dir ( )Esq';
  Dia.Caption := IntToStr(Day(Date));
  Mes.Caption := MonthName(Date);
  Ano.Caption := IntToStr(Year(Date));
  end;
  qrAnamInf2.Print;
  qrAnamInf2.tbPaciente.Filtered := False;
  qrAnamInf2.Free;
end;

end.
