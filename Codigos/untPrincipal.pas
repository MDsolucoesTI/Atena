//////////////////////////////////////////////////////////////////////////
// Criacao...........: 08/2008
// Sistema...........: Atena - Automacao Clinica Odontologica
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit untPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, JvComponent, JvTransBtn, ExtCtrls, fcpanel, ComCtrls, WinSkinData,
  Menus, EHintBal, jpeg, ELibFnc, EWall, fcImager, ImgList, EAppProt,
  ExtDlgs, EUserAcs, EPaswd, DB, DBTables, EMsgDlg, ECripto;

type
  TfrmPrincipal = class(TForm)
    fcPanel1: TfcPanel;
    btnCadPac: TJvTransparentButton;
    fcPanel2: TfcPanel;
    StatusBar1: TStatusBar;
    MainMenu1: TMainMenu;
    Arquivo1: TMenuItem;
    Clientes1: TMenuItem;
    Funcionrio2: TMenuItem;
    Cargo1: TMenuItem;
    Cadastro1: TMenuItem;
    Fornecedor1: TMenuItem;
    Sair1: TMenuItem;
    Estoque2: TMenuItem;
    Grupo1: TMenuItem;
    SubGrupo1: TMenuItem;
    Unidade1: TMenuItem;
    Marca1: TMenuItem;
    N2: TMenuItem;
    Produto1: TMenuItem;
    Cadastro2: TMenuItem;
    Entrada1: TMenuItem;
    Sada1: TMenuItem;
    artemis1: TMenuItem;
    Cadastros1: TMenuItem;
    Histrico1: TMenuItem;
    ipodeDocumento1: TMenuItem;
    CartesConvnios1: TMenuItem;
    Bancos1: TMenuItem;
    ContaCorrente1: TMenuItem;
    Financeiro1: TMenuItem;
    ContasaPagar1: TMenuItem;
    Lanamento1: TMenuItem;
    RecebimentodeContas1: TMenuItem;
    CancelamentodeContas1: TMenuItem;
    ContasaReceber1: TMenuItem;
    Lanamento2: TMenuItem;
    RecebimentodeContas2: TMenuItem;
    CancelamentodeContas2: TMenuItem;
    CaixaBanco1: TMenuItem;
    Lanamento3: TMenuItem;
    Fechamento1: TMenuItem;
    N3: TMenuItem;
    ControleBancrio1: TMenuItem;
    Lanamento4: TMenuItem;
    Fechamento2: TMenuItem;
    ransferncia1: TMenuItem;
    N5: TMenuItem;
    Extratos1: TMenuItem;
    Saldos1: TMenuItem;
    SaldoConsolidado1: TMenuItem;
    ChequesRecebidos1: TMenuItem;
    Lanamento5: TMenuItem;
    Baixa1: TMenuItem;
    ChequesemFundos1: TMenuItem;
    RenegociarCheques1: TMenuItem;
    Consultar1: TMenuItem;
    Relatrio1: TMenuItem;
    Cliente1: TMenuItem;
    FichaCadastral1: TMenuItem;
    Aniversariantes1: TMenuItem;
    Funcionrio3: TMenuItem;
    Fornecedor2: TMenuItem;
    N6: TMenuItem;
    Estoque1: TMenuItem;
    Mercadoria1: TMenuItem;
    FornecedoreporPerodo1: TMenuItem;
    Compra1: TMenuItem;
    N7: TMenuItem;
    Caixa1: TMenuItem;
    otaldeEntradas1: TMenuItem;
    otaldeSadas1: TMenuItem;
    LanamentonoCaixa1: TMenuItem;
    ChequesRecebidos2: TMenuItem;
    ContasaPagar2: TMenuItem;
    ContasaReceber2: TMenuItem;
    BalanoFinanceiro1: TMenuItem;
    SaldoseExtratos1: TMenuItem;
    Utilitrios1: TMenuItem;
    OpesdoSistema1: TMenuItem;
    MudarAparncia1: TMenuItem;
    Senhas1: TMenuItem;
    MudarUsurio1: TMenuItem;
    N1: TMenuItem;
    Backup1: TMenuItem;
    Calculadora1: TMenuItem;
    Ajuda1: TMenuItem;
    MenuItem5: TMenuItem;
    EnviesuaDvidapeloEmail1: TMenuItem;
    SobreoEROS1: TMenuItem;
    N8: TMenuItem;
    sd1: TSkinData;
    Agenda1: TMenuItem;
    Agenda2: TMenuItem;
    AgendaTelefnica1: TMenuItem;
    AgendadoDentista1: TMenuItem;
    ResumodaAgenda1: TMenuItem;
    N9: TMenuItem;
    SaladeEspera1: TMenuItem;
    ListadeEspera1: TMenuItem;
    N10: TMenuItem;
    Estatstica1: TMenuItem;
    Especialidades1: TMenuItem;
    Dentstica1: TMenuItem;
    Prtese1: TMenuItem;
    Endodontia1: TMenuItem;
    Periodontia1: TMenuItem;
    Odontopediatria1: TMenuItem;
    Cirurgia1: TMenuItem;
    Implantodontia1: TMenuItem;
    Preveno1: TMenuItem;
    EvHintBalloon1: TEvHintBalloon;
    btnOdonto: TJvTransparentButton;
    CirurgioDentista1: TMenuItem;
    Convnios1: TMenuItem;
    Protticos1: TMenuItem;
    N11: TMenuItem;
    EnviarMensagem1: TMenuItem;
    N12: TMenuItem;
    Calendrio1: TMenuItem;
    Medicamentos1: TMenuItem;
    btnCadConv: TJvTransparentButton;
    abelas1: TMenuItem;
    N13: TMenuItem;
    ipos1: TMenuItem;
    Uso1: TMenuItem;
    Cidade1: TMenuItem;
    iposdeAtendimento1: TMenuItem;
    Procedimentos1: TMenuItem;
    Cadastro5: TMenuItem;
    Exames1: TMenuItem;
    Grupos1: TMenuItem;
    Cadastro3: TMenuItem;
    EditordeTextos1: TMenuItem;
    EmTratamento1: TMenuItem;
    Agenda3: TMenuItem;
    Recibos1: TMenuItem;
    Promissrias1: TMenuItem;
    N15: TMenuItem;
    ChequesEmitidos2: TMenuItem;
    N14: TMenuItem;
    ContaCorrentedoPaciente1: TMenuItem;
    ChequesEmitidos3: TMenuItem;
    Receiturio1: TMenuItem;
    N16: TMenuItem;
    Atestados1: TMenuItem;
    Convnios2: TMenuItem;
    Faturamento1: TMenuItem;
    DadosCadastrais1: TMenuItem;
    Protticos2: TMenuItem;
    DadosCadastrais2: TMenuItem;
    Servios1: TMenuItem;
    ndicesFinanceiros1: TMenuItem;
    Configuraes1: TMenuItem;
    btnOrcamento: TJvTransparentButton;
    btnAgenda: TJvTransparentButton;
    btnAgTel: TJvTransparentButton;
    btnSair: TJvTransparentButton;
    btnCR: TJvTransparentButton;
    btnCP: TJvTransparentButton;
    btnBackup: TJvTransparentButton;
    btnAjuda: TJvTransparentButton;
    N17: TMenuItem;
    Anamnese2: TMenuItem;
    Histrico2: TMenuItem;
    SolicitaodeExames1: TMenuItem;
    Encaminhamento1: TMenuItem;
    Funcoes: TEvLibFunctions;
    PlanosdePagamento1: TMenuItem;
    CartesdeConsulta1: TMenuItem;
    CarteirinhadoConsultrio2: TMenuItem;
    ConfigurarCabealhoeRodap1: TMenuItem;
    ConfigurarFichadeAnamnese1: TMenuItem;
    Compra2: TMenuItem;
    EvAppProtect1: TEvAppProtect;
    Opd1: TOpenPictureDialog;
    imgBarra: TImageList;
    Ortodontia1: TMenuItem;
    EvPassword1: TEvPassword;
    MsgDlg: TEvMsgDlg;
    evCripto: TEvCriptografa;
    UserAcess: TEvUserAccess;
    Table1: TTable;
    Table1Usuario: TStringField;
    Table1Senha: TStringField;
    Table1TipoAcesso: TStringField;
    UsuriodoSistema1: TMenuItem;
    ChequesemAberto1: TMenuItem;
    ChequesDevolvidos1: TMenuItem;
    ChequesDevolvidosporCliente1: TMenuItem;
    Atena: TImage;
    procedure StatusTeclas(vAcao:boolean;vTeclas:string);
    Function  CalcIdade(D1,D2:TDateTime):string;
    procedure btnSairClick(Sender: TObject);
    procedure btnCadPacClick(Sender: TObject);
    procedure btnOdontoClick(Sender: TObject);
    procedure btnCadRapClick(Sender: TObject);
    procedure Cargo1Click(Sender: TObject);
    procedure Cadastro1Click(Sender: TObject);
    procedure Fornecedor1Click(Sender: TObject);
    procedure CirurgioDentista1Click(Sender: TObject);
    procedure Sair1Click(Sender: TObject);
    procedure Clientes1Click(Sender: TObject);
    procedure AgendadoDentista1Click(Sender: TObject);
    procedure Convnios1Click(Sender: TObject);
    procedure Protticos1Click(Sender: TObject);
    procedure ListadeEspera1Click(Sender: TObject);
    procedure SaladeEspera1Click(Sender: TObject);
    procedure ResumodaAgenda1Click(Sender: TObject);
    procedure AgendaTelefnica1Click(Sender: TObject);
    procedure btnAgTelClick(Sender: TObject);
    procedure Agenda2Click(Sender: TObject);
    procedure btnAgendaClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ipos1Click(Sender: TObject);
    procedure Uso1Click(Sender: TObject);
    procedure Cadastro5Click(Sender: TObject);
    procedure iposdeAtendimento1Click(Sender: TObject);
    procedure Grupos1Click(Sender: TObject);
    procedure Cadastro3Click(Sender: TObject);
    procedure btnCadConvClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure Grupo1Click(Sender: TObject);
    procedure SubGrupo1Click(Sender: TObject);
    procedure Unidade1Click(Sender: TObject);
    procedure Marca1Click(Sender: TObject);
    procedure Cadastro2Click(Sender: TObject);
    procedure Entrada1Click(Sender: TObject);
    procedure Sada1Click(Sender: TObject);
    procedure Estatstica1Click(Sender: TObject);
    procedure ControlePatrimonial1Click(Sender: TObject);
    procedure Compra2Click(Sender: TObject);
    procedure Histrico1Click(Sender: TObject);
    procedure ipodeDocumento1Click(Sender: TObject);
    procedure Bancos1Click(Sender: TObject);
    procedure ContaCorrente1Click(Sender: TObject);
    procedure Cidade1Click(Sender: TObject);
    procedure CartesConvnios1Click(Sender: TObject);
    procedure ndicesFinanceiros1Click(Sender: TObject);
    procedure PlanosdePagamento1Click(Sender: TObject);
    procedure Lanamento1Click(Sender: TObject);
    procedure RecebimentodeContas1Click(Sender: TObject);
    procedure Lanamento2Click(Sender: TObject);
    procedure RecebimentodeContas2Click(Sender: TObject);
    procedure CancelamentodeContas1Click(Sender: TObject);
    procedure CancelamentodeContas2Click(Sender: TObject);
    procedure Configurao1Click(Sender: TObject);
    procedure MudarAparncia1Click(Sender: TObject);
    procedure FichaCadastral1Click(Sender: TObject);
    procedure Funcionrio3Click(Sender: TObject);
    procedure Fornecedor2Click(Sender: TObject);
    procedure DadosCadastrais2Click(Sender: TObject);
    procedure Aniversariantes1Click(Sender: TObject);
    procedure EvPassword1AfterInput(Sender: TObject);
    procedure EvPassword1BeforeInput(Sender: TObject);
    procedure EvPassword1Error(Sender: TObject; Error: TEvPasswordError);
    procedure EvPassword1Validate(Sender: TObject; UserName,
      Password: String; var Valid: Boolean);
    procedure btnCRClick(Sender: TObject);
    procedure btnCPClick(Sender: TObject);
    procedure UsuriodoSistema1Click(Sender: TObject);
    procedure MudarUsurio1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Lanamento5Click(Sender: TObject);
    procedure Baixa1Click(Sender: TObject);
    procedure ChequesemFundos1Click(Sender: TObject);
    procedure RenegociarCheques1Click(Sender: TObject);
    procedure Consultar1Click(Sender: TObject);
    procedure ChequesemAberto1Click(Sender: TObject);
    procedure ChequesDevolvidos1Click(Sender: TObject);
    procedure ChequesDevolvidosporCliente1Click(Sender: TObject);
    procedure ContasaReceber2Click(Sender: TObject);
    procedure Lanamento4Click(Sender: TObject);
    procedure Fechamento2Click(Sender: TObject);
    procedure SaldoseExtratos1Click(Sender: TObject);
    procedure ContasaPagar2Click(Sender: TObject);
    procedure Mercadoria1Click(Sender: TObject);
    procedure FornecedoreporPerodo1Click(Sender: TObject);
    procedure Compra1Click(Sender: TObject);
    procedure Procedimentos1Click(Sender: TObject);
  private
    { Private declarations }
    fAcesso : integer;
    fUser : string;
  public
    { Public declarations }
    property Acesso : integer read fAcesso write fAcesso;
    property User : string read fUser write fUser;    
  end;

