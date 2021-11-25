//////////////////////////////////////////////////////////////////////////
// Criacao...........: 08/2008
// Sistema...........: Atena - Automacao Clinica Odontologica
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit untCadBanco;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, EMsgDlg, JvTransBtn, Grids, DBGrids, RXDBCtrl, StdCtrls, Mask,
  DBCtrls, JvLabel, JvComponent, JvEnterTab, fcLabel, ExtCtrls, fcpanel, DB,
  DBTables;

type
  TfrmCadBanco = class(TForm)
    pnTop: TfcPanel;
    fcLabel2: TfcLabel;
    JvEnterAsTab2: TJvEnterAsTab;
    pnCentro: TfcPanel;
    JvLabel1: TJvLabel;
    JvLabel10: TJvLabel;
    GridBanco: TRxDBGrid;
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
    dbBanco: TDBEdit;
    dbNumBanco: TDBEdit;
    MsgDlg: TEvMsgDlg;
    procedure btnSairClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbNumBancoExit(Sender: TObject);
    procedure dbBancoExit(Sender: TObject);
    procedure btnPrimeiroClick(Sender: TObject);
    procedure btnAnteriorClick(Sender: TObject);
    procedure btnProximoClick(Sender: TObject);
    procedure btnUltimoClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnDeletarClick(Sender: TObject);
  private
    { Private declarations }
    fOutraJan : Boolean;
  public
    { Public declarations }
    property OutraJan : Boolean read fOutraJan write fOutraJan;
  end;

var
  frmCadBanco : TfrmCadBanco;
  NovoItem    : Boolean     ;

implementation

uses untdmDados, untPrincipal;

{$R *.dfm}

procedure TfrmCadBanco.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmCadBanco.FormActivate(Sender: TObject);
begin
  FrmPrincipal.StatusTeclas(True,'[Insert] Novo [Home] Alterar [End] Gravar [Delete] Excluir [Esc] Cancelar ou Sair');
    dmDados.vTabStt := True;
  if dmDados.tbBanco.State     = dsInactive then
    dmDados.tbBanco.Open;
  if dmDados.TbCCorrente.State = dsInactive then
    dmDados.TbCCorrente.Open;
  if dmdados.tbBanco.RecordCount=0 then
    begin
    btnPrimeiro.Enabled := False;
    btnAnterior.Enabled := False;
    btnProximo.Enabled  := False;
    btnUltimo.Enabled   := False;
    btnAlterar.Enabled  := False;
    btnGravar.Enabled   := False;
    btnCancelar.Enabled := False;
    BtnDeletar.Enabled  := False;
    end;
  if (frmPrincipal.Acesso=1) then
    btnDeletar.Enabled := True
  else
    btnDeletar.Enabled := False;
end;

procedure TfrmCadBanco.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FrmPrincipal.StatusTeclas(False,'');
  if (not OutraJan) then
    begin
    dmDados.tbBanco.Close;
    dmDados.TbCCorrente.Close;
    end;
  Action := Cafree;
end;

procedure TfrmCadBanco.FormCreate(Sender: TObject);
begin
  OutraJan := False;
end;

procedure TfrmCadBanco.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   case (key) of
     // Teclas de a��o na tabela
     VK_Insert : if (dmDados.vTabStt) then BtnNovo.Click;
     VK_Home   : if (dmDados.vTabStt) then BtnAlterar.Click;
     VK_Delete : if ((dmDados.vTabStt) and (frmPrincipal.Acesso = 1))
                   then btnDeletar.Click;
     VK_End    : if not(dmDados.vTabStt) then btnGravar.Click;
     VK_ESCAPE : if not(dmDados.vTabStt) then BtnCancelar.Click
                 else BtnSair.Click;
   end;
end;

procedure TfrmCadBanco.dbNumBancoExit(Sender: TObject);
Var
  Tabela: TTable;