var
  frmPrincipal : TfrmPrincipal         ;
  ListaTeclas  : String                ;
  PilhaTeclas  : array[1..10] of string;
  Topo         : integer               ;
  Acao         : boolean               ;

implementation

uses untCadPac, untOdontograma, untCadRapid,
     untCargos, untCadFunc, untCadFornec, untCadDentista, untAgDent, untCadConv,
     untCadProtetico, untListaEspera, untSalaEspera, untAgendaTel, untResAgenda,
     untAgenda, untCadMedicamento, untCadTipoMed, untCadUsoMed, untCadTipoAtend,
     untCadCidade, untCadGrupoEx, untCadExames, untdmDados,      untCadSubGrupo, untCadUnidade, untCadMarca, untCadMaterial, untEntMat,
     untSaidaMat, untEstatistica, untEquipo, untCadCompra, untCadTipoDoc,
     untCadBanco, untCadHistorico, untCadCCorrente, untCadCartao, untCadIndice,
     untCadPlanoPagto, untCPagar, untBaixaLoteCP, untBaixaLoteCR, untCancelCP,
     untCancelCR, untConfigAnamnese, SkinGraphic, untRelPac, untRelFunc,
     untRelFornec, untRelProtetico, untQRPaciente, untAnamneseAd, untAnamneseInf,
     untCadSenha, unitCreceber, unitLanCheque, unitBaixaCheque, unitLanChequeSF,
     unitRenCheque, unitConsultaCPF, unitRelCheAberto, untRelCheDev, untRelCheDevCli,
     UnitRelCReceber, UnitMovCaixa, UnitFechCC, unitRelMovConta, unitRelCpagar,
     untRelEstoque, untRelCompPer, untRelCompras, untCadProced, untAnive,
  untCadGrupo;

{$R *.dfm}

procedure TfrmPrincipal.StatusTeclas(vAcao:boolean;vTeclas:string);
begin
  if vAcao then
    begin
    Topo:=Topo + 1;
    if Topo > 0 Then
      PilhaTeclas[Topo]:=StatusBar1.Panels[0].Text;
    StatusBar1.Panels[0].Text:=vTeclas;
    end
  else
    begin
    StatusBar1.Panels[0].Text:=PilhaTeclas[Topo];
    Topo:=Topo-1;
    end;
end;                                            

Function TfrmPrincipal.CalcIdade(D1,D2:TDateTime):string;
var
  Anos     : integer;
  Meses    : integer;
  Dias     : integer;
  Sobra    : integer;
begin
  Dias  := DaysBetween(D1,D2);
  Anos  := Dias div 365      ;
  Sobra := Dias mod 365      ;
  Meses := Sobra div 30      ;
  Dias  := Sobra mod 30      ;
  CalcIdade := IntToStr(Anos)+' a '+IntToStr(Meses)+' m ';
end;

procedure TfrmPrincipal.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmPrincipal.btnCadPacClick(Sender: TObject);
begin
  frmCadPac := TfrmCadPac.create(application);
  frmCadPac.ShowModal;
end;

procedure TfrmPrincipal.btnOdontoClick(Sender: TObject);
begin
  frmOdontograma := TfrmOdontograma.create(application);
  frmOdontograma.ShowModal;