begin
  Tabela := TTable.Create(Application);
  Tabela.DatabaseName := dmDados.TbBanco.DatabaseName;
  Tabela.TableName    := dmDados.TbBanco.TableName   ;
  Tabela.IndexName    := dmdados.tbBanco.IndexName   ;
  Tabela.Open;
  if NovoItem then
    if dbNumBanco.Text= '' then
      begin
      MsgDlg.MsgError('� obrigat�rio o N.� Banco!');
      dbNumBanco.SetFocus;
      end
    else
      if Tabela.Locate('NumBanco',dbNumBanco.Text,[]) then
        if not ((DmDados.tbBanco.State=dsEdit) And (dmDados.tbBanco.RecNo = Tabela.RecNo)) then
          begin
          MsgDlg.MsgWarning('N�mero j� Cadastrado!');
          dbNumBanco.Clear;
          dbNumBanco.setfocus;
          end;
  tabela.Free;
end;

procedure TfrmCadBanco.dbBancoExit(Sender: TObject);
Var
  Tabela: TTable;
begin
  Tabela := TTable.Create(Application);
  Tabela.DatabaseName := dmDados.TbBanco.DatabaseName;
  Tabela.TableName    := dmDados.TbBanco.TableName   ;
  Tabela.IndexName    := dmdados.tbBanco.IndexName   ;
  Tabela.Open;
  if NovoItem then
    if dbBanco.Text = '' then
      begin
      MsgDlg.MsgError('� necess�rio Informar o BANCO');
      DbBanco.setfocus;
      end
    else
      if Tabela.Locate('NomeBanco',dbBanco.Text,[]) then
        if not ((DmDados.tbBanco.State=dsEdit) And (dmDados.tbBanco.RecNo = Tabela.RecNo)) then
          begin
          MsgDlg.MsgWarning('Banco j� cadastrado');
          dbBanco.Clear;
          dbBanco.setfocus;
          end;
  Tabela.Free;
end;

procedure TfrmCadBanco.btnPrimeiroClick(Sender: TObject);
begin
  dmdados.TbBanco.First;
  Btnprimeiro.Enabled := False;
  BtnAnterior.Enabled := False;
  BtnProximo.Enabled  := True ;
  BtnUltimo.Enabled   := True ;
end;

procedure TfrmCadBanco.btnAnteriorClick(Sender: TObject);
begin
  dmdados.TbBanco.Prior;
  BtnProximo.Enabled := True;
  BtnUltimo.Enabled  := True;
  if dmdados.TbBanco.bof then
    begin
    BtnPrimeiro.Enabled := False;
    BtnAnterior.Enabled := False;
    end;
end;

procedure TfrmCadBanco.btnProximoClick(Sender: TObject);
begin
  dmdados.TbBanco.next;
  BtnPrimeiro.Enabled := True;
  BtnAnterior.Enabled := True;
  if dmdados.TbBanco.Eof then
    begin
    BtnProximo.Enabled := False;
    BtnUltimo.Enabled  := False;
    end;
end;

procedure TfrmCadBanco.btnUltimoClick(Sender: TObject);
begin
  dmdados.TbBanco.last;
  BtnPrimeiro.Enabled := True ;
  BtnAnterior.Enabled := True ;
  BtnProximo.Enabled  := False;
  BtnUltimo.Enabled   := False;
end;

procedure TfrmCadBanco.btnNovoClick(Sender: TObject);
begin
  dmDados.tbBanco.Append;
  NovoItem := True;
  dmdados.vTabStt := False;
  {habilitando os bot�es}
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
  dbNumbanco.Enabled := True;
  dbBanco.Enabled    := True;
  dbNumbanco.SetFocus;
end;

procedure TfrmCadBanco.btnGravarClick(Sender: TObject);
Var
  Campos:String;
  Vazio,Gravar:Boolean;
  tabela: ttable;