end;

procedure TfrmPrincipal.btnCadRapClick(Sender: TObject);
begin
  frmCadRapid := TfrmCadRapid.create(application);
  frmCadRapid.ShowModal;
end;

procedure TfrmPrincipal.Cargo1Click(Sender: TObject);
begin
  frmCargos := TfrmCargos.create(application);
  frmCargos.ShowModal;
end;

procedure TfrmPrincipal.Cadastro1Click(Sender: TObject);
begin
  frmCadFunc := TfrmCadFunc.create(application);
  frmCadFunc.ShowModal;
end;

procedure TfrmPrincipal.Fornecedor1Click(Sender: TObject);
begin
  frmCadFornec := TfrmCadFornec.create(application);
  frmCadFornec.ShowModal;
end;

procedure TfrmPrincipal.CirurgioDentista1Click(Sender: TObject);
begin
  frmCadDentista := TfrmCadDentista.create(application);
  frmCadDentista.ShowModal;
end;

procedure TfrmPrincipal.Sair1Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmPrincipal.Clientes1Click(Sender: TObject);
begin
  frmCadPac := TfrmCadPac.create(application);
  frmCadPac.ShowModal;
end;

procedure TfrmPrincipal.AgendadoDentista1Click(Sender: TObject);
begin
  frmAgDent := TfrmAgDent.create(application);
  frmAgDent.ShowModal;
end;

procedure TfrmPrincipal.Convnios1Click(Sender: TObject);
begin
  frmCadConv := TfrmCadConv.create(application);
  frmCadConv.ShowModal;
end;

procedure TfrmPrincipal.Protticos1Click(Sender: TObject);
begin
  frmCadProtetico := TfrmCadProtetico.create(application);
  frmCadProtetico.ShowModal;
end;

procedure TfrmPrincipal.ListadeEspera1Click(Sender: TObject);
begin
  frmListaEspera := TfrmListaEspera.create(application);
  frmListaEspera.ShowModal;
end;

procedure TfrmPrincipal.SaladeEspera1Click(Sender: TObject);
begin
  frmSalaEspera := TfrmSalaEspera.create(application);
  frmSalaEspera.ShowModal;
end;

procedure TfrmPrincipal.ResumodaAgenda1Click(Sender: TObject);
begin
  frmResAgenda := TfrmResAgenda.create(application);
  frmResAgenda.ShowModal;
end;

procedure TfrmPrincipal.AgendaTelefnica1Click(Sender: TObject);
begin
  {frmAgendaTel := TfrmAgendaTel.create(application);
  frmAgendaTel.ShowModal;  }
end;

procedure TfrmPrincipal.btnAgTelClick(Sender: TObject);
begin
  frmAgendaTel := TfrmAgendaTel.create(application);
  frmAgendaTel.ShowModal;
end;

procedure TfrmPrincipal.Agenda2Click(Sender: TObject);
begin
  frmAgenda:=TfrmAgenda.create(application);
  frmAgenda.ShowModal;
end;

procedure TfrmPrincipal.btnAgendaClick(Sender: TObject);
begin
  frmAgenda := TfrmAgenda.create(application);
  frmAgenda.ShowModal;
end;

procedure TfrmPrincipal.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case (key) of
    // Teclas de navega��o
    VK_F2     : btnCadPac.Click  ;
    VK_F3     : btnCadConv.Click ;
    VK_F4     : btnAgenda.Click  ;
    VK_F6     : btnOdonto.Click  ;
    VK_ESCAPE : close            ;
  end;
end;

procedure TfrmPrincipal.ipos1Click(Sender: TObject);
begin
  frmCadTipoMed := TfrmCadTipoMed.create(application);
  frmCadTipoMed.ShowModal;
end;

procedure TfrmPrincipal.Uso1Click(Sender: TObject);
begin
  frmCadUsoMed := TfrmCadUsoMed.create(application);
  frmCadUsoMed.ShowModal;
end;

procedure TfrmPrincipal.Cadastro5Click(Sender: TObject);
begin
  frmCadMedicamento := TfrmCadMedicamento.create(application);
  frmCadMedicamento.ShowModal;
end;

procedure TfrmPrincipal.iposdeAtendimento1Click(Sender: TObject);
begin
  frmCadTipoAtend := TfrmCadTipoAtend.create(application);
  frmCadTipoAtend.ShowModal;
end;

procedure TfrmPrincipal.Grupos1Click(Sender: TObject);
begin
  frmCadGrupoEx := TfrmCadGrupoEx.create(application);
  frmCadGrupoEx.ShowModal;
end;

procedure TfrmPrincipal.Cadastro3Click(Sender: TObject);
begin
  frmCadExames := TfrmCadExames.create(application);
  frmCadExames.ShowModal;
end;

procedure TfrmPrincipal.btnCadConvClick(Sender: TObject);
begin
  frmCadConv := TfrmCadConv.create(application);
  frmCadConv.ShowModal;
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  Topo := 0;
end;