begin
  Campos:='';
  Gravar:=True;
  Vazio:=False;
  Tabela := TTable.Create(Application);
  Tabela.DatabaseName := dmDados.TbBanco.DatabaseName;
  Tabela.TableName := dmDados.TbBanco.TableName;
  Tabela.IndexName := dmdados.tbBanco.IndexName;
  Tabela.Open;
	if dbNumbanco.Text='' then
  	begin
    if Length(Campos)>0 then Campos:=Campos+', ';
    Campos:=Campos+'N�mero do Banco';
    Gravar:=False;
    Vazio:=True;
    end
  else
    if Tabela.Locate('NumBanco',dbNumbanco.Text,[]) Then
      if not((DmDados.tbBanco.State=dsEdit) And (dmDados.tbBanco.RecNo = Tabela.RecNo)) then
        begin
        Gravar:=False;
        MsgDlg.MsgWarning('N�mero j� cadastrado');
        dbNumbanco.SetFocus;
        end;
	if dbBanco.Text='' then
  	begin
    if Length(Campos)>0 then Campos:=Campos+', ';
    Campos:=Campos+'Banco';
    Gravar:=False;
    Vazio:=True;
  	End
  else
    if Tabela.Locate('NomeBanco',dbBanco.Text,[]) then
      if not((DmDados.tbBanco.State=dsEdit) And (dmDados.tbBanco.RecNo = Tabela.RecNo)) then
        begin
        Gravar:=False;
        MsgDlg.MsgWarning('Banco j� cadastrado');
        dbBanco.SetFocus;
        end;
  if gravar then
    begin
    NovoItem := False;
    dmdados.tbBanco.Post;
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
    if (frmPrincipal.Acesso=1) then
     btnDeletar.Enabled := True
    else
      btnDeletar.Enabled := False;
    //Desabilitando os componentes
    dbNumbanco.Enabled  := False;
    dbBanco.Enabled     := False;
    MsgDlg.MsgInformation('Dados gravados com sucesso!');
    pnBotoes.SetFocus;
    end
  else
    begin
    if Vazio then
      MsgDlg.MsgWarning('O(s) Campo(s) '+Campos+' n�o tem Valor(es) ');
    dbNumbanco.Enabled:=true;
    end;
  tabela.Free;
end;

procedure TfrmCadBanco.btnCancelarClick(Sender: TObject);
begin
  dmdados.tbBanco.cancel;
  NovoItem := False;
  dmdados.vTabStt := True;
  {Desabilitando os bot�es}
  BtnGravar.enabled   := False;
  BtnCancelar.Enabled := False;
  BtnNovo.Enabled     := True ;
  BtnPrimeiro.Enabled := True ;
  BtnAnterior.Enabled := True ;
  Btnproximo.Enabled  := True ;
  BtnUltimo.Enabled   := True ;
  BtnAlterar.Enabled  := True ;
  BtnDeletar.Enabled  := True ;
  if (frmPrincipal.Acesso=1) then
    btnDeletar.Enabled := True
  else
    btnDeletar.Enabled := False;
  {Habilitando os componentes}
  dbNumbanco.Enabled := False;
  dbBanco.enabled    := False;
  pnBotoes.SetFocus;
end;

procedure TfrmCadBanco.btnAlterarClick(Sender: TObject);
begin
  novoitem := True;
  dmdados.vTabStt := False;
  dmdados.tbBanco.Edit;
  //habilitar bot�es
  BtnCancelar.Enabled := True ;
  BtnGravar.Enabled   := True ;
  BtnNovo.Enabled     := False;
  BtnPrimeiro.Enabled := False;
  BtnAnterior.Enabled := False;
  BtnProximo.Enabled  := False;
  BtnUltimo.Enabled   := False;
  BtnAlterar.Enabled  := False;
  Btndeletar.Enabled  := False;
  //habilitar objetos
  dbNumbanco.Enabled := True;
  dbBanco.Enabled    := True;
  dbNumbanco.SetFocus;
end;

procedure TfrmCadBanco.btnDeletarClick(Sender: TObject);
begin
  NovoItem := False;
  if dmdados.tbBanco.RecordCount=0 then
    MsgDlg.MsgInformation('Tabela sem registro')
  else
    if MsgDlg.MsgConfirmation('Tem certeza que deseja excluir esse registro?') = id_yes then
      if dmDados.TbCCorrente.Locate('NumBanco',dmDados.tbBancoNumBanco.Value,[]) then
        MsgDlg.MsgWarning('Banco com Conta Corrente Ativa, n�o pode ser exclu�do !!!')
     else
        dmdados.tbBanco.Delete;
end;

end.