procedure TfrmPrincipal.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  dmDados.BaseDados.Connected := False;
end;

procedure TfrmPrincipal.FormShow(Sender: TObject);
begin
  dmDados.BaseDados.Connected := True;
  Topo:= -1;
  ListaTeclas:='[F1] Ajuda [F2] Pacientes [F3] Cov�nios [F4] Agenda [F6] Odontograma [F7] Or�amento [ESC] Sai';
  StatusTeclas(True,ListaTeclas);
  dmDados.BaseDados.Connected := True;
  dmDados.tbSenha.Open;
  if table1.RecordCount=1 then  //obriga o cadastro de senha no 1� uso
    begin
    frmCadSenha:=tfrmCadSenha.create(application);
    frmCadSenha.showModal;
    end;
  evPassword1.Execute;
  UserAcess.UserID:=frmPrincipal.Acesso;
  UserAcess.ForceDefinitions;
end;

procedure TfrmPrincipal.Grupo1Click(Sender: TObject);
begin
  frmCadGrupo := TfrmCadGrupo.create(application);
  frmCadGrupo.ShowModal;
end;

procedure TfrmPrincipal.SubGrupo1Click(Sender: TObject);
begin
  frmCadSubGrupo := TfrmCadSubGrupo.create(application);
  frmCadSubGrupo.ShowModal;
end;

procedure TfrmPrincipal.Unidade1Click(Sender: TObject);
begin
  frmCadUnidade := TfrmCadUnidade.create(application);
  frmCadUnidade.ShowModal;
end;

procedure TfrmPrincipal.Marca1Click(Sender: TObject);
begin
  frmCadMarca := TfrmCadMarca.create(application);
  frmCadMarca.ShowModal;
end;

procedure TfrmPrincipal.Cadastro2Click(Sender: TObject);
begin
  frmCadMaterial := TfrmCadMaterial.create(application);
  frmCadMaterial.ShowModal;
end;

procedure TfrmPrincipal.Entrada1Click(Sender: TObject);
begin
  frmEntrMat := TfrmEntrMat.create(application);
  frmEntrMat.ShowModal;
end;

procedure TfrmPrincipal.Sada1Click(Sender: TObject);
begin
  frmSaidaMat := TfrmSaidaMat.create(application);
  frmSaidaMat.ShowModal;
end;

procedure TfrmPrincipal.Estatstica1Click(Sender: TObject);
begin
  frmEstatistica := TfrmEstatistica.create(application);
  frmEstatistica.ShowModal;
end;

procedure TfrmPrincipal.ControlePatrimonial1Click(Sender: TObject);
begin
  frmEquipo := TfrmEquipo.create(application);
  frmEquipo.ShowModal;
end;

procedure TfrmPrincipal.Compra2Click(Sender: TObject);
begin
  frmCadCompra := TfrmCadCompra.create(application);
  frmCadCompra.ShowModal;
end;

procedure TfrmPrincipal.Histrico1Click(Sender: TObject);
begin
  frmCadHistorico := tfrmCadHistorico.create(application);
  frmCadHistorico.showModal;
end;

procedure TfrmPrincipal.ipodeDocumento1Click(Sender: TObject);
begin
  frmCadTipoDoc := tfrmCadTipoDoc.create(application);
  frmCadTipoDoc.showModal;
end;

procedure TfrmPrincipal.Bancos1Click(Sender: TObject);
begin
  frmCadBanco := TfrmCadBanco.Create(application);
  frmCadBanco.ShowModal;
end;

procedure TfrmPrincipal.ContaCorrente1Click(Sender: TObject);
begin
  frmCadCCorrente := TfrmCadCCorrente.Create(application);
  frmCadCCorrente.ShowModal;
end;

procedure TfrmPrincipal.Cidade1Click(Sender: TObject);
begin
  frmCadCidade := TfrmCadCidade.create(application);
  frmCadCidade.ShowModal;
end;

procedure TfrmPrincipal.CartesConvnios1Click(Sender: TObject);
begin
  frmCadCartao := TfrmCadCartao.create(application);
  frmCadCartao.ShowModal;
end;

procedure TfrmPrincipal.ndicesFinanceiros1Click(Sender: TObject);
begin
  frmCadIndice := TfrmCadIndice.create(application);
  frmCadIndice.ShowModal;
end;

procedure TfrmPrincipal.PlanosdePagamento1Click(Sender: TObject);
begin
  frmCadPlanoPagto := TfrmCadPlanoPagto.create(application);
  frmCadPlanoPagto.ShowModal;
end;

procedure TfrmPrincipal.Lanamento1Click(Sender: TObject);
begin
  frmCPagar := TfrmCPagar.create(application);
  frmCPagar.ShowModal;
end;

procedure TfrmPrincipal.RecebimentodeContas1Click(Sender: TObject);
begin
  frmBaixaLoteCP := TfrmBaixaLoteCP.create(application);
  frmBaixaLoteCP.ShowModal;
end;

procedure TfrmPrincipal.Lanamento2Click(Sender: TObject);
begin
  frmCReceber := TfrmCReceber.create(application);
  frmCReceber.ShowModal;
end;

procedure TfrmPrincipal.RecebimentodeContas2Click(Sender: TObject);
begin
  frmBaixaLoteCR := TfrmBaixaLoteCR.create(application);
  frmBaixaLoteCR.ShowModal;
end;

procedure TfrmPrincipal.CancelamentodeContas1Click(Sender: TObject);
begin
  frmCancelCP := TfrmCancelCP.create(application);
  frmCancelCP.ShowModal;
end;

procedure TfrmPrincipal.CancelamentodeContas2Click(Sender: TObject);
begin
  frmCancelCR := TfrmCancelCR.create(application);
  frmCancelCR.ShowModal;
end;

procedure TfrmPrincipal.Configurao1Click(Sender: TObject);
begin
  frmConfigAnamnese := TfrmConfigAnamnese.create(application);
  frmConfigAnamnese.ShowModal;
end;

procedure TfrmPrincipal.MudarAparncia1Click(Sender: TObject);
begin
  opd1.InitialDir:='..\skins';//ExtractFilePath(ParamStr(0));
  opd1.Filter:= 'Text files (*.skn)|*.skn';
  if opd1.Execute then begin
     sd1.SkinFile:=opd1.FileName;
  end;
end;

procedure TfrmPrincipal.FichaCadastral1Click(Sender: TObject);
begin
  frmRelPac := TfrmRelPac.create(application);
  frmRelPac.ShowModal;
end;

procedure TfrmPrincipal.Funcionrio3Click(Sender: TObject);
begin
  frmRelFunc := TfrmRelFunc.create(application);
  frmRelFunc.ShowModal;
end;

procedure TfrmPrincipal.Fornecedor2Click(Sender: TObject);
begin
  frmRelFornec := TfrmRelFornec.create(application);
  frmRelFornec.ShowModal;
end;

procedure TfrmPrincipal.DadosCadastrais2Click(Sender: TObject);
begin
  frmRelProtetico := TfrmRelProtetico.create(application);
  frmRelProtetico.ShowModal;
end;

procedure TfrmPrincipal.Aniversariantes1Click(Sender: TObject);
begin
  frmAnive := TfrmAnive.create(application);
  frmAnive.ShowModal;
end;

procedure TfrmPrincipal.EvPassword1AfterInput(Sender: TObject);
begin
  Table1.Close;
end;

procedure TfrmPrincipal.EvPassword1BeforeInput(Sender: TObject);
begin
  table1.Open;
end;

procedure TfrmPrincipal.EvPassword1Error(Sender: TObject;
  Error: TEvPasswordError);
begin
  MsgDlg.MsgWarning('Nome de Usu�rio e Senha n�o correspondem!.|A aplica��o ser� terminada.');
  Application.Terminate;
end;

procedure TfrmPrincipal.EvPassword1Validate(Sender: TObject; UserName,
  Password: String; var Valid: Boolean);
begin
  if Table1.FindKey([username]) then
    begin
    Valid  := EvCripto.CriptoBinToText(Table1senha.AsString) = Password;
    Acesso := StrtoInt(Table1TipoAcesso.Value);
    User   := Table1Usuario.Value;
    end
  else
    ShowMessage('O nome de usu�rio e senha informado n�o s�o v�lidos.');
end;

procedure TfrmPrincipal.btnCRClick(Sender: TObject);
begin
  frmCReceber := TfrmCReceber.create(application);
  frmCReceber.ShowMOdal;
end;

procedure TfrmPrincipal.btnCPClick(Sender: TObject);
begin
  frmCPagar := TfrmCPagar.create(application);
  frmCPagar.ShowModal;
end;

procedure TfrmPrincipal.UsuriodoSistema1Click(Sender: TObject);
begin
  frmCadSenha := TfrmCadSenha.create(application);
  frmCadSenha.ShowModal;
end;

procedure TfrmPrincipal.MudarUsurio1Click(Sender: TObject);
begin
  EvPassword1.Execute;
  UserAcess.UserID := frmPrincipal.Acesso;
  UserAcess.ForceDefinitions;
end;

procedure TfrmPrincipal.FormActivate(Sender: TObject);
begin
  if (frmPrincipal.Acesso=1) then
    begin
    btnOdonto.Enabled    := True;
    btnOrcamento.Enabled := True;
    end
  else
    btnOdonto.Enabled    := False;
    btnOrcamento.Enabled := False;
end;

procedure TfrmPrincipal.Lanamento5Click(Sender: TObject);
begin
  frmLanCheque := TfrmLanCheque.create(application);
  frmLanCheque.ShowModal;
end;

procedure TfrmPrincipal.Baixa1Click(Sender: TObject);
begin
  FrmBaixaCheque:=TFrmbaixaCheque.create(application);
  FrmBaixaCheque.ShowModal;
end;

procedure TfrmPrincipal.ChequesemFundos1Click(Sender: TObject);
begin
  FrmLanChequeSF:=TFrmLanChequeSF.create(application);
  FrmLanChequeSF.ShowModal;
end;

procedure TfrmPrincipal.RenegociarCheques1Click(Sender: TObject);
begin
  FrmRengCheque:=TFrmRengCheque.create(application);
  FrmRengCheque.ShowModal;
end;

procedure TfrmPrincipal.Consultar1Click(Sender: TObject);
begin
  FrmConsultaCPF:=TFrmConsultaCPF.create(application);
  FrmConsultaCPF.ShowModal;
end;

procedure TfrmPrincipal.ChequesemAberto1Click(Sender: TObject);
begin
  frmRelCheAberto:=TfrmRelCheAberto.create(application);
  frmRelCheAberto.showModal;
end;

procedure TfrmPrincipal.ChequesDevolvidos1Click(Sender: TObject);
begin
  frmRelCheDev:=TfrmRelCheDev.create(application);
  frmRelCheDev.show;
end;

procedure TfrmPrincipal.ChequesDevolvidosporCliente1Click(Sender: TObject);
begin
  frmRelCheDevCli:=TfrmRelCheDevCli.create(application);
  frmRelCheDevCli.showModal;
end;

procedure TfrmPrincipal.ContasaReceber2Click(Sender: TObject);
begin
  frmRelCReceber := TfrmRelCReceber.Create(Application);
  frmRelCReceber.ShowModal;
end;

procedure TfrmPrincipal.Lanamento4Click(Sender: TObject);
begin
  FrmMovCaixa:=TFrmMovCaixa.create(application);
  FrmMovCaixa.ShowModal;
end;

procedure TfrmPrincipal.Fechamento2Click(Sender: TObject);
begin
  FrmFechCC:=TFrmFechCC.create(application);
  FrmFechCC.showModal;
end;

procedure TfrmPrincipal.SaldoseExtratos1Click(Sender: TObject);
begin
  frmRelMovConta:=tfrmRelMovConta.create(application);
  frmRelMovConta.showmodal;
end;

procedure TfrmPrincipal.ContasaPagar2Click(Sender: TObject);
begin
  FrmRelCpagar:=TFrmRelCpagar.create(application);
  FrmRelCpagar.showmodal;
end;

procedure TfrmPrincipal.Mercadoria1Click(Sender: TObject);
begin
  frmRelEstoque:=tfrmRelEstoque.Create(Application);
  frmRelEstoque.ShowModal;
end;

procedure TfrmPrincipal.FornecedoreporPerodo1Click(Sender: TObject);
begin
  frmRelCompPer:=TfrmRelCompPer.Create(Application);
  frmRelCompPer.ShowModal;
end;

procedure TfrmPrincipal.Compra1Click(Sender: TObject);
begin
  frmRelCompras:=TfrmRelCompras.Create(Application);
  frmRelCompras.ShowModal;
end;

procedure TfrmPrincipal.Procedimentos1Click(Sender: TObject);
begin
  frmCadProced:=TfrmCadProced.Create(Application);
  frmCadProced.ShowModal;
end;

end.
